"""
Trace classes for PDDL action model synthesis from execution traces.

This module provides data structures that wrap sequences of (state, action) pairs
sampled from a planning domain. The system uses these traces to learn action models:
  - Which predicates appear as preconditions of each action
  - Which predicates are added/deleted as effects
  - How action arguments map to predicate arguments

The learning process works with intentionally hidden ("dropped") action arguments
and predicates. The system attempts to recover the full action model despite these
omissions by extending actions with inferred arguments.

Key data structures used throughout:
  - action_object_list[t][p]: object index at argument position p of the action at trace step t
  - action_arity[name]: current number of argument positions for action "name"
    (grows as hidden arguments are recovered)
  - predicate_arity: list of (predicate_name, arity) pairs from the domain
  - affected_object_list[t][sign][pred][pos]: set of object indices that appear at
    predicate position pos in sign (POS=add, NEG=delete) effects of action at step t
  - affected_tuple_list[t][sign][pred]: set of full ground-atom tuples in the effects

Argument mappings (used for preconditions and effects):
  A mapping like (2, 0) means "predicate arg 0 comes from action arg 2,
  predicate arg 1 comes from action arg 0". These are filtered against trace
  observations to find which mappings are consistent with all observed transitions.

Masked patterns:
  Partially-grounded precondition patterns where some predicate positions are
  bound to action arguments and others (None) are existentially quantified.
  E.g., (0, None) means "there exists some object x such that pred(action_arg_0, x) holds".
"""

import copy
import itertools
import typing
from collections import defaultdict
from functools import lru_cache
from typing_extensions import override

import networkx as nx
from py_separator_utils.synth_dependencies.mimir_things import mimir_thing


# Effect signs: NEG = delete effect, POS = add effect
NEG, POS = 0, 1


