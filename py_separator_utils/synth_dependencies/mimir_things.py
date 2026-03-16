import copy
import itertools
import random
from pyexpat import features

import pymimir
import pymimir as mimir
from cffi.model import attach_exception_info
from networkx.algorithms.shortest_paths.unweighted import predecessor
from networkx.generators.trees import prefix_tree
from pymimir import PDDLParser, StateSpace


class mimir_thing:

    def __init__(self, domain, instance, dropped_predicates, dropped_args):
        self.domain_path = domain
        self.instance_path = instance
        self.dropped_predicates = dropped_predicates
        self.dropped_args = dropped_args

        self.parsed_problem = PDDLParser(self.domain_path, self.instance_path)

        self.grounder = mimir.Grounder(self.parsed_problem.get_problem(), self.parsed_problem.get_pddl_repositories())
        self.evaluator = mimir.LiftedAxiomEvaluator(self.grounder.get_axiom_grounder())
        self.state_repo = mimir.StateRepository(self.evaluator)
        self.work_state_repo = mimir.StateRepositoryWorkspace()
        self.initial = self.state_repo.get_or_create_initial_state(self.work_state_repo)
        self.aag = mimir.LiftedApplicableActionGenerator(self.grounder.get_action_grounder())
        # self.work_aag = mimir.LiftedApplicableActionGeneratorWorkspace()
        self.work_aag = mimir.ApplicableActionGeneratorWorkspace()
        self.pddl_repo = self.grounder.get_literal_grounder().get_pddl_repositories()

        self.statics = set()

        self.action_dict = dict()
        for action in self.parsed_problem.get_domain().get_actions():
            self.action_dict[action.get_index()] = action.get_name()

        self.object_dict = dict()
        for obj in self.parsed_problem.get_problem().get_objects():
            self.object_dict[obj.get_index()] = obj.get_name()

        self.action_arity = self.action_arities()
        self.feature_arity = self.feature_arities()
        self.feature_arity_dict = {feat: ar for (feat, ar) in self.feature_arity}



        self.node_dict = dict()
        self.parsed_node_dict = dict()


        self.seen_applicable_actions = {act: set() for (act, _) in self.action_arity}
        self.seen_non_applicable_actions = {act: set() for (act,_) in self.action_arity}
        '''
            We can assume that we know the static predicates
        '''
        self.unary_static_predicates = self.get_unary_statics()
        print(self.unary_static_predicates)

        '''
            ToDo The following function should be done new
        '''
        #self.predicate_types = self.set_predicate_types()
        #print(self.predicate_types)

        '''
            ToDo Check this function
        '''
        self.objects_types = self.set_object_types()
        print(self.objects_types)
        self.state_action_ground_action = dict()
        #self.types = self.find_static_unary_preconditions()
        #self.object_types = self.get_objects_for_types()
        '''
        self.types = dict()
        self.get_unary_statics()

        self.get_action_types()
        '''

    def get_object_types(self):
        return self.objects_types

    def set_object_types(self):
        object_type_dict = {static: set() for static in self.unary_static_predicates}
        for static_atom in self.parsed_problem.get_problem().get_static_initial_atoms():
            if static_atom.get_arity() != 1:
                continue
            predicate_name = static_atom.get_predicate().get_name()
            variable = static_atom.get_objects()[0].get_index()
            object_type_dict[predicate_name].add(variable)

        return object_type_dict

    #def get_predicate_types(self):
    #    return self.predicate_types

    def set_predicate_types(self):

        predicates = {pred:{i for i in range(arity)} for (pred, arity) in self.feature_arity}
        actions = dict()
        bindings = dict()
        for action in self.parsed_problem.get_domain().get_actions():
            action_name = action.get_name()
            actions[action.get_name()] = action

            bindings[action_name] = dict()
            for prec in action.get_precondition().get_precondition():
                prec_atom = prec.get_atom()
                if prec_atom.get_predicate().get_name() in bindings[action_name]:
                    bindings[action_name][prec_atom.get_predicate().get_name()].append(tuple(e.get_name()
                                                                                  for e in prec_atom.get_variables()))
                else:
                    bindings[action_name][prec_atom.get_predicate().get_name()] = [tuple(e.get_name()
                                                                                  for e in prec_atom.get_variables())]
            for eff in action.get_strips_effect().get_effects():
                eff_atom = eff.get_atom()
                if eff_atom.get_predicate().get_name() in bindings[action_name]:
                    bindings[action_name][eff_atom.get_predicate().get_name()].append(tuple(e.get_name()
                                                                                  for e in eff_atom.get_variables()))
                else:
                    bindings[action_name][eff_atom.get_predicate().get_name()] = [tuple(e.get_name()
                                                                                  for e in eff_atom.get_variables())]

        predicate_types = dict()
        for predicate in predicates:
            predicate_types[predicate] = dict()
            for position in predicates[predicate]:
                possible_types = copy.deepcopy(self.unary_static_predicates)
                for action in bindings:

                    if predicate not in bindings[action]:
                        continue
                    for bind in bindings[action][predicate]:

                        var = bind[position]
                        for p_type in list(possible_types):
                            if p_type not in bindings[action]:
                                possible_types.remove(p_type)
                                continue
                            has_type = False
                            for static_bin in bindings[action][p_type]:
                                if static_bin[0] == var:
                                    has_type = True
                                    break
                            if not has_type:
                                possible_types.remove(p_type)
                predicate_types[predicate][position] = possible_types

        return predicate_types

    def get_unary_statics(self):

        types = set()

        for pred in self.parsed_problem.get_domain().get_static_predicates():
            if pred.get_arity() == 1:
                if pred not in self.dropped_predicates:
                    types.add(pred.get_name())

        return types


    def get_action_name_by_index(self, index: int):
        return self.action_dict[index]

    def get_object_by_index(self, index: int):
        return self.object_dict[index]

    def get_object_set(self):
        return set(self.object_dict.keys())

    def get_state_space(self):

        return None

    def sample_trace_from_init(self, length: int):

        self.node_dict[self.initial.get_index()] = self.initial
        state_trace = [self.initial.get_index()]
        action_trace = []

        for _ in range(length):
            app_actions = self.aag.generate_applicable_actions(self.node_dict[state_trace[-1]], self.work_aag)
            action = random.choice(app_actions)

            succ = self.state_repo.get_or_create_successor_state(self.node_dict[state_trace[-1]], action, self.work_state_repo)
            state_trace.append(succ[0].get_index())
            action_trace.append((action))
            self.node_dict[succ[0].get_index()] = succ[0]

        self.parse_states()

        return state_trace, action_trace

    def sample_state_space_from_init(self):

        self.node_dict[self.initial.get_index()] = self.initial
        applied_state_trace = []
        reached_state_list = []
        action_trace = []

        state_list = [self.initial.get_index()]
        visited_states = set()

        while state_list:

            print(len(action_trace), len(visited_states), len(state_list))

            cur_state = state_list[0]
            state_list = state_list[1:]
            visited_states.add(cur_state)

            for action in self.aag.generate_applicable_actions(self.node_dict[cur_state], self.work_aag):
                succ = self.state_repo.get_or_create_successor_state(self.node_dict[cur_state], action,
                                                                     self.work_state_repo)

                applied_state_trace.append(cur_state)
                action_trace.append((action))
                reached_state_list.append(succ[0].get_index())

                if succ[0].get_index() not in state_list and succ[0].get_index() not in visited_states:
                    state_list.append(succ[0].get_index())
                    self.node_dict[succ[0].get_index()] = succ[0]

        self.parse_states()

        return applied_state_trace, reached_state_list, action_trace

    def sample_bfs_from_init(self, length: int):

        self.node_dict[self.initial.get_index()] = self.initial
        next_states = [self.initial.get_index()]
        already_seen = set()

        while len(self.node_dict.keys()) < length:
            if len(next_states) == 0:
                break
            current = next_states[0]
            next_states = next_states[1:]
            for act in self.aag.generate_applicable_actions(self.node_dict[current], self.work_aag):
                action_name = self.get_action_name_by_index(act.get_action_index())
                all_action_objects = act.get_object_indices()
                if self.dropped_args is not None and action_name in self.dropped_args:
                    all_action_objects = [val for pos, val in enumerate(all_action_objects)
                                                     if pos not in self.dropped_args[action_name]]
                # print(self.seen_applicable_actions)
                self.seen_applicable_actions[action_name].add(tuple(all_action_objects))

                successor = self.state_repo.get_or_create_successor_state(self.node_dict[current], act, self.work_state_repo)
                succ = successor[0].get_index()
                if succ not in next_states and succ not in already_seen:
                    next_states.append(succ)
                    self.node_dict[succ] = successor[0]

            already_seen.add(current)

        for state in self.node_dict:
            for act in self.aag.generate_applicable_actions(self.node_dict[state], self.work_aag):
                action_name = self.get_action_name_by_index(act.get_action_index())
                all_action_objects = act.get_object_indices()
                if self.dropped_args is not None and action_name in self.dropped_args:
                    all_action_objects = [val for pos, val in enumerate(all_action_objects)
                                          if pos not in self.dropped_args[action_name]]
                # print(self.seen_applicable_actions)
                self.state_action_ground_action[(state, (action_name, tuple(all_action_objects)))] = act
                self.seen_applicable_actions[action_name].add(tuple(all_action_objects))



        for state in self.node_dict:
            current_applicable_actions = {act: set() for (act,_) in self.action_arity}
            for act in self.aag.generate_applicable_actions(self.node_dict[state], self.work_aag):
                action_name = self.get_action_name_by_index(act.get_action_index())
                all_action_objects = act.get_object_indices()
                if self.dropped_args is not None and action_name in self.dropped_args:
                    all_action_objects = [val for pos, val in enumerate(all_action_objects)
                                          if pos not in self.dropped_args[action_name]]
                # print(self.seen_applicable_actions)
                current_applicable_actions[action_name].add(tuple(all_action_objects))
            for current_act, seen_groundings in self.seen_applicable_actions.items():
                if len(self.seen_non_applicable_actions[current_act]) > 0:
                    continue
                self.seen_non_applicable_actions[current_act] = {grounding for grounding in self.seen_applicable_actions[current_act]
                                                                 if grounding not in current_applicable_actions[current_act]}

    def get_effects_of_action(self, action):

        out_dict = {0: dict(), 1: dict()}
        affected_tuple_dict = {0: dict(), 1: dict()}

        effatoms = dict()
        effatoms[1] = self.pddl_repo.get_fluent_ground_atoms_from_indices(
            action.get_strips_effect().get_positive_effects())
        effatoms[0] = self.pddl_repo.get_fluent_ground_atoms_from_indices(
            action.get_strips_effect().get_negative_effects())

        for effect, atoms in effatoms.items():
            for atom in atoms:

                name = atom.get_predicate().get_name()
                objs = [x.get_index() for x in atom.get_objects()]

                if name in self.dropped_predicates:
                    continue

                if name in out_dict[effect]:
                    try:
                        for obj_pos, obj in enumerate(objs):
                            out_dict[effect][name][obj_pos].add(obj)
                        affected_tuple_dict[effect][name].add(tuple(objs))
                    except KeyError:
                        '''
                        if we are here the arity of a predicate changed what should never happen
                        '''
                        raise NotImplementedError
                else:
                    affected_tuple_dict[effect][name] = {(tuple(objs))}
                    out_dict[effect][name] = dict()
                    for obj_pos, obj in enumerate(objs):
                        out_dict[effect][name][obj_pos] = {obj}
        return affected_tuple_dict




    def get_random_state(self):
        return random.choice(list(set(self.node_dict.keys())))

    def get_random_state_action_pair(self, positive, action_name):
        if len(self.seen_non_applicable_actions[action_name]) == 0 and not positive:
            return (None, None, None)

        while True:
            state = self.get_random_state()
            pos_actions = self.get_all_reduced_applicable_actions(state, positive, action_name)
            if len(pos_actions) > 0:
                break
        act = random.choice(list(pos_actions))
        if positive:
            return state, act, self.get_effects_of_action(self.state_action_ground_action[(state, (action_name,
                                                                                                   act))])

        return (state, act, None)

    def get_all_reduced_applicable_actions(self, state_index, positive, cur_action_name):
        possible_actions = set()
        all_actions = self.get_all_applicable_actions(state_index)
        for action in all_actions:

            action_name = self.get_action_name_by_index(action.get_action_index())
            if action_name != cur_action_name:
                continue
            action_objects = action.get_object_indices()
            if self.dropped_args is not None and action_name in self.dropped_args:
                args = tuple([obj for obj_num, obj in enumerate(action_objects)
                             if obj_num not in self.dropped_args[action_name]])
                possible_actions.add(tuple(args))
            else:
                possible_actions.add(tuple(action_objects))
        if positive:
            return possible_actions
        else:
            not_possible_actions = {act for act in self.seen_applicable_actions[cur_action_name]
                                    if act not in possible_actions}
            return not_possible_actions

    def get_all_applicable_actions(self, index):
        cur_state = self.node_dict[index]
        applicable_actions = self.aag.generate_applicable_actions(cur_state, self.work_aag)
        return applicable_actions

    def parse_states(self):

        out_dict = dict()

        for state_index, state in self.node_dict.items():
            for x in state.get_fluent_atoms():
                atom = self.pddl_repo.get_fluent_ground_atom(x)
                objs, a_name = atom.get_objects(), atom.get_predicate().get_name()

                if a_name in self.dropped_predicates:
                    continue

                if a_name not in out_dict.keys():
                    out_dict[a_name] = dict()

                for i in range(atom.get_arity()):
                    partial_tuple = tuple([obj if obj_num != i else None for obj_num, obj in enumerate(objs)])
                    if partial_tuple in out_dict[a_name]:
                        out_dict[a_name][partial_tuple].add(tuple(x for x in objs))
                    else:
                        out_dict[a_name][partial_tuple] = {tuple(x for x in objs)}

        return None

    def parse_state_precondition(self, index):
        state_dict = dict()
        state = self.node_dict[index]
        for x in state.get_fluent_atoms():
            atom = self.pddl_repo.get_fluent_ground_atom(x)
            if atom.get_predicate().get_name() in self.dropped_predicates:
                continue
            if atom.get_predicate().get_name() in state_dict:
                state_dict[atom.get_predicate().get_name()].add(tuple([obj.get_index() for obj in atom.get_objects()]))
            else:
                state_dict[atom.get_predicate().get_name()] = {tuple([obj.get_index() for obj in atom.get_objects()])}
        for atom in self.parsed_problem.get_problem().get_static_initial_atoms():
            if atom.get_predicate().get_name() in self.dropped_predicates:
                continue
            if atom.get_predicate().get_name() in state_dict:
                state_dict[atom.get_predicate().get_name()].add(tuple([obj.get_index() for obj in atom.get_objects()]))
            else:
                state_dict[atom.get_predicate().get_name()] = {tuple([obj.get_index() for obj in atom.get_objects()])}
        return state_dict

    def parse_state_precondition_test(self, index):
        state_dict = dict()
        state = self.node_dict[index]
        partial_dict = dict()
        for x in state.get_fluent_atoms():
            atom = self.pddl_repo.get_fluent_ground_atom(x)
            if atom.get_predicate().get_name() in self.dropped_predicates:
                continue
            if atom.get_predicate().get_name() in state_dict:
                state_dict[atom.get_predicate().get_name()].add(tuple([obj.get_index() for obj in atom.get_objects()]))
            else:
                state_dict[atom.get_predicate().get_name()] = {tuple([obj.get_index() for obj in atom.get_objects()])}
            arg_list = [obj.get_index() for obj in atom.get_objects()]
            for i in range(1, len(arg_list)):
                for combi in itertools.combinations(range(len(arg_list)), i):
                    masked_args = tuple([a if a_pos not in combi else None for a_pos, a in enumerate(arg_list)])
                    mask = tuple([None if pos in combi else 0 for pos in range(len(masked_args))])
                    if atom.get_predicate().get_name() not in partial_dict:
                        partial_dict[atom.get_predicate().get_name()] = dict()
                    if mask not in partial_dict[atom.get_predicate().get_name()]:
                        partial_dict[atom.get_predicate().get_name()][mask] = set()
                    partial_dict[atom.get_predicate().get_name()][mask].add(masked_args)


        for atom in self.parsed_problem.get_problem().get_static_initial_atoms():
            if atom.get_predicate().get_name() in self.dropped_predicates:
                continue
            if atom.get_predicate().get_name() in state_dict:
                state_dict[atom.get_predicate().get_name()].add(tuple([obj.get_index() for obj in atom.get_objects()]))
            else:
                state_dict[atom.get_predicate().get_name()] = {tuple([obj.get_index() for obj in atom.get_objects()])}
            arg_list = [obj.get_index() for obj in atom.get_objects()]
            for i in range(1, len(arg_list)):
                for combi in itertools.combinations(range(len(arg_list)), i):
                    masked_args = tuple([a if a_pos not in combi else None for a_pos, a in enumerate(arg_list)])
                    mask = tuple([None if pos in combi else 0 for pos in range(len(masked_args))])
                    if atom.get_predicate().get_name() not in partial_dict:
                        partial_dict[atom.get_predicate().get_name()] = dict()
                    if mask not in partial_dict[atom.get_predicate().get_name()]:
                        partial_dict[atom.get_predicate().get_name()][mask] = set()
                    partial_dict[atom.get_predicate().get_name()][mask].add(masked_args)
        return state_dict, partial_dict

    def action_arities(self):
        action_arities = set()
        for action in self.parsed_problem.get_domain().get_actions():
            action_arities.add((action.get_name(), action.get_arity()))
        return action_arities

    def get_action_arity(self):
        return self.action_arity

    def feature_arities(self):

        feature_ar = set()

        for static_feature in self.parsed_problem.get_domain().get_static_predicates():
            if static_feature.get_name() in self.dropped_predicates:
                print("The predicate {} was dropped!".format(static_feature.get_name()))
                continue
            feature_ar.add((static_feature.get_name(), static_feature.get_arity()))
            if static_feature.get_arity() == 1:
                self.statics.add(static_feature.get_name())

        for static_feature in self.parsed_problem.get_domain().get_fluent_predicates():
            if static_feature.get_name() in self.dropped_predicates:
                print("The predicate {} was dropped!".format(static_feature.get_name()))
                continue
            feature_ar.add((static_feature.get_name(), static_feature.get_arity()))

        return feature_ar

    def get_feature_arity(self):
        return self.feature_arity


    def initialize_state_with_statics(self, in_dicts):

        for x in self.parsed_problem.get_problem().get_static_initial_atoms():
            atom = x

            objs, p_name, p_arity = atom.get_objects(), atom.get_predicate().get_name(), atom.get_arity()

            if p_name in self.dropped_predicates:
                continue

            for mask in in_dicts[p_arity][p_name]:

                partial_tuple = tuple([None if mask[obj_num] == 0
                                       else -1 if mask[obj_num] == -1
                                       else obj.get_index() for obj_num, obj in enumerate(objs)])

                identified_argument = objs[mask.index(-1)].get_index()

                if partial_tuple in in_dicts[p_arity][p_name][mask]:
                    if identified_argument in in_dicts[p_arity][p_name][mask][partial_tuple]:
                        in_dicts[p_arity][p_name][mask][partial_tuple][identified_argument] += 1
                    else:
                        in_dicts[p_arity][p_name][mask][partial_tuple][identified_argument] = 1
                else:
                    in_dicts[p_arity][p_name][mask][partial_tuple] = {identified_argument: 1}


    def parse_state_with_dicts(self, in_dicts, state_index):

        state = self.node_dict[state_index]

        for x in state.get_fluent_atoms():

            atom = self.pddl_repo.get_fluent_ground_atom(x)
            objs, p_name, p_arity = atom.get_objects(), atom.get_predicate().get_name(), atom.get_arity()

            if p_name in self.dropped_predicates:
                continue

            if p_arity == 0:
                continue
            '''
                it has to be unique, since we also need to stratifz the other argument,
                else there can not be a precondition on the full predicate.
                maybe the whole new formulation may be not good ???
                
                the new formulation helps if there is a predicate that identifies two arguments 
                at the same time but not else i guess
            '''
            for mask in in_dicts[p_arity][p_name]:

                partial_tuple = tuple([None if mask[obj_num] == 0
                                       else -1 if mask[obj_num] == -1
                                       else obj.get_index() for obj_num, obj in enumerate(objs)])

                identified_argument = objs[mask.index(-1)].get_index()

                if partial_tuple in in_dicts[p_arity][p_name][mask]:
                    if identified_argument in in_dicts[p_arity][p_name][mask][partial_tuple]:
                        in_dicts[p_arity][p_name][mask][partial_tuple][identified_argument] += 1
                    else:
                        in_dicts[p_arity][p_name][mask][partial_tuple][identified_argument] = 1
                else:
                    in_dicts[p_arity][p_name][mask][partial_tuple] = {identified_argument: 1}
            '''
            for i in range(atom.get_arity() + 1):
                if i < atom.get_arity():
                    mask = tuple([1 if j != i else 0 for j in range(atom.get_arity())])
                else:
                    mask = tuple([0]*atom.get_arity())

                if mask not in in_dicts[p_arity][a_name].keys():
                    continue

                if i < atom.get_arity():
                    partial_tuple = tuple([obj.get_index() if obj_num != i else None for obj_num, obj in enumerate(objs)])
                else:
                    partial_tuple = tuple([None]*atom.get_arity())


                if partial_tuple in in_dicts[p_arity][a_name][mask]:
                    in_dicts[p_arity][a_name][mask][partial_tuple].add(tuple(x.get_index() for x in objs))
                else:
                    in_dicts[p_arity][a_name][mask][partial_tuple] = {tuple(x.get_index() for x in objs)}
            '''
        return in_dicts

    # This function needs to parse the fluent AND static atoms 
    # this is because the statics contained in the state are related to the actions arguments
    def parse_state_with_dict_and_action_args(self, empty_dict, state_index, action_arguments: set, type_list):

        # take above function and add a an actions as an arguments and then filter any atom that does not contain any of the arguments
        state = self.node_dict[state_index]

        fluents = [self.pddl_repo.get_fluent_ground_atom(fluent) for fluent in state.get_fluent_atoms()]
        statics = self.parsed_problem.get_problem().get_static_initial_atoms()

        all_objects = self.parsed_problem.get_problem().get_objects()
        print(self.object_dict)

        all_true_state_atoms = {_pred: set() for _pred in self.feature_arity_dict}
        for atom_set in [statics, fluents]:
            for atom in atom_set:
                _obj_tuple, _atom_predicates = tuple([a.get_index() for a in atom.get_objects()]), atom.get_predicate().get_name()
                all_true_state_atoms[_atom_predicates].add(_obj_tuple)

        out_dicts = {}
        # here we need to build the two different state where the not observed atoms are added...
        for add_true in [True, False]:
            in_dicts = copy.deepcopy(empty_dict)
            for p_name, all_atoms in all_true_state_atoms.items():

                if p_name in type_list:
                    continue

                p_arity = self.feature_arity_dict[p_name]
                if p_arity == 0:
                    continue
                for objs in itertools.product(self.object_dict.keys(), repeat=self.feature_arity_dict[p_name]):

                    #objs, p_name, p_arity = atom.get_objects(), atom.get_predicate().get_name(), atom.get_arity()
                    obj_set = {obj for obj in objs}

                    #if not obj_set.isdisjoint(set(action_arguments)) and objs in all_atoms:
                    #    print('ttt')
                    if not obj_set.isdisjoint(set(action_arguments)) and objs not in all_atoms:
                        continue
                    elif obj_set.isdisjoint(set(action_arguments)):
                        if add_true:
                            continue

                    if p_name in self.dropped_predicates:
                        continue

                    for mask in in_dicts[p_arity][p_name]:

                        partial_tuple = tuple([None if mask[obj_num] == 0
                                               else -1 if mask[obj_num] == -1
                                               else obj for obj_num, obj in enumerate(objs)])

                        identified_argument = objs[mask.index(-1)]

                        if partial_tuple in in_dicts[p_arity][p_name][mask]:
                            if identified_argument in in_dicts[p_arity][p_name][mask][partial_tuple]:
                                in_dicts[p_arity][p_name][mask][partial_tuple][identified_argument] += 1
                            else:
                                in_dicts[p_arity][p_name][mask][partial_tuple][identified_argument] = 1
                        else:
                            in_dicts[p_arity][p_name][mask][partial_tuple] = {identified_argument: 1}

            out_dicts[add_true] = in_dicts

        return out_dicts

        """
        for x in state.get_fluent_atoms():

            atom = self.pddl_repo.get_fluent_ground_atom(x)
            objs, p_name, p_arity = atom.get_objects(), atom.get_predicate().get_name(), atom.get_arity()

            if p_name in self.dropped_predicates:
                continue

            if p_arity == 0:
                continue
            '''
                it has to be unique, since we also need to stratifz the other argument,
                else there can not be a precondition on the full predicate.
                maybe the whole new formulation may be not good ???
                
                the new formulation helps if there is a predicate that identifies two arguments 
                at the same time but not else i guess
            '''
            for mask in in_dicts[p_arity][p_name]:

                partial_tuple = tuple([None if mask[obj_num] == 0
                                       else -1 if mask[obj_num] == -1
                                       else obj.get_index() for obj_num, obj in enumerate(objs)])

                identified_argument = objs[mask.index(-1)].get_index()

                if partial_tuple in in_dicts[p_arity][p_name][mask]:
                    if identified_argument in in_dicts[p_arity][p_name][mask][partial_tuple]:
                        in_dicts[p_arity][p_name][mask][partial_tuple][identified_argument] += 1
                    else:
                        in_dicts[p_arity][p_name][mask][partial_tuple][identified_argument] = 1
                else:
                    in_dicts[p_arity][p_name][mask][partial_tuple] = {identified_argument: 1}

        return in_dicts
        """


    def find_static_unary_preconditions(self):
        # for action in self.action_dict:
        #    print(action)
        #    print(self.action_dict[action])
        #pymimir.Action.get_precondition()
        static_preconditions = dict()

        for action in self.parsed_problem.get_domain().get_actions():
            static_preconditions[action.get_name()] = dict()
            action_variable_list = action.get_precondition().get_parameters()
            for precondition in action.get_precondition().get_precondition():
                if precondition.get_atom().get_predicate().get_arity() != 1:
                    continue

                precondition_var = precondition.get_atom().get_variables()[0]

                for i in range(len(action_variable_list)):
                    if action_variable_list[i] == precondition_var:
                        if i in static_preconditions[action.get_name()]:
                            static_preconditions[action.get_name()][i].add(
                                precondition.get_atom().get_predicate().get_name())
                        else:
                            static_preconditions[action.get_name()][i] = {
                                precondition.get_atom().get_predicate().get_name()}

        return static_preconditions

    def get_preconditions(self):
        out_precs = dict()
        for action in self.parsed_problem.get_domain().get_actions():
            out_precs[action.get_name()] = set()
            action_parameters = [var.get_name() for var in action.get_parameters()]
            for pre in action.get_precondition().get_precondition():
                precondition_vars = [var.get_name() for var in pre.get_atom().get_variables()]
                precondition_pred = pre.get_atom().get_predicate().get_name()
                if precondition_pred in self.dropped_predicates:
                    continue
                pattern = [action_parameters.index(var) for var in precondition_vars]
                if pre.is_negated():
                    out_precs[action.get_name()].add(('not-'+precondition_pred, tuple(pattern)))
                else:
                    out_precs[action.get_name()].add((precondition_pred, tuple(pattern)))
            for pre in action.get_precondition().get_fluent_conditions():
                precondition_vars = [var.get_name() for var in pre.get_atom().get_variables()]
                precondition_pred = pre.get_atom().get_predicate().get_name()
                if precondition_pred in self.dropped_predicates:
                    continue
                pattern = [action_parameters.index(var) for var in precondition_vars]
                if pre.is_negated():
                    out_precs[action.get_name()].add(('not-' + precondition_pred, tuple(pattern)))
                else:
                    out_precs[action.get_name()].add((precondition_pred, tuple(pattern)))
        return out_precs


    def set_predicate_types_for_trace(self, state_trace):

        types = dict()
        full_states = {s: self.parse_state_precondition(s) for s in state_trace}

        for predicate, arity in self.feature_arity_dict.items():
            if predicate in self.unary_static_predicates:
                types[predicate] = {0: {predicate}}
                continue

            possible_types = {position: copy.deepcopy(self.unary_static_predicates) for position in range(arity)}
            for _,state in full_states.items():
                if predicate not in state:
                    continue
                for grounding in state[predicate]:
                    for pos in range(arity):
                        for t in list(possible_types[pos]):
                            if tuple([grounding[pos]]) not in state[t]:
                                possible_types[pos].remove(t)
            types[predicate] = possible_types

        return types


                



    '''
    def get_unary_statics(self):

        for static_atom in self.parsed_problem.get_problem().get_static_initial_atoms():
            if static_atom.get_arity() != 1:
                continue

            if static_atom.get_predicate().get_name() in self.types:
                self.types[static_atom.get_predicate().get_name()].add(static_atom.get_objects()[0].get_index())
            else:
                self.types[static_atom.get_predicate().get_name()] = {static_atom.get_objects()[0].get_index()}

    def get_action_types(self):

        action_position_types = dict()

        for action in self.parsed_problem.get_domain().get_actions():
            action_position_types[action.get_name()] = {x: set() for x in range(action.get_arity())}
            action_variables = action.get_parameters()
            for static_precondition in action.get_precondition().get_precondition():
                if static_precondition.get_atom().get_predicate().get_arity() != 1:
                    continue

                variable = static_precondition.get_atom().get_variables()[0]

                for num, var in enumerate(action_variables):
                    print(var, variable, var == variable)
                    if var == variable:
                        action_position_types[action.get_name()][num].add(static_precondition.get_atom().get_predicate().get_name())
    '''



        #pymimir.StaticGroundAtom.
        #pymimir.ExistentiallyQuantifiedConjunctiveCondition.get_precondition()
