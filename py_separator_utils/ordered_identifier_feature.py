import itertools
import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
from py_separator_utils.feature import Feature
from py_separator_utils.equivalence_classes import EquivalenceClasses
from typing import Optional
from collections import defaultdict
class Ordered_Identifier_Feature:
    def __init__(self, existence_feature : Optional[Feature],
        add_patterns : pt.PatternTSetLike,
        del_patterns : pt.PatternTSetLike,
        pre_patterns : pt.PatternTSetLike,
        type_combination : Optional[pt.TypeCombi] = None
    ):
        if existence_feature is not None:
            if (existence_feature.is_invalid()):
                raise ValueError("The existence feature must be admissible.")
            if (not existence_feature.has_unique_colouring()):
                raise ValueError("Identification is only implemented and necessary for existence features with a unique solution.")
            self.type_combination = existence_feature.get_type_combination()
        else:
            if type_combination is None:
                raise ValueError("For static existence the typecombination needs to be given.")
            self.type_combination = type_combination
        self.type_combination.freeze()
        self.existence_feature = existence_feature
        self.add_patterns = frozenset(add_patterns)
        self.del_patterns = frozenset(del_patterns)
        self.pre_patterns = set(pre_patterns)
        self.disabled_pre_patterns = set()
        #We need an ordered way to iterate over additional arguments in case
        #a single feature indroduce multiple arguments to a single edge.
        self.argument_identifier_patterns = tuple(sorted(
            self.del_patterns
        ))
        #dict (instance, state, pt.Ground_Edge_Info, identifier_pattern) -> object
        #Ground_Edge_Info and identifier pattern fix the grounding
        self.additional_arguments = dict()

    def overwrite_feature(self, other):
        if not isinstance(other, Ordered_Identifier_Feature):
            raise ValueError("A feature can only be overwritten by a feature.")
        elif (other.get_identifier() != self.get_identifier()):
            raise ValueError("A feature can only be overwritten by a logically identical feature.")
        else:
            self.pre_patterns = set(other.pre_patterns)
            self.argument_identifier_patterns = other.argument_identifier_patterns
            if other.additional_arguments is None:
                self.additional_arguments = None
            else:
                self.additional_arguments = other.additional_arguments.copy()
            self.disabled_pre_patterns = other.disabled_pre_patterns.copy()

    def update_argument_identifier_patterns(self):
        new_argument_identifier_patterns = tuple(sorted(
            (self.del_patterns.union(
                self.pre_patterns.difference(self.disabled_pre_patterns)
            )).difference(self.argument_identifier_patterns)
        ))
        self.argument_identifier_patterns = self.argument_identifier_patterns + new_argument_identifier_patterns
        return new_argument_identifier_patterns

    def update_pre_patterns(self, pre_patterns : pt.PatternTSetLike):
        self.pre_patterns.update(pre_patterns)

    def get_type_combination(self):
        return self.type_combination

    def set_type_combination(self, type_combination : pt.TypeCombi):
        self.type_combination = type_combination
        self.type_combination.freeze()

    def __repr__(self):
        return f"OI Feature({self.get_identifier()}, {not self.is_invalid()})"

    def __str__(self):
        if self.is_invalid():
            return f"OI Feature is invalid. {self.get_identifier()}"

        output_lines = []
        output_lines.append(f"Type Combination: {self.get_type_combination()}")

        output_lines.append(f"  Add List: {self.add_patterns}")
        output_lines.append(f"  Delete List: {self.del_patterns}")
        output_lines.append(f"  Preconditions: {self.pre_patterns.difference(self.disabled_pre_patterns)}")
        #output_lines.append(f"  Identifier Patterns: {self.argument_identifier_patterns}")
        output_lines.append("")

        return "\n".join(output_lines)

    def parse_edge_label(self, instance : int,
        edge_label : pt.Edge_LabelT,
        state_label : pt.State_LabelT,
        in_state_identified_object : pt.ObjectT,
        out_state_identified_object : pt.ObjectT,
        grounding : pt.GroundingT
    ) -> (bool, bool, set, pt.ObjectT, pt.ObjectT):
        #grounding a tupel holding the currently active objects
        found_add_matching = False
        found_add_unmatching = False
        found_del_matching = False
        found_del_unmatching = False
        matching_precondition_patterns = set()
        for label in edge_label:
            found_add = False
            found_del = False
            for sel_pat in self.add_patterns:
                mismatch = False
                if label[0] != sel_pat[0]:
                    mismatch = True
                else:
                    #this loop will not run for zeronary features
                    for index, entry in enumerate(sel_pat[1][:-1]):
                        object_pat = grounding[index]
                        object_label = label[1][entry]
                        if object_label != object_pat:
                            mismatch = True
                if not mismatch:
                    found_add = True
                    #seting value for add can be done greedily
                    edge_out_identified_object = label[1][sel_pat[1][-1]]
                    if out_state_identified_object is None:
                        out_state_identified_object = edge_out_identified_object
                    elif out_state_identified_object != edge_out_identified_object:
                        self.invalitate()
                        return None
                    if in_state_identified_object == out_state_identified_object:
                        #switching effects must actually switch something
                        self.invalitate()
                        return None
            if found_add:
                found_add_matching = True
            else:
                found_add_unmatching = True
            if found_add_matching and found_add_unmatching:
                #other check should fail in this case to as the stored value
                #must be changed and remain unchanged at the same time.
                #This also means this property is decided already
                #after the first label in the edge_label.
                self.invalitate()
                return None
            for sel_pat in self.del_patterns:
                mismatch = False
                if label[0] != sel_pat[0]:
                    mismatch = True
                else:
                    #this loop will not run for zeronary features
                    for index, entry in enumerate(sel_pat[1]):
                        object_pat = grounding[index]
                        object_label = label[1][entry]
                        if object_label != object_pat:
                            mismatch = True
                if not mismatch:
                    found_del = True
                    if in_state_identified_object == pt.ObjectNotExisting:
                        #the previous value must be still unknown or given.
                        #but it can not be no value stored.
                        self.invalitate()
                        return None
                    #for deletes we need to know whether there was an add
                    if found_add_unmatching:
                        if out_state_identified_object is not None:
                            if out_state_identified_object != pt.ObjectNotExisting:
                                self.invalitate()
                                return None
                        else:
                            out_state_identified_object = pt.ObjectNotExisting
                    if in_state_identified_object is not None:
                        for state in state_label:
                            if (
                                instance, state, label, sel_pat
                            ) in self.additional_arguments:
                                #check same in_state_identified_object
                                if self.additional_arguments[
                                    (instance, state, label, sel_pat)
                                ] != in_state_identified_object:
                                    self.invalitate()
                                    return None
                            else:
                                #set it
                                self.additional_arguments[
                                    (instance, state, label, sel_pat)
                                ] = in_state_identified_object
            if found_del:
                found_del_matching = True
            else:
                found_del_unmatching = True
            if found_del_matching and found_del_unmatching:
                #other check should fail in this case to as the stored value
                #must be existing and changed and (not existing and added or
                #existing and unchanged) at the same time.
                #This also means this property is decided already
                #after the first label in the edge_label.
                self.invalitate()
                return None
            if found_add_matching and found_del_unmatching:
                #in state has no stored object
                if in_state_identified_object is not None:
                    if in_state_identified_object != pt.ObjectNotExisting:
                        self.invalitate()
                        return None
                else:
                    in_state_identified_object = pt.ObjectNotExisting
            if found_add_unmatching and found_del_unmatching:
                #inactive edge copy over info
                if in_state_identified_object is None:
                    in_state_identified_object = out_state_identified_object
                elif out_state_identified_object is None:
                    out_state_identified_object = in_state_identified_object
                elif in_state_identified_object != out_state_identified_object:
                    self.invalitate()
                    return None
            for sel_pat in self.pre_patterns:
                mismatch = False
                if label[0] != sel_pat[0]:
                    mismatch = True
                else:
                    #this loop will not run for zeronary features
                    for index, entry in enumerate(sel_pat[1]):
                        object_pat = grounding[index]
                        object_label = label[1][entry]
                        if object_label != object_pat:
                            mismatch = True
                if not mismatch:
                    matching_precondition_patterns.add(sel_pat)
                    if in_state_identified_object == pt.ObjectNotExisting:
                        print(f"False indentifing precontition, this should never happen. oi feature:\n{self}existence:\n{self.existence_feature}")
                        self.invalitate()
                        return None
                    elif in_state_identified_object is not None:
                        for state in state_label:
                            if (
                                instance, state, label, sel_pat
                            ) in self.additional_arguments:
                                #check same in_state_identified_object
                                if self.additional_arguments[
                                    (instance, state, label, sel_pat)
                                ] != in_state_identified_object:
                                    self.invalitate()
                                    return None
                            else:
                                #set it
                                self.additional_arguments[
                                    (instance, state, label, sel_pat)
                                ] = in_state_identified_object

        return (found_add_matching,
            found_del_matching,
            matching_precondition_patterns,
            in_state_identified_object,
            out_state_identified_object)

    def label_graph(self, instance : int,
        graph : pt.GraphT,
        grounding : pt.GroundingT
    ):
        #identify missing arguments and store the correct label
        active_precondition_patterns = set()
        found_effect = False
        open_list = set(graph.nodes())
        object_memory = defaultdict(lambda: None)
        while len(open_list) > 0:
            next_open_list = set()
            for node in open_list:
                for edge in list(
                    graph.in_edges([node],data='action')
                ) + list(
                    graph.out_edges([node],data='action')
                ):
                    known_in_object = object_memory[edge[0]]
                    known_out_object = object_memory[edge[1]]
                    state_label = graph.nodes[edge[0]].get('merged')
                    if state_label is None:
                        state_label = {edge[0]}
                    else:
                        state_label.add(edge[0])
                    edge_label = edge[2]
                    result = self.parse_edge_label(
                        instance,
                        edge_label,
                        state_label,
                        known_in_object,
                        known_out_object,
                        grounding
                    )
                    if result is None:
                        self.invalitate()
                        return None
                    if self.is_invalid():
                        return None
                    (
                        found_add_matching,
                        found_del_matching,
                        active_precs,
                        new_in_object,
                        new_out_object
                    ) = result
                    active_precondition_patterns.update(active_precs)
                    #termination is ensured as each state can only change the remembered object once.
                    if known_in_object != new_in_object:
                        next_open_list.add(edge[0])
                    if known_out_object != new_out_object:
                        next_open_list.add(edge[1])
                    object_memory[edge[0]] = new_in_object
                    object_memory[edge[1]] = new_out_object
            if next_open_list:
                #if we don't find an effect for this grounding we do not want to see the preconditions.
                found_effect = True
            open_list = next_open_list
        if not found_effect:
            #Note this rull is only reliable for full graph inputs.
            self.disabled_pre_patterns.update(active_precondition_patterns)
        return object_memory

    def get_identifier(self):
        #returns the add/del-frozensets to use as key in dicts
        #in theory a feature is completly determined by the selected patterns
        #all other vars are merly computional caches
        #converging into the same form for the same input no matter the order
        #give the two important sets a distinct order to recognize the sign_switch.
        return (self.add_patterns,self.del_patterns)

    def get_argument_identifier_patterns(self):
        #returns the identifier patterns to correctly iterate over added arguments.
        return self.argument_identifier_patterns

    def __hash__(self):
        #implemented hash to allow direct use in dicts
        #only the first added feature will be present in a set
        #in most cases this should be the desired behaviour
        return hash(self.get_identifier())

    def __eq__(self, other):
        if isinstance(other, Ordered_Identifier_Feature):
            return self.get_identifier() == other.get_identifier()
        return False

    def invalitate(self):
        self.additional_arguments = None

    def has_static_existence(self):
        return self.existence_feature is None

    def is_invalid(self):
        if self.existence_feature is not None:
            if self.existence_feature.is_invalid():
                return True
        return self.additional_arguments == None

    @classmethod
    def expand_adding_patterns(cls, 
        adding_patterns : pt.PatternTSetLike,
        action_arities : pt.ArityInfoT
    ) -> pt.SetLike[frozenset[pt.PatternT]]:
        combinations_dict = dict()
        for exist_pattern in adding_patterns:
            combinations_dict[exist_pattern] = set()
            arity = action_arities[exist_pattern[0]]
            for argument in range(arity):
                if argument not in exist_pattern[1]:
                    combinations_dict[exist_pattern].add((
                        exist_pattern[0],exist_pattern[1]+(argument,)
                    ))
        all_combinations = set()
        for combination_set in itertools.product(*combinations_dict.values()):
            all_combinations.add(frozenset(combination_set))
        return all_combinations

    @classmethod
    def expand_existence_feature(cls, feature : Feature,
        dead_patterns : pt.PatternTSetLike,
        equivalent_switching_patterns : EquivalenceClasses[pt.PatternT],
        action_arities : pt.ArityInfoT
    ) -> list['Ordered_Identifier_Feature']:
        new_feature_list = list()
        if not feature.has_unique_colouring():
            # It is not necessary to expand non unique features as
            # there will always be unique feature holding the same info.
            return new_feature_list
        for sign_switch in {0,1}:
            #if coloring is unique, color splits will be a list of length 1
            split = feature.get_color_split_combination(0)
            add_patterns = split[sign_switch]
            if any(
                action_arities[add_pattern[0]] <= len(add_pattern[1])
                for add_pattern in add_patterns
            ):
                continue
            del_patterns = split[1-sign_switch]
            pre_patterns = split[2+sign_switch]
            switching_patterns = set(pre_patterns)
            switching_patterns.difference_update(dead_patterns)
            switching_patterns.difference_update(
                equivalent_switching_patterns.get_listed_elements()
            )
            switching_patterns = ut.pack_into_frozensets(switching_patterns)
            switching_patterns.update(
                equivalent_switching_patterns.filter_valid_related_groups(
                    pre_patterns.difference(dead_patterns), dead_patterns
                )
            )
            switching_patterns = ut.power_set_without_empty_set(switching_patterns)
            switching_patterns = ut.extract_from_double_packed_frozensets(switching_patterns)
            switching_patterns.add(frozenset())
            for sw_patterns in switching_patterns:
                for add_sw_patterns in cls.expand_adding_patterns(
                    add_patterns.union(sw_patterns), action_arities
                ):
                    id_feature = Ordered_Identifier_Feature(
                        feature,
                        add_sw_patterns,
                        del_patterns.union(sw_patterns),
                        pre_patterns.difference(sw_patterns)
                    )
                    new_feature_list.append(id_feature)
        return new_feature_list

    @classmethod
    def create_io_features_for_static_type_combination(cls,
        type_combination : pt.TypeCombi,
        all_patterns : pt.PatternTSetLike,
        dead_patterns : pt.PatternTSetLike,
        equivalent_switching_patterns : EquivalenceClasses[pt.PatternT],
        action_arities : pt.ArityInfoT
    ) -> list['Ordered_Identifier_Feature']:
        new_feature_list = list()
        switching_patterns = set(all_patterns)
        switching_patterns.difference_update(dead_patterns)
        switching_patterns.difference_update(
            equivalent_switching_patterns.get_listed_elements()
        )
        switching_patterns = ut.pack_into_frozensets(switching_patterns)
        switching_patterns.update(
            equivalent_switching_patterns.filter_valid_related_groups(
                all_patterns.difference(dead_patterns), dead_patterns
            )
        )
        switching_patterns = ut.power_set_without_empty_set(switching_patterns)
        switching_patterns = ut.extract_from_double_packed_frozensets(switching_patterns)
        for sw_patterns in switching_patterns:
            for add_sw_patterns in cls.expand_adding_patterns(
                sw_patterns, action_arities
            ):
                id_feature = Ordered_Identifier_Feature(
                    None,
                    add_sw_patterns,
                    sw_patterns,
                    all_patterns.difference(sw_patterns),
                    type_combination
                )
                new_feature_list.append(id_feature)
        return new_feature_list