class Trace:
    """A sampled execution trace from a planning domain.

    Wraps a sequence of (state, action) pairs and provides methods to:
      - Recover hidden action arguments (add_arguments / is_contained_in_positions)
      - Determine which argument mappings are consistent with observed preconditions
      - Determine which argument mappings are consistent with observed effects
      - Parse states into predicate-mask dictionaries for feature extraction

    Attributes:
        length: Number of actions in the trace.
        problem: The mimir planning problem providing domain access.
        dropped_args: dict mapping action_name -> set of hidden argument positions,
            or None if no arguments are hidden.
        dropped_preds: set of predicate names excluded from learning.
        validation: If True, add_arguments always accepts (used by ValidationTrace).

        state_trace: List of state objects (length + 1 states for length actions).
        action_trace: List of ground action objects.
        action_name_list: List of action names, one per trace step.
        action_object_list: List of argument lists, one per trace step.
            Each inner list grows as hidden arguments are recovered.
        action_arity: dict of action_name -> current arity (grows during learning).

        hidden_action_arity: dict of action_name -> original arity (ground truth).
        hidden_action_object_trace: Original action arguments before dropping
            (used by check_final_args to verify recovery).

        initial_action_object_list: Snapshot of action_object_list after dropping
            but before argument extension (used by CopiedTrace).
        initial_arities: Snapshot of action_arity before extension.

        argument_queries: dict of action_name -> {position -> query_descriptor}.
            Records which query/feature was used to infer each extended argument.

        affected_object_list: Per-step, per-sign, per-predicate, per-position sets
            of affected object indices.
        affected_tuple_list: Per-step, per-sign, per-predicate sets of full
            ground-atom tuples appearing in effects.

        effect_mapping: Learned mapping from action arguments to effect predicates.
            Structure: {sign: {action: {predicate: set of argument-position tuples}}}.

        candidate_dict: Mask-based pattern dictionaries for state parsing,
            grouped by predicate arity.

        grounding_preconditions_pos/neg: Possible positive/negative precondition
            argument mappings, filtered by trace observations.
        mask_pre_pos/neg: Possible masked (partially-grounded) precondition patterns.

        predicate_types: Type information for predicates in the trace states.
        types_list: List of type predicate names loaded from a file.
    """

    def __init__(self, length: int, problem: mimir_thing, dropped_args: dict,
                 predicate_arity: dict, dropped_pred: set, typelist):
        self.length = length
        self.problem = problem
        self.dropped_args = dropped_args
        self.dropped_preds = dropped_pred
        self.validation = False

        # Sample a random trace of the given length from the initial state
        self.state_trace, self.action_trace = self.problem.sample_trace_from_init(self.length)
        self._init_from_trace_data(predicate_arity, typelist)

    def _init_from_trace_data(self, predicate_arity, typelist):
        """Shared initialization after state_trace and action_trace are set.

        Used by both Trace (random walk) and ExtendedTrace (full state-space exploration).
        Expects self.state_trace, self.action_trace, self.problem, self.dropped_args,
        self.dropped_preds, and self.validation to be set before calling.
        """
        # Decode action names and object indices from the ground action objects
        self.action_name_list = [
            self.problem.get_action_name_by_index(action.get_action_index())
            for action in self.action_trace
        ]
        self.action_object_list = [action.get_object_indices() for action in self.action_trace]
        self.action_arity = dict(self.problem.get_action_arity())

        # Save ground-truth arguments before we drop anything — used later to
        # verify whether the learning process successfully recovered all arguments
        self.hidden_action_arity = self.action_arity.copy()
        self.hidden_action_object_trace = [lst.copy() for lst in self.action_object_list]

        self.parsed_state_dict = {}
        self.predicate_arity = predicate_arity
        self.predicate_arity_dict = {name: arity for (name, arity) in self.predicate_arity}

        # Remove hidden argument positions from the visible action data
        self._apply_dropped_args()

        # Snapshot the post-drop / pre-extension state for CopiedTrace to use
        self.initial_action_object_list = [lst.copy() for lst in self.action_object_list]
        self.initial_arities = self.action_arity.copy()

        # Lookup table: action_name -> [trace indices where that action appears]
        self._action_indices = self._build_action_indices()

        # Track which query/feature inferred each extended argument position.
        # Starts with None for all original (non-dropped) positions.
        self.argument_queries = {
            action: {ar: None for ar in range(arity)}
            for action, arity in self.action_arity.items()
        }

        # Extract ground effects of each action in the trace.
        # affected_object_list[t][sign][pred][pos] = set of object indices
        # affected_tuple_list[t][sign][pred] = set of full tuples
        self.affected_object_list = []
        self.affected_tuple_list = []
        for action in self.action_trace:
            position_dict, tuple_dict = self._extract_effects(action)
            self.affected_object_list.append(position_dict)
            self.affected_tuple_list.append(tuple_dict)

        # Will be populated by get_effect_argument_positions()
        self.effect_mapping = set()

        # Build mask-based pattern dictionaries for state parsing and
        # initialize them with static predicates
        self.candidate_dict = self.predicate_patterns()
        self.problem.initialize_state_with_statics(self.candidate_dict)

        # Compute which argument mappings are consistent with observed
        # preconditions across all trace steps
        self.grounding_preconditions_pos, self.grounding_preconditions_neg, \
            self.mask_pre_pos, self.mask_pre_neg = self._compute_grounding_preconditions()

        # Load type predicate names (predicates that encode object types
        # rather than fluent state, e.g. "is-car", "is-location")
        self.types_list = self._load_type_list(typelist)

        self.predicate_types = None
        self.set_predicate_types()

    def _build_action_indices(self):
        """Build mapping from action name to sorted list of trace indices.

        Used to avoid repeatedly scanning action_name_list when we need
        "all trace positions where action X appears".
        """
        indices = defaultdict(list)
        for i, name in enumerate(self.action_name_list):
            if name is not None:
                indices[name].append(i)
        return dict(indices)

    def _apply_dropped_args(self):
        """Remove dropped argument positions from action objects and adjust arities.

        Simulates a setting where some action parameters are unobservable.
        For example, if move(robot, from, to) has dropped_args={1}, the visible
        arguments become [robot, to] and arity decreases from 3 to 2.
        """
        if self.dropped_args is None:
            return
        for num, name in enumerate(self.action_name_list):
            if name in self.dropped_args:
                dropped = self.dropped_args[name]
                self.action_object_list[num] = [
                    val for pos, val in enumerate(self.action_object_list[num])
                    if pos not in dropped
                ]
        for name, dropped in self.dropped_args.items():
            self.action_arity[name] -= len(dropped)

    @staticmethod
    def _load_type_list(list_location):
        """Load type predicate names from a file (one per line)."""
        if list_location is None:
            return []
        with open(list_location, "r", encoding="utf-8") as f:
            return [line.strip() for line in f if line.strip()]

    # -- Iteration --

    def __iter__(self):
        """Iterate over trace step indices [0, 1, ..., length-1]."""
        return iter(range(self.length))

    # -- Predicate types --

    def set_predicate_types(self):
        self.predicate_types = self.problem.set_predicate_types_for_trace(self.state_trace)

    def get_predicate_types(self):
        return self.predicate_types

    # -- Effect extraction --

    def _extract_effects(self, action):
        """Extract ground effects of a single action into two representations.

        Returns:
            per_position: {sign: {pred_name: {pred_pos: set of object indices}}}
                For each effect predicate position, which objects appeared there.
            tuples: {sign: {pred_name: set of full object-index tuples}}
                The complete ground atoms in the effects.
        """
        per_position = {NEG: {}, POS: {}}
        tuples = {NEG: {}, POS: {}}

        effect_atoms = {
            POS: self.problem.pddl_repo.get_fluent_ground_atoms_from_indices(
                action.get_strips_effect().get_positive_effects()),
            NEG: self.problem.pddl_repo.get_fluent_ground_atoms_from_indices(
                action.get_strips_effect().get_negative_effects()),
        }

        for sign, atoms in effect_atoms.items():
            for atom in atoms:
                name = atom.get_predicate().get_name()
                if name in self.dropped_preds:
                    continue
                objs = tuple(x.get_index() for x in atom.get_objects())

                if name in per_position[sign]:
                    try:
                        for obj_pos, obj in enumerate(objs):
                            per_position[sign][name][obj_pos].add(obj)
                        tuples[sign][name].add(objs)
                    except KeyError:
                        raise NotImplementedError(
                            "Predicate arity changed unexpectedly")
                else:
                    tuples[sign][name] = {objs}
                    per_position[sign][name] = {
                        obj_pos: {obj} for obj_pos, obj in enumerate(objs)
                    }

        return per_position, tuples

    # -- State parsing --

    def reset_parsed_dict(self):
        """Clear the cached parsed-state dictionary.

        Called between learning iterations when the candidate_dict changes
        (e.g. after argument extension), so states are re-parsed with the
        updated mask structure.
        """
        pass

    def parse_state(self, trace_position):
        """Parse and cache the state at the given trace position.

        Converts a raw state into a nested dictionary indexed by
        (predicate_arity, predicate_name, mask, partial_grounding) -> count.
        Results are cached by state identity to avoid redundant parsing.
        """
        state = self.state_trace[trace_position]
        if state not in self.parsed_state_dict:
            self.parsed_state_dict[state] = self.problem.parse_state_with_dicts(
                copy.deepcopy(self.candidate_dict), state)
        return self.parsed_state_dict[state]

    # -- Simple accessors --

    def get_action_name(self, index):
        return self.action_name_list[index]

    def get_action_objects(self, index):
        return self.action_object_list[index]

    def get_state_of_index(self, index):
        return self.state_trace[index]

    def get_effect_mapping(self):
        return self.effect_mapping

    def set_effect_mapping(self, effect_mapping):
        self.effect_mapping = effect_mapping

    def get_queries(self):
        return self.argument_queries

    # -- Print helpers --

    def print_action_arity(self):
        print(self.action_arity)

    def print_query_output(self):
        for action in self.argument_queries:
            for position, query in self.argument_queries[action].items():
                print(f'The {position}. argument of the action {action} refers to the query {query}')

    # -- Argument management --

    def add_arguments(self, argument_dict, action_name, query):
        """Extend an action with a newly inferred argument column.

        When the learning algorithm discovers a pattern (e.g. a z-feature) that
        identifies a hidden object for each trace step, it calls this method to
        add that object as a new argument position to the action.

        Args:
            argument_dict: {trace_index: object_index} — the inferred object for
                each trace step where this action appears.
            action_name: Name of the action to extend.
            query: Descriptor of the feature/query that produced this argument
                (stored for traceability).

        Returns:
            True if the argument was new and added (or always True in validation mode).
            False if all values are identical across steps (uninformative) or if
            the column already exists at some position.
        """
        # Reject constant arguments (same object at every step) — they carry
        # no information about the action's parameterization
        if len(set(argument_dict.values())) == 1 and not self.validation:
            return False

        already_contained = self._arguments_already_contained(argument_dict, action_name)

        if not already_contained or self.validation:
            # Record which query inferred this position
            self.argument_queries[action_name][self.action_arity[action_name]] = query
            # Append the new object to each step's argument list
            for action_number, new_arg in argument_dict.items():
                self.action_object_list[action_number].append(new_arg)
            self.action_arity[action_name] += 1

        return True if self.validation else not already_contained

    def _arguments_already_contained(self, argument_dict, action_name):
        """Check if argument_dict matches any existing argument position.

        An argument column "matches" position p if, for every trace step in
        argument_dict, the proposed object equals action_object_list[step][p].
        """
        items = tuple(argument_dict.items())
        for pos in range(self.action_arity[action_name]):
            if all(self.action_object_list[idx][pos] == val for idx, val in items):
                return True
        return False

    def is_contained_in_positions(self, argument_dict, action_name):
        """Return all argument positions where argument_dict matches.

        Like _arguments_already_contained, but returns the set of matching
        positions instead of a boolean. Used to determine which existing
        argument position a feature corresponds to.
        """
        items = tuple(argument_dict.items())
        return {
            pos for pos in range(self.action_arity[action_name])
            if all(self.action_object_list[idx][pos] == val for idx, val in items)
        }

    def check_final_args(self):
        """Verify that argument recovery was successful.

        Compares the learned (extended) action arguments against the hidden
        ground-truth arguments. Reports:
          - Missing arguments: ground-truth columns not recovered
          - Extra arguments: learned columns not in the ground truth

        Returns:
            (missing_arguments, extra_arguments) counts.
        """
        missing_arguments = 0
        for action, arity in self.hidden_action_arity.items():
            # For each ground-truth argument position, check if some learned
            # position reproduces it across all trace steps of this action
            indices = self._action_indices.get(action, [])
            for ar in range(arity):
                found = False
                for pos in range(self.action_arity[action]):
                    if all(
                        self.hidden_action_object_trace[i][ar] == self.action_object_list[i][pos]
                        for i in indices
                    ):
                        found = True
                        break
                if not found:
                    print(f"The objects in position {ar} of action {action} are missing in the trace!")
                    missing_arguments += 1

        if missing_arguments == 0:
            print("\nTHERE ARE NO MISSING ARGUMENTS")

        extra_arguments = 0
        for action, arity in self.hidden_action_arity.items():
            extra = self.action_arity[action] - arity
            if extra > 0:
                extra_arguments += extra
                print(f"There are {extra} additional arguments for the action {action}.")

        if extra_arguments == 0:
            print("There are no additional arguments")

        return missing_arguments, extra_arguments

    # -- Action effects (from domain definition) --

    def get_action_effects(self):
        """Build the initial effect mapping from the PDDL domain definition.

        For each action effect predicate, every predicate position starts with
        all action argument positions as candidates. These are later narrowed
        down by get_effect_argument_positions() using trace observations.

        Returns:
            {sign: {action_name: {pred_name: {pred_pos: set of candidate action_arg positions}}}}
        """
        action_effects = {NEG: {}, POS: {}}

        for action in self.problem.parsed_problem.get_domain().get_actions():
            a_name = action.get_name()
            a_arity_range = set(range(self.action_arity[a_name]))
            for effect in action.get_strips_effect().get_effects():
                pred_name = effect.get_atom().get_predicate().get_name()
                if pred_name in self.dropped_preds:
                    continue

                sign = NEG if effect.is_negated() else POS
                if a_name not in action_effects[sign]:
                    action_effects[sign][a_name] = {}

                # Initially, any action argument could fill any predicate position
                action_effects[sign][a_name][pred_name] = {
                    pos: set(a_arity_range)
                    for pos in range(self.predicate_arity_dict[pred_name])
                }

        return action_effects

    def get_effect_argument_positions(self):
        """Determine which action argument positions map to which effect predicate positions.

        Three-phase process:
        1. Start with all possible action_arg -> pred_pos assignments (from get_action_effects)
        2. Eliminate assignments inconsistent with observed ground effects in the trace
        3. Validate that the remaining patterns cover all observed effects

        Returns and stores as self.effect_mapping:
            {sign: {action: {predicate: set of argument-position tuples}}}
            where each tuple (a1, a2, ...) means pred_arg_0=action_arg_a1, etc.
        """
        action_effects = self.get_action_effects()

        # Phase 1: Eliminate impossible argument-position assignments.
        # If action_arg p never produces an object that appears at pred_pos
        # in the observed effects, remove p from the candidates for that pred_pos.
        for position, action in enumerate(self.action_name_list):
            try:
                effects = self.affected_object_list[position]
                arguments = self.action_object_list[position]
                for sign in (NEG, POS):
                    if action not in action_effects[sign]:
                        continue
                    for predicate in action_effects[sign][action]:
                        for pred_pos in action_effects[sign][action][predicate]:
                            action_effects[sign][action][predicate][pred_pos] = {
                                arg_pos for arg_pos
                                in action_effects[sign][action][predicate][pred_pos]
                                if arguments[arg_pos] in effects[sign][predicate][pred_pos]
                            }
            except IndexError:
                print(f"IndexError for action {action} and position {position}!")
                raise ValueError

        # Phase 2: Build complete patterns from per-position candidates.
        # Take the Cartesian product of remaining candidates at each position
        # to get full argument-position tuples.
        pattern_dict = {NEG: {}, POS: {}}
        for sign in (NEG, POS):
            for action in action_effects[sign]:
                pattern_dict[sign][action] = {}
                for predicate in action_effects[sign][action]:
                    possible_positions = [
                        action_effects[sign][action][predicate][i]
                        for i in range(self.predicate_arity_dict[predicate])
                    ]
                    pattern_dict[sign][action][predicate] = set(
                        itertools.product(*possible_positions)
                    )

        # Phase 3: Validate patterns against actual ground effects.
        # Remove patterns that produce groundings not seen in the effects,
        # and warn if some effects aren't covered by any remaining pattern.
        for position, action in enumerate(self.action_name_list):
            not_all_covered = False
            for sign in (NEG, POS):
                if action not in pattern_dict[sign]:
                    continue
                for predicate in pattern_dict[sign][action]:
                    groundings_from_patterns = set()
                    for pattern in list(pattern_dict[sign][action][predicate]):
                        # Apply the pattern: map action args through the pattern
                        # to get a predicate grounding
                        grounding = tuple(
                            self.action_object_list[position][p] for p in pattern
                        )
                        if grounding not in self.affected_tuple_list[position][sign][predicate]:
                            pattern_dict[sign][action][predicate].discard(pattern)
                        else:
                            groundings_from_patterns.add(grounding)
                    if self.affected_tuple_list[position][sign][predicate] != groundings_from_patterns:
                        not_all_covered = True

        self.effect_mapping = pattern_dict
        return pattern_dict

    # -- Predicate patterns --

    def predicate_patterns(self):
        """Build mask-based pattern dictionaries grouped by predicate arity.

        For state parsing, each predicate is analyzed through "masks" — binary
        tuples indicating which argument positions are observed (0 or 1) and
        which one is the "query" position (-1). For a binary predicate, the
        masks would be (-1, 0), (-1, 1), (0, -1), (1, -1).

        All predicates of the same arity share the same set of masks.

        Returns:
            {arity: {pred_name: {mask_tuple: {} (to be filled during parsing)}}}
        """
        out_dict = {}

        for pred, pred_ar in self.predicate_arity:
            if pred_ar == 0:
                continue

            if pred_ar not in out_dict:
                # First predicate of this arity: generate all masks.
                # For arity n, generate all (n-1)-length binary strings,
                # then insert -1 at each of the n positions.
                masks = []
                for x in itertools.product((0, 1), repeat=pred_ar - 1):
                    for i in range(pred_ar):
                        masks.append(x[:i] + (-1,) + x[i:])
                out_dict[pred_ar] = {pred: {m: {} for m in masks}}
            else:
                # Reuse mask structure from existing predicate of same arity
                existing_pred = next(iter(out_dict[pred_ar]))
                out_dict[pred_ar][pred] = {
                    mask: {} for mask in out_dict[pred_ar][existing_pred]
                }

        return out_dict

    # -- Grounding preconditions --

    def set_grounding_preconditions(self):
        """Recompute precondition mappings (e.g. after argument extension)."""
        self.grounding_preconditions_pos, self.grounding_preconditions_neg, \
            self.mask_pre_pos, self.mask_pre_neg = self._compute_grounding_preconditions()

    def _compute_grounding_preconditions(self):
        """Compute which argument mappings are consistent with observed preconditions.

        For each (action, predicate) pair, starts with all possible argument
        mappings (permutations of action args into predicate positions), then
        eliminates those inconsistent with the trace:

        - Positive preconditions: mapping m is kept only if, at every trace step
          where the action is applied, the predicate grounded through m holds in
          the pre-state.
        - Negative preconditions: mapping m is kept only if, at every step, the
          predicate grounded through m does NOT hold.
        - Masked variants: same logic but with partially-grounded patterns
          (some predicate positions existentially quantified).

        Returns:
            (pos_pre, neg_pre, mask_pos, mask_neg), each structured as
            {action_name: {pred_name: set of mapping tuples}}.
        """
        pos_pre = {}
        neg_pre = {}
        mask_pos = {}
        mask_neg = {}

        # Initialize with all possible mappings
        for action, a_arity in self.action_arity.items():
            pos_pre[action] = {}
            neg_pre[action] = {}
            mask_pos[action] = {}
            mask_neg[action] = {}

            for predicate, p_arity in self.predicate_arity_dict.items():
                if predicate in self.dropped_preds:
                    continue

                if p_arity > 0:
                    # All ways to assign p_arity action args to predicate positions
                    all_perms = set(itertools.permutations(range(a_arity), r=p_arity))
                    pos_pre[action][predicate] = set(all_perms)
                    neg_pre[action][predicate] = set(all_perms)
                else:
                    # 0-arity predicates: only the empty mapping
                    pos_pre[action][predicate] = {tuple()}
                    neg_pre[action][predicate] = {tuple()}

                if p_arity >= 2:
                    # Masked patterns only make sense for arity >= 2
                    masked = _get_masked_patterns(a_arity, p_arity)
                    mask_pos[action][predicate] = set(masked)
                    mask_neg[action][predicate] = set(masked)

        # Filter mappings by checking each trace step's pre-state
        all_predicates = set(self.predicate_arity_dict.keys())

        for state_num, state in enumerate(self.state_trace[:-1]):
            parsed_state, parsed_full_state = self.problem.parse_state_precondition_test(state)
            cur_action = self.action_name_list[state_num]
            action_objs = self.action_object_list[state_num]

            for predicate in all_predicates:
                if predicate in self.dropped_preds:
                    continue

                if predicate not in parsed_state:
                    # Predicate has no ground atoms in this state, so no
                    # positive precondition mapping can hold
                    pos_pre[cur_action][predicate] = set()
                    mask_pos[cur_action][predicate] = set()
                    continue

                # Skip filtering if already narrowed to empty
                if pos_pre[cur_action][predicate]:
                    pos_pre[cur_action][predicate] = _filter_mapping_patterns(
                        parsed_state[predicate], action_objs,
                        pos_pre[cur_action][predicate], positive=True)
                if neg_pre[cur_action][predicate]:
                    neg_pre[cur_action][predicate] = _filter_mapping_patterns(
                        parsed_state[predicate], action_objs,
                        neg_pre[cur_action][predicate], positive=False)

                if predicate not in parsed_full_state:
                    mask_pos[cur_action][predicate] = set()
                    continue

                if mask_pos[cur_action].get(predicate):
                    mask_pos[cur_action][predicate] = self.get_masked_preconditions(
                        parsed_full_state[predicate], action_objs,
                        mask_pos[cur_action][predicate], positive=True)
                if mask_neg[cur_action].get(predicate):
                    mask_neg[cur_action][predicate] = self.get_masked_preconditions(
                        parsed_full_state[predicate], action_objs,
                        mask_neg[cur_action][predicate], positive=False)

        return pos_pre, neg_pre, mask_pos, mask_neg

    @staticmethod
    def get_masked_preconditions(possible_predicates, action_objects, possible_masks, positive):
        """Filter masked (partially-grounded) precondition patterns.

        A masked pattern like (0, None) means "action_arg_0 at pred position 0,
        any object at pred position 1". This checks whether such a partial
        grounding exists (positive) or doesn't exist (negative) in the state.

        Args:
            possible_predicates: Dict mapping mask -> set of partial groundings
                present in the current state.
            action_objects: Current action's argument list.
            possible_masks: Set of candidate masked patterns to filter.
            positive: If True, keep patterns present in state; if False, keep absent.

        Returns:
            Subset of possible_masks consistent with the observation.
        """
        result = set()
        for masked in possible_masks:
            # Build the mask key (None stays None, integers become 0)
            mask = tuple(None if m is None else 0 for m in masked)
            # Ground the non-None positions using action arguments
            grounding = tuple(
                None if pos is None else action_objects[pos] for pos in masked
            )
            is_present = grounding in possible_predicates[mask]
            if is_present == positive:
                result.add(masked)
        return result


# -- Module-level cached helpers --

@lru_cache(maxsize=None)
def _get_masked_patterns(action_arity, predicate_arity):
    """Generate all partially-grounded patterns for a given action/predicate arity pair.

    A masked pattern has some positions bound to action argument indices and
    others set to None (existentially quantified). For example, with action_arity=2
    and predicate_arity=3, pattern (0, None, 1) means:
      pred_pos_0 = action_arg_0, pred_pos_1 = exists, pred_pos_2 = action_arg_1

    At least one position must be None (fully-grounded patterns are handled
    separately as regular precondition mappings).

    Cached because the result depends only on the two arity integers and the
    same pairs recur across many (action, predicate) combinations.
    """
    if predicate_arity <= 1 or action_arity <= 0:
        return frozenset()

    patterns = set()
    for num_blanks in range(1, predicate_arity):
        # Need enough action args to fill the non-blank positions
        if num_blanks + action_arity < predicate_arity:
            continue
        num_filled = predicate_arity - num_blanks
        # Choose which predicate positions are blank (existentially quantified)
        for blanks in itertools.combinations(range(predicate_arity), num_blanks):
            blanks_set = frozenset(blanks)
            # Choose which action args fill the remaining positions (order matters)
            for action_args in itertools.permutations(range(action_arity), num_filled):
                pattern = [None] * predicate_arity
                filled_idx = 0
                for j in range(predicate_arity):
                    if j not in blanks_set:
                        pattern[j] = action_args[filled_idx]
                        filled_idx += 1
                patterns.add(tuple(pattern))
    return frozenset(patterns)


def _filter_mapping_patterns(predicate_objects, action_objects, possible_mappings, positive):
    """Filter argument mappings by checking against observed predicate groundings.

    For a mapping like (2, 0), constructs the tuple (action_objects[2], action_objects[0])
    and checks whether this tuple exists in predicate_objects (a set of ground atoms).

    For positive preconditions: keep mappings whose grounding IS in the state.
    For negative preconditions: keep mappings whose grounding is NOT in the state.

    Uses O(1) set membership instead of linear scan over predicate_objects.

    Args:
        predicate_objects: Set of ground-atom tuples for this predicate in the state.
        action_objects: Current action's argument list.
        possible_mappings: Set of candidate mapping tuples to filter.
        positive: If True, keep present; if False, keep absent.

    Returns:
        Filtered subset of possible_mappings.
    """
    pred_set = predicate_objects if isinstance(predicate_objects, set) else set(predicate_objects)
    num_action_objects = len(action_objects)

    result = set()
    for mapping in possible_mappings:
        if len(mapping) > num_action_objects:
            continue
        # Ground the mapping: substitute action argument indices with actual objects
        mapped_tuple = tuple(action_objects[m] for m in mapping)
        if (mapped_tuple in pred_set) == positive:
            result.add(mapping)
    return result


def _populate_mask_dict(candidate_dict, atoms_dict):
    """Fill mask-based candidate_dict from a plain atoms dictionary.

    This is the pymimir-free equivalent of mimir_thing.parse_state_with_dicts.
    For each ground atom, iterates over the masks and records which object
    appears at the "query" position (-1) for each partial grounding.

    Args:
        candidate_dict: {arity: {pred: {mask: {partial_grounding: {obj: count}}}}}
            Modified in place.
        atoms_dict: {pred_name: set of object-index tuples}
            The ground atoms true in a state.
    """
    for p_name, groundings in atoms_dict.items():
        for objs in groundings:
            p_arity = len(objs)
            if p_arity == 0:
                continue
            if p_arity not in candidate_dict or p_name not in candidate_dict[p_arity]:
                continue
            for mask in candidate_dict[p_arity][p_name]:
                partial_tuple = tuple(
                    None if mask[i] == 0
                    else -1 if mask[i] == -1
                    else objs[i]
                    for i in range(p_arity)
                )
                identified_argument = objs[mask.index(-1)]
                mask_dict = candidate_dict[p_arity][p_name][mask]
                if partial_tuple in mask_dict:
                    if identified_argument in mask_dict[partial_tuple]:
                        mask_dict[partial_tuple][identified_argument] += 1
                    else:
                        mask_dict[partial_tuple][identified_argument] = 1
                else:
                    mask_dict[partial_tuple] = {identified_argument: 1}


def _build_state_precondition_from_atoms(atoms_dict, dropped_preds):
    """Build (state_dict, partial_dict) from a plain atoms dictionary.

    This is the pymimir-free equivalent of mimir_thing.parse_state_precondition_test.

    Args:
        atoms_dict: {pred_name: set of object-index tuples}
        dropped_preds: set of predicate names to exclude.

    Returns:
        (state_dict, partial_dict) where:
          state_dict: {pred_name: set of ground-atom tuples}
          partial_dict: {pred_name: {mask: set of masked_arg tuples}}
    """
    state_dict = {}
    partial_dict = {}
    for p_name, groundings in atoms_dict.items():
        if p_name in dropped_preds:
            continue
        for objs in groundings:
            if p_name in state_dict:
                state_dict[p_name].add(objs)
            else:
                state_dict[p_name] = {objs}
            arg_list = list(objs)
            for i in range(1, len(arg_list)):
                for combi in itertools.combinations(range(len(arg_list)), i):
                    masked_args = tuple(
                        a if a_pos not in combi else None
                        for a_pos, a in enumerate(arg_list)
                    )
                    mask = tuple(
                        None if pos in combi else 0
                        for pos in range(len(masked_args))
                    )
                    if p_name not in partial_dict:
                        partial_dict[p_name] = {}
                    if mask not in partial_dict[p_name]:
                        partial_dict[p_name][mask] = set()
                    partial_dict[p_name][mask].add(masked_args)
    return state_dict, partial_dict


def _compute_effects_from_states(pre_atoms, post_atoms, dropped_preds):
    """Compute add/delete effects by diffing atom sets of adjacent states.

    Args:
        pre_atoms: {pred_name: set of object-index tuples} for the pre-state.
        post_atoms: {pred_name: set of object-index tuples} for the post-state.
        dropped_preds: set of predicate names to exclude.

    Returns:
        (per_position, tuples) in the same format as Trace._extract_effects:
          per_position: {sign: {pred: {pos: set of obj indices}}}
          tuples: {sign: {pred: set of full tuples}}
    """
    per_position = {NEG: {}, POS: {}}
    tuples = {NEG: {}, POS: {}}

    all_preds = set(pre_atoms.keys()) | set(post_atoms.keys())
    for pred in all_preds:
        if pred in dropped_preds:
            continue
        pre_raw = pre_atoms.get(pred, set())
        post_raw = post_atoms.get(pred, set())
        # Normalize: if values are dicts (e.g. {tuple: count}), use their keys as sets
        pre = set(pre_raw) if isinstance(pre_raw, dict) else pre_raw
        post = set(post_raw) if isinstance(post_raw, dict) else post_raw
        adds = post - pre
        dels = pre - post

        for sign, atoms in [(POS, adds), (NEG, dels)]:
            for obj_tuple in atoms:
                if pred not in per_position[sign]:
                    tuples[sign][pred] = set()
                    per_position[sign][pred] = {
                        i: set() for i in range(len(obj_tuple))
                    }
                tuples[sign][pred].add(obj_tuple)
                for i, obj in enumerate(obj_tuple):
                    per_position[sign][pred][i].add(obj)

    return per_position, tuples


class ValidationTrace(Trace):
    """A single-step trace used to validate learned action models.

    Created with a single state and action, then reused across many validation
    scenarios by swapping the state/action via set_state() and set_action().
    In validation mode, add_arguments always accepts (no deduplication),
    allowing the validator to test arbitrary argument assignments.
    """

    def __init__(self, problem: mimir_thing, dropped_args: dict, predicate_arity: dict,
                 dropped_pred: set, state, predicate_types, type_list):
        super().__init__(1, problem, dropped_args, predicate_arity, dropped_pred, type_list)
        self.affected_object_list = None
        self.affected_tuple_list = None
        self.validation = True
        self.state_trace[0] = state
        self.reset_parsed_dict()
        self.predicate_types = predicate_types

    def set_state(self, state_index):
        """Replace the single state for the next validation scenario."""
        self.state_trace[0] = state_index

    def set_action(self, name, objects):
        """Replace the single action for the next validation scenario."""
        self.action_name_list[0] = name
        self.action_object_list[0] = objects

    def get_all_applicable_actions(self, state_index):
        """Return all applicable actions in the given state with their effects.

        Returns:
            dict mapping (action_name, argument_tuple) -> effect tuple dict
        """
        possible_actions = {}
        for action in self.problem.get_all_applicable_actions(state_index):
            action_name = self.problem.get_action_name_by_index(action.get_action_index())
            action_objects = action.get_object_indices()
            if self.dropped_args is not None and action_name in self.dropped_args:
                dropped = self.dropped_args[action_name]
                args = tuple(
                    obj for obj_num, obj in enumerate(action_objects)
                    if obj_num not in dropped
                )
                possible_actions[(action_name, args)] = self._extract_effects(action)[1]
            else:
                possible_actions[(action_name, tuple(action_objects))] = self._extract_effects(action)[1]
        return possible_actions

    def get_full_grounding(self):
        """Return the argument list of the single action in this trace."""
        return self.action_object_list[0]

    @override
    def set_predicate_types(self):
        # Defer to the caller — predicate_types are passed in from the main trace
        self.predicate_types = None


class _CountUpSkip:
    """Iterator that yields 0..n but skips index n//2.

    Used by CopiedTrace to skip the None separator in the middle of the
    doubled trace when iterating over valid trace positions.
    """

    def __init__(self, n):
        self.n = n
        self.current = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.current == self.n // 2:
            self.current += 2
            return self.current - 1
        elif self.current <= self.n:
            self.current += 1
            return self.current - 1
        else:
            raise StopIteration


class CopiedTrace(Trace):
    """A doubled trace that separates atoms referencing action arguments from those that don't.

    Given an original trace of length L, creates a trace of length 2L structured as:
        [step_0, ..., step_{L-1}, None, step_0', ..., step_{L-1}']

    The first half (steps 0..L-1) has states parsed to contain only atoms whose
    objects include at least one of the (hidden) action arguments. The second half
    (steps L+1..2L) contains the remaining atoms. This separation allows the
    learning algorithm to distinguish features that depend on hidden arguments
    from those that don't, enabling recovery of dropped parameters.

    The None separator at position L is skipped during iteration (_CountUpSkip).

    The action_object_list is reset to the initial (pre-extension) state so
    argument recovery can start fresh on the doubled trace.
    """

    def __init__(self, trace_instance: Trace):
        # Bypass Trace.__init__ — we construct from an existing trace's data
        self.problem = trace_instance.problem
        # Keep a reference to the parent trace for graph-backed state splitting
        self._parent_trace = trace_instance
        self.types_list = trace_instance.types_list
        self.length = 2 * trace_instance.length
        self.dropped_args = trace_instance.dropped_args
        self.dropped_preds = trace_instance.dropped_preds
        self.validation = False

        # Double the trace data with a None separator in the middle.
        # Strings and state objects are immutable, so shallow copies suffice.
        self.state_trace = trace_instance.state_trace + trace_instance.state_trace.copy()
        self.action_trace = trace_instance.action_trace + [None] + trace_instance.action_trace
        self.action_name_list = (
            trace_instance.action_name_list.copy() + [None]
            + trace_instance.action_name_list.copy()
        )
        # action_object_list entries are mutated by add_arguments, so need per-list copies.
        # Reset to initial (pre-extension) arguments for fresh learning.
        self.action_object_list = (
            [lst.copy() for lst in trace_instance.initial_action_object_list] + [None]
            + [lst.copy() for lst in trace_instance.initial_action_object_list]
        )
        # hidden_action_object_trace preserves the fully-extended arguments
        # from the original trace (the ground truth for verification)
        self.hidden_action_object_trace = (
            [lst.copy() for lst in trace_instance.action_object_list] + [None]
            + [lst.copy() for lst in trace_instance.action_object_list]
        )
        # Effect data is read-only, shallow concat is fine
        self.affected_object_list = (
            trace_instance.affected_object_list + [None]
            + trace_instance.affected_object_list
        )
        self.affected_tuple_list = (
            trace_instance.affected_tuple_list + [None]
            + trace_instance.affected_tuple_list
        )

        # Reset arities to pre-extension state
        self.action_arity = trace_instance.initial_arities
        self.hidden_action_arity = trace_instance.action_arity

        self.parsed_state_dict = {}
        # Filter out type predicates from arity list
        self.predicate_arity = [
            (pred, ar) for (pred, ar) in trace_instance.predicate_arity
            if pred not in self.types_list
        ]
        self.predicate_arity_dict = {pred: ar for (pred, ar) in self.predicate_arity}

        self._action_indices = self._build_action_indices()

        # Reset argument queries: keep the slot structure but clear learned values,
        # so the learning algorithm starts fresh on this doubled trace
        self.argument_queries = trace_instance.argument_queries
        for action_queries in self.argument_queries.values():
            for position in list(action_queries):
                if action_queries[position] is not None:
                    del action_queries[position]

        self.effect_mapping = set()
        self.candidate_dict = self.predicate_patterns()

        # Carry over precondition data from the original trace (used during validation)
        self.grounding_preconditions_pos = trace_instance.grounding_preconditions_pos
        self.grounding_preconditions_neg = trace_instance.grounding_preconditions_neg
        self.mask_pre_pos = trace_instance.mask_pre_pos
        self.mask_pre_neg = trace_instance.mask_pre_neg
        self.predicate_types = trace_instance.predicate_types

        # Pre-compute the split state dictionaries
        self._build_split_state_dicts()

    def _build_split_state_dicts(self):
        """Pre-compute parsed states, splitting atoms by action-argument membership.

        For each trace step in the first half:
          - parsed_state_dict[step] gets atoms containing at least one action argument
          - parsed_state_dict[step + half + 1] gets the remaining atoms

        This is why CopiedTrace.parse_state raises NotImplementedError for
        unknown positions — all valid positions must be pre-computed here.
        """
        empty_state_dict = self.predicate_patterns()
        half = self.length // 2

        if self.problem is not None:
            # PDDL-backed: delegate to mimir_thing's full implementation
            for action_index, action_objects in enumerate(self.hidden_action_object_trace[:half]):
                state = self.state_trace[action_index]
                parsed_states = self.problem.parse_state_with_dict_and_action_args(
                    copy.deepcopy(empty_state_dict), state,
                    set(action_objects), self.types_list)
                self.parsed_state_dict[action_index] = parsed_states[True]
                self.parsed_state_dict[1 + action_index + half] = parsed_states[False]
        else:
            # Graph-backed: split atoms by action-argument membership directly
            # Use true_atoms from the parent GraphTrace
            parent = self._parent_trace
            for action_index, action_objects in enumerate(self.hidden_action_object_trace[:half]):
                state = self.state_trace[action_index]
                action_arg_set = set(action_objects)

                # Get true atoms for this state
                true_atoms = parent._node_true_atoms.get(state, {})

                # Split: atoms with action args vs. atoms without
                atoms_with = {}      # contains at least one action arg
                atoms_without = {}   # no action args

                for p_name, groundings in true_atoms.items():
                    if p_name in self.types_list:
                        continue
                    for objs in groundings:
                        obj_set = set(objs)
                        if not obj_set.isdisjoint(action_arg_set):
                            atoms_with.setdefault(p_name, set()).add(objs)
                        else:
                            atoms_without.setdefault(p_name, set()).add(objs)

                dicts_with = copy.deepcopy(empty_state_dict)
                _populate_mask_dict(dicts_with, atoms_with)
                self.parsed_state_dict[action_index] = dicts_with

                dicts_without = copy.deepcopy(empty_state_dict)
                _populate_mask_dict(dicts_without, atoms_without)
                self.parsed_state_dict[1 + action_index + half] = dicts_without

    @override
    def parse_state(self, position):
        """Return pre-computed parsed state. Raises if position wasn't pre-computed."""
        if position in self.parsed_state_dict:
            return self.parsed_state_dict[position]
        raise NotImplementedError(f"State at position {position} was not pre-computed")

    @override
    def reset_parsed_dict(self):
        # States are pre-computed during __init__ and must not be cleared
        pass

    @override
    def __iter__(self):
        """Iterate over valid indices, skipping the None separator at length//2."""
        return _CountUpSkip(self.length)

    @override
    def predicate_patterns(self):
        """Like Trace.predicate_patterns but excludes type predicates."""
        out_dict = {}
        for pred, pred_ar in self.predicate_arity:
            if pred in self.types_list or pred_ar == 0:
                continue

            if pred_ar not in out_dict:
                masks = []
                for x in itertools.product((0, 1), repeat=pred_ar - 1):
                    for i in range(pred_ar):
                        masks.append(x[:i] + (-1,) + x[i:])
                out_dict[pred_ar] = {pred: {m: {} for m in masks}}
            else:
                existing_pred = next(iter(out_dict[pred_ar]))
                out_dict[pred_ar][pred] = {
                    mask: {} for mask in out_dict[pred_ar][existing_pred]
                }

        return out_dict


class ExtendedTrace(Trace):
    """Like Trace, but explores the full reachable state space instead of a random walk.

    Instead of sampling a fixed-length random trace, this variant performs a
    breadth-first exploration from the initial state, collecting all reachable
    transitions. This provides more complete coverage for learning but may be
    expensive for large state spaces.

    Additional attribute:
        reached_states: List of successor states (one per action), parallel to
            state_trace (which holds predecessor states).
    """

    def __init__(self, length: int, problem: mimir_thing, dropped_args: dict,
                 predicate_arity: dict, dropped_pred: set, typelist):
        # length parameter is accepted for interface compatibility but not used;
        # the actual length is determined by the state space size
        self.problem = problem
        self.dropped_args = dropped_args
        self.dropped_preds = dropped_pred
        self.validation = False

        # BFS from initial state, collecting all transitions
        self.state_trace, self.reached_states, self.action_trace = \
            self.problem.sample_state_space_from_init()
        self.length = len(self.action_trace)

        self._init_from_trace_data(predicate_arity, typelist)

    def build_graph(self):
        """Build a NetworkX graph of the explored state space.

        Nodes are states, edges are labeled with the action (name + arguments)
        that transitions between them.
        """
        all_states = set(self.state_trace) | set(self.reached_states)
        G = nx.Graph()
        G.add_nodes_from(all_states)

        for pos, action in enumerate(self.action_name_list):
            action_string = str(action) + str(self.action_object_list[pos])
            G.add_edge(self.state_trace[pos], self.reached_states[pos], action=action_string)

        return G


class GraphTrace(Trace):
    """A doubled trace from pre-built labelled graph(s), with open/closed world halves.

    Accepts either a single networkx DiGraph or a dict of graphs where:
      - Nodes carry an 'atoms' attribute: {arity: {pred: (true_groundings, false_groundings)}}
        where true/false_groundings are sets of object-index tuples.
        Atoms not in either set are considered unknown.
      - Edges carry an 'action' attribute: set of (action_name, action_objects_tuple)

    The trace is doubled like CopiedTrace (length = 2 * num_edges):
      - First half  (0..L-1):   unknown atoms assumed FALSE → state = true_groundings only
      - Second half (L+1..2L):  unknown atoms assumed TRUE  → state = universe - false_groundings
      - None separator at position L, skipped during iteration

    Effects are derived from true_groundings only (definite changes) and duplicated
    in both halves. Preconditions use open-world atoms (true + unknown).

    Action arities and predicate arities are derived automatically by scanning
    the graph edges and node atoms. No separate metadata dict is needed.

    When multiple graphs are provided (as dict[int, nx.DiGraph]), all edges from all
    graphs are combined into a single flat trace. State identifiers are
    (graph_id, node_id) tuples to disambiguate nodes across different graphs.

    Args:
        graph: either a single networkx.DiGraph (auto-wrapped as {0: graph}),
            or a dict[int, nx.DiGraph] mapping graph identifiers to graphs.
        dropped_args: dict mapping action_name -> set of hidden argument positions, or None.
        dropped_preds: set of predicate names to exclude.
        type_list: list of type predicate names, or path to file, or None.
    """

    def __init__(self, graph: nx.DiGraph | dict[int, (nx.DiGraph, int)],
                 dropped_args: dict, dropped_preds: set, type_list):
        # Bypass Trace.__init__ entirely — we build from graph data
        self.problem = None
        self.dropped_args = dropped_args
        self.dropped_preds = dropped_preds
        self.validation = False

        self.sift_meta_info = dict()

        # Normalize input: single graph → dict with key 0
        if isinstance(graph, nx.DiGraph):
            graphs = {0: (graph, next(iter(graph.nodes())))}
        else:
            graphs = dict()
            for _id, (_g,_sift_int) in graph.items():
                graphs[_id] = _g
                self.sift_meta_info[_id] = _sift_int



        # Parse node labels: {arity: {pred: (true_set, false_set)}}
        # Flatten into two dicts keyed by (graph_id, node_id)
        self._node_true_atoms = {}   # {(gid, nid): {pred: set of tuples}}
        self._node_false_atoms = {}  # {(gid, nid): {pred: set of tuples}}
        pred_arity_dict = {}

        for gid, g in graphs.items():
            for node in g.nodes():
                raw = g.nodes[node].get('atoms', {})
                true_atoms = {}
                false_atoms = {}
                for arity, preds in raw.items():
                    for pred, (true_set, false_set) in preds.items():
                        true_atoms[pred] = set(true_set)
                        false_atoms[pred] = set(false_set)
                        if pred not in pred_arity_dict:
                            pred_arity_dict[pred] = arity
                self._node_true_atoms[(gid, node)] = true_atoms
                self._node_false_atoms[(gid, node)] = false_atoms

        self.predicate_arity = list(pred_arity_dict.items())
        self.predicate_arity_dict = dict(pred_arity_dict)

        # Extract all edges from all graphs (undoubled, raw)
        raw_state_trace = []
        raw_reached_states = []
        self._edge_actions = []

        for gid, g in graphs.items():
            for src, dst, data in g.edges(data=True):
                action_set = data.get('action', set())
                for action_name, action_objects in action_set:
                    raw_state_trace.append((gid, src))
                    raw_reached_states.append((gid, dst))
                    self._edge_actions.append((action_name, action_objects))

        num_edges = len(self._edge_actions)

        # Keep undoubled references for parse_state and to_graphs
        self._raw_state_trace = raw_state_trace
        self._raw_reached_states = raw_reached_states

        # Build raw (undoubled) action lists
        raw_action_names = [a[0] for a in self._edge_actions]
        raw_action_objects = [list(a[1]) for a in self._edge_actions]

        # Derive action_arity from edge labels
        self.action_arity = {}
        for action_name, action_objects in self._edge_actions:
            if action_name not in self.action_arity:
                self.action_arity[action_name] = len(action_objects)

        # Collect all object indices for universe computation
        self._all_objects = set()
        for atoms in self._node_true_atoms.values():
            for groundings in atoms.values():
                for tup in groundings:
                    self._all_objects.update(tup)
        for atoms in self._node_false_atoms.values():
            for groundings in atoms.values():
                for tup in groundings:
                    self._all_objects.update(tup)
        for _, action_objects in self._edge_actions:
            self._all_objects.update(action_objects)
        self._universe_cache = {}

        # --- Doubling (like CopiedTrace) ---
        # Length is 2 * num_edges, with None separator at position num_edges
        self.length = 2 * num_edges

        self.state_trace = raw_state_trace + raw_state_trace.copy()
        self.action_trace = self._edge_actions + [None] + self._edge_actions
        self.action_name_list = (
            raw_action_names.copy() + [None] + raw_action_names.copy()
        )
        self.action_object_list = (
            [lst.copy() for lst in raw_action_objects] + [None]
            + [lst.copy() for lst in raw_action_objects]
        )

        # Ground-truth arguments (same as visible since graph has full data)
        self.hidden_action_arity = self.action_arity.copy()
        self.hidden_action_object_trace = (
            [lst.copy() for lst in raw_action_objects] + [None]
            + [lst.copy() for lst in raw_action_objects]
        )

        self.parsed_state_dict = {}

        # Remove hidden argument positions from the visible action data
        self._apply_dropped_args()

        # Snapshot post-drop / pre-extension state for CopiedTrace
        self.initial_action_object_list = [
            lst.copy() if lst is not None else None
            for lst in self.action_object_list
        ]
        self.initial_arities = self.action_arity.copy()

        self._action_indices = self._build_action_indices()

        self.argument_queries = {
            action: {ar: None for ar in range(arity)}
            for action, arity in self.action_arity.items()
        }

        # Pre-compute effects from true_groundings only (definite changes)
        raw_affected_obj = []
        raw_affected_tup = []
        for pos in range(num_edges):
            src = raw_state_trace[pos]
            dst = raw_reached_states[pos]
            pre_atoms = self._node_true_atoms.get(src, {})
            post_atoms = self._node_true_atoms.get(dst, {})
            position_dict, tuple_dict = _compute_effects_from_states(
                pre_atoms, post_atoms, self.dropped_preds)
            raw_affected_obj.append(position_dict)
            raw_affected_tup.append(tuple_dict)

        # Double effects with None separator (same effects in both halves)
        self.affected_object_list = raw_affected_obj + [None] + raw_affected_obj
        self.affected_tuple_list = raw_affected_tup + [None] + raw_affected_tup

        self.effect_mapping = set()

        # Build mask-based pattern dictionaries
        self.candidate_dict = self.predicate_patterns()

        # Compute precondition mappings (uses open-world atoms)
        self.grounding_preconditions_pos, self.grounding_preconditions_neg, \
            self.mask_pre_pos, self.mask_pre_neg = self._compute_grounding_preconditions()

        # Load type list
        if isinstance(type_list, list):
            self.types_list = type_list
        else:
            self.types_list = self._load_type_list(type_list)

        self.predicate_types = None
        self.set_predicate_types()

    def _get_universe(self, pred, arity):
        """Get or compute the set of all possible groundings for a predicate."""
        def object_compare_key(obj : typing.Union[int,str]):
            return (0, obj) if isinstance(obj, int) else (1, obj)
        key = (pred, arity)
        if key not in self._universe_cache:
            self._universe_cache[key] = set(
                itertools.product(sorted(self._all_objects, key=object_compare_key), repeat=arity))
        return self._universe_cache[key]

    def _get_open_world_atoms(self, node):
        """Get atoms under open-world assumption: universe minus false_groundings."""
        false_atoms = self._node_false_atoms.get(node, {})
        open_atoms = {}
        for pred, arity in self.predicate_arity_dict.items():
            if pred in self.dropped_preds:
                continue
            universe = self._get_universe(pred, arity)
            false_set = false_atoms.get(pred, set())
            open_set = universe - false_set
            if open_set:
                open_atoms[pred] = open_set
        return open_atoms

    def to_graphs(self) -> dict[int, nx.DiGraph]:
        """Reconstruct individual graphs from the trace, with current action arguments.

        Returns a dict mapping graph_id → nx.DiGraph. Each returned graph has:
          - Nodes with 'atoms' attribute: {arity: {pred: (true_set, false_set)}}
          - Edges with 'action' attribute: set of (action_name, action_objects_tuple)

        Action objects reflect the current state of action_object_list, which may
        include arguments added during learning (via add_arguments).
        Uses only the first half of the doubled trace (both halves have the same edges).
        """
        half = self.length // 2
        graphs = {}
        for pos in range(half):
            gid_src, nid_src = self._raw_state_trace[pos]
            gid_dst, nid_dst = self._raw_reached_states[pos]

            if gid_src not in graphs:
                graphs[gid_src] = nx.DiGraph()
            G = graphs[gid_src]

            # Add source and destination nodes with original atom format
            for gid, nid in [(gid_src, nid_src), (gid_dst, nid_dst)]:
                if nid not in G:
                    # Reconstruct {arity: {pred: (true, false)}} from flat dicts
                    true_a = self._node_true_atoms.get((gid, nid), {})
                    false_a = self._node_false_atoms.get((gid, nid), {})
                    all_preds = set(true_a.keys()) | set(false_a.keys())
                    node_atoms = {}
                    for pred in all_preds:
                        arity = self.predicate_arity_dict.get(pred, 0)
                        if arity not in node_atoms:
                            node_atoms[arity] = {}
                        node_atoms[arity][pred] = (
                            true_a.get(pred, set()),
                            false_a.get(pred, set()),
                        )
                    G.add_node(nid, atoms=node_atoms)

            # Build action label with CURRENT (possibly extended) arguments
            action_label = (
                self.action_name_list[pos],
                tuple(self.action_object_list[pos])
            )
            if G.has_edge(nid_src, nid_dst):
                G.edges[nid_src, nid_dst]['action'].add(action_label)
            else:
                G.add_edge(nid_src, nid_dst, action={action_label})

        output_graphs = dict()
        for _id, graph in graphs.items():
            output_graphs[_id] = (graph, self.sift_meta_info[_id])

        return output_graphs

    @override
    def __iter__(self):
        """Iterate over valid indices, skipping the None separator at length//2."""
        return _CountUpSkip(self.length)

    @override
    def parse_state(self, trace_position):
        """Parse state with closed-world (first half) or open-world (second half)."""
        if trace_position in self.parsed_state_dict:
            return self.parsed_state_dict[trace_position]

        half = self.length // 2
        # Map doubled position to the raw (undoubled) position
        raw_pos = trace_position if trace_position < half else trace_position - half - 1
        state = self._raw_state_trace[raw_pos]

        dicts = copy.deepcopy(self.candidate_dict)

        if trace_position < half:
            # First half: closed world — only true groundings
            atoms = self._node_true_atoms.get(state, {})
        else:
            # Second half: open world — everything NOT in false = universe - false
            atoms = self._get_open_world_atoms(state)

        _populate_mask_dict(dicts, atoms)
        self.parsed_state_dict[trace_position] = dicts
        return dicts

    @override
    def set_predicate_types(self):
        """Set all predicate types to empty (no type information from graphs)."""
        self.predicate_types = {
            pred: {pos: set() for pos in range(arity)}
            for pred, arity in self.predicate_arity_dict.items()
        }

    @override
    def _compute_grounding_preconditions(self):
        """Compute precondition mappings using open-world atoms (true + unknown)."""
        pos_pre = {}
        neg_pre = {}
        mask_pos = {}
        mask_neg = {}

        for action, a_arity in self.action_arity.items():
            pos_pre[action] = {}
            neg_pre[action] = {}
            mask_pos[action] = {}
            mask_neg[action] = {}

            for predicate, p_arity in self.predicate_arity_dict.items():
                if predicate in self.dropped_preds:
                    continue
                if p_arity > 0:
                    all_perms = set(itertools.permutations(range(a_arity), r=p_arity))
                    pos_pre[action][predicate] = set(all_perms)
                    neg_pre[action][predicate] = set(all_perms)
                else:
                    pos_pre[action][predicate] = {tuple()}
                    neg_pre[action][predicate] = {tuple()}
                if p_arity >= 2:
                    masked = _get_masked_patterns(a_arity, p_arity)
                    mask_pos[action][predicate] = set(masked)
                    mask_neg[action][predicate] = set(masked)

        all_predicates = set(self.predicate_arity_dict.keys())
        num_edges = len(self._edge_actions)

        # Use open-world atoms for precondition filtering (keeps all possibly-valid ones)
        for state_num in range(num_edges):
            state = self._raw_state_trace[state_num]
            open_atoms = self._get_open_world_atoms(state)
            parsed_state, parsed_full_state = _build_state_precondition_from_atoms(
                open_atoms, self.dropped_preds)
            cur_action = self.action_name_list[state_num]
            action_objs = self.action_object_list[state_num]

            for predicate in all_predicates:
                if predicate in self.dropped_preds:
                    continue
                if predicate not in parsed_state:
                    pos_pre[cur_action][predicate] = set()
                    mask_pos[cur_action][predicate] = set()
                    continue
                if pos_pre[cur_action][predicate]:
                    pos_pre[cur_action][predicate] = _filter_mapping_patterns(
                        parsed_state[predicate], action_objs,
                        pos_pre[cur_action][predicate], positive=True)
                if neg_pre[cur_action][predicate]:
                    neg_pre[cur_action][predicate] = _filter_mapping_patterns(
                        parsed_state[predicate], action_objs,
                        neg_pre[cur_action][predicate], positive=False)
                if predicate not in parsed_full_state:
                    mask_pos[cur_action][predicate] = set()
                    continue
                if mask_pos[cur_action].get(predicate):
                    mask_pos[cur_action][predicate] = self.get_masked_preconditions(
                        parsed_full_state[predicate], action_objs,
                        mask_pos[cur_action][predicate], positive=True)
                if mask_neg[cur_action].get(predicate):
                    mask_neg[cur_action][predicate] = self.get_masked_preconditions(
                        parsed_full_state[predicate], action_objs,
                        mask_neg[cur_action][predicate], positive=False)

        return pos_pre, neg_pre, mask_pos, mask_neg

    @override
    def _extract_effects(self, action):
        """Not applicable for GraphTrace — effects are pre-computed during init."""
        raise NotImplementedError(
            "GraphTrace pre-computes effects from state diffs. "
            "Use self.affected_object_list / self.affected_tuple_list instead.")

    @override
    def get_action_effects(self):
        """Derive effect predicates from observed transitions instead of PDDL domain.

        Scans the first half of the trace (both halves have the same effects)
        to find which predicates appear in effects of each action.
        """
        action_effects = {NEG: {}, POS: {}}
        half = self.length // 2

        for pos in range(half):
            a_name = self.action_name_list[pos]
            effects_pos = self.affected_object_list[pos]
            for sign in (NEG, POS):
                for pred in effects_pos[sign]:
                    if pred in self.dropped_preds:
                        continue
                    if a_name not in action_effects[sign]:
                        action_effects[sign][a_name] = {}
                    if pred not in action_effects[sign][a_name]:
                        a_arity_range = set(range(self.action_arity[a_name]))
                        action_effects[sign][a_name][pred] = {
                            p: set(a_arity_range)
                            for p in range(self.predicate_arity_dict[pred])
                        }

        return action_effects

