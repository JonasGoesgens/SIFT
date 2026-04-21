import copy
import itertools
from cgi import print_form
from itertools import repeat

import pymimir
from networkx.algorithms.operators.binary import intersection

from py_separator_utils.synth_dependencies.trace_2 import Trace
from py_separator_utils.synth_dependencies.ZFeature import z_feature
from py_separator_utils.synth_dependencies.negated_z_features import NegatedZFeature
from concurrent.futures import ProcessPoolExecutor
from concurrent.futures import as_completed, wait

def parallel_function(current_set, current_dict, num_possible_adds,addition_dicts):

    max_current = max(current_set)
    unique_output = dict()
    possible_output = dict()

    for addset in range(max_current + 1, num_possible_adds):

        if addset in current_set:
            continue

        # we can do this in a ordered way since each of the patterns need to eleminte at least one
        # solution that no other pattern does, else this pattern is obsolete
        combi_dict = dict()
        possible_things, set_is_unique, was_unique, improved = True, True, False, False
        add_dict = addition_dicts[addset]

        unique_counter, occurence_counter = 0, 0

        for key in add_dict:

            all_sets = [current_dict[key], add_dict[key]]
            inter = set.intersection(*all_sets)
            combi_dict[key] = inter

            if len(inter) < 1:
                possible_things = False
                break
            elif len(inter) != 1:
                set_is_unique = False

            if len(inter) < len(current_dict[key]):
                improved = True

        if possible_things and improved:

            new_tuple = [x for x in current_set]
            new_tuple.append(addset)

            if set_is_unique:
                unique_output[tuple(new_tuple)] = combi_dict
            else:
                possible_output[tuple(new_tuple)] = combi_dict

    return unique_output, possible_output

def pattern_max(feature):
    (_, pattern) = feature.get_predicate_pattern()
    max_val = -1
    for pos in pattern:
        if pos is None:
            continue
        max_val = max(max_val, pos)
    return max_val

    #()
    #max_position = -1:

class ValidationFailed(Exception):
    "expection for the case where the validation fails"
    pass

class OverallValidationFailed(Exception):
    "expection for the case where the validation fails"
    pass

class AllActionCandidates:

    def __init__(self, action_arity, predicate_arity, predicate_types, object_types, validation_features):
        self.actions = dict()
        # self.all_predicate_candidates = Candidates(predicate_arity)
        #print("Action Arities", action_arity)
        #print('Predicates', predicate_arity)
        self.all_arities = set([ar for (_, ar) in predicate_arity if ar > 0])
        predicate_names = [name for (name, arity) in predicate_arity]
        if validation_features is None:
            for action, arity in action_arity.items():
                self.actions[action] = ActionCandidates(action, arity, predicate_arity, self.all_arities,
                                                        predicate_types, object_types, None)
        else:
            for action, query_list in validation_features.items():
                self.actions[action] = ActionCandidates(action,None, predicate_arity,
                                                        0, predicate_types,
                                                        object_types, query_list)
        self.results = dict()

    def parse_state(self, parsed_state, action_name, action_objects, state_index):
        # print(action_name, state_index, action_objects)
        if action_name not in self.actions:
            return None
        if self.actions[action_name].is_active():
            self.actions[action_name].parse_state(parsed_state, action_objects, state_index)

        return None

    def parse_state_validation(self, parsed_state, action_name, action_objects, state_index):
        if self.actions[action_name].is_active():
            self.actions[action_name].parse_state_validation(parsed_state, action_objects, state_index)

        return None

    def get_results(self):

        res_dict = dict()

        for act in self.actions:
            act_res = self.actions[act].get_results()
            if len(act_res.keys()) > 0:
                res_dict[act] = act_res

        return res_dict

    def add_query_arguments(self, action, query, trace):
        return self.actions[action].add_query_arguments(query, trace)

    '''
        We can probably remove actions that were not updated in the last iteration
        - return update value for each of the actions!
    '''
    def check_combis(self, trace):
        all_res = False
        for act in self.actions:
            res = self.actions[act].check_combis(trace, act)

            all_res = all_res or res

        return all_res

    def add_arguments(self, trace: Trace):

        added_args = False

        for act in self.actions:
            was_added = self.actions[act].add_arguments(trace)
            added_args = added_args or was_added

        return added_args

    def get_unique_queries(self):
        out = dict()
        for action in self.actions:
            out[action] = self.actions[action].get_unique_queries()
        return out

    def check_all_unique_queries(self, unique_queries, trace):
        for action in self.actions:
            self.actions[action].check_unique_queries(unique_queries[action], trace)
        return True

    def set_unique_patterns(self):
        for _, action_object in self.actions.items():
            action_object.set_unique_patterns()

    def get_not_addable_queries(self, trace: Trace):
        out = {action: dict() for action in self.actions}
        for action_name, action_obj in self.actions.items():
            for query, pos in action_obj.not_addable_arguments(trace).items():
                out[action_name][query] = pos
            for query, pos in action_obj.get_not_addable_combis(trace, action_name).items():
                out[action_name][query] = pos
        return out

'''
    Contains for a single action all predicates
'''
class ActionCandidates:

    def __init__(self, name, arity, predicate_arity, all_arities, predicate_types, object_types, features):

        self.name = name
        self.arity = arity
        self.all_predicate_arities = all_arities
        self.predicate_arity_dict = {pred: ar for (pred, ar) in predicate_arity if ar > 0}
        self.active = True
        self.pattern_dictionary_map = None
        self.z_features = None
        if features is None:
            patterns = self.get_patterns()

            self.z_features = [z_feature(pattern_of_arity, predicate_name, self.name, predicate_arity)
                               for predicate_name, arity in self.predicate_arity_dict.items()
                               for pattern_of_arity in patterns[arity]]

            negated_z_features = [NegatedZFeature(action_pattern, predicate_name, self.name, predicate_types, object_types)
                                       for predicate_name, arity in self.predicate_arity_dict.items()
                                       for action_pattern in patterns[arity]]

            self.z_features = self.z_features + negated_z_features
        else:
            self.z_features, negated_z_features = list(), list()
            for (feature_name, feature_pattern) in features:
                if feature_name.startswith('not-'):
                    feature_name = feature_name[4:]
                    negated_z_features.append(NegatedZFeature(feature_pattern, feature_name, self.name, predicate_types, object_types))
                else:
                    self.z_features.append(z_feature(feature_pattern, feature_name, self.name, predicate_arity))
            self.z_features = self.z_features + negated_z_features
        self.unique_queries = set()


    def is_active(self):
        return self.active

    # returns all possible patterns for an action
    def get_patterns(self):

        pattern_dict = dict()

        for cur_arity in list(self.all_predicate_arities):
            cur_set = set()
            for identified_position in range(cur_arity):
                for number_identifier in range(min(self.arity+1, cur_arity)):
                    some_list = list(range(cur_arity))
                    some_list.remove(identified_position)
                    for id_positions in itertools.combinations(some_list, number_identifier):
                        id_list = list(id_positions)
                        id_list.sort()
                        for identifying_action_positions in itertools.permutations(list(range(self.arity)),
                                                                                   r=number_identifier):
                            pattern = [None] * cur_arity
                            pattern[identified_position] = -1

                            for set_value in range(number_identifier):
                                pattern[id_positions[set_value]] = identifying_action_positions[set_value]

                            cur_set.add(tuple(pattern))

            pattern_dict[cur_arity] = cur_set

        return pattern_dict

    # parse state, raises error if an pattern dies, which is contained in some precondition
    def parse_state_validation(self, parsed_state, object_tuple, state_index):
        self.parse_state_internal(parsed_state, object_tuple, state_index, True)

    # parse state, drops pattern that does not have a z in some state
    def parse_state(self, parsed_state, object_tuple, state_index):
        self.parse_state_internal(parsed_state, object_tuple, state_index, False)

    # parse state
    def parse_state_internal(self,  parsed_state, object_tuple, state_index, validation: bool):
        drop_set = set()

        for position, z_feat in enumerate(self.z_features):
            if z_feat.is_active():
                still_possible = z_feat.check_candidates(parsed_state, object_tuple, state_index)
                if not still_possible:
                    if validation:
                        print('add1')
                        raise ValidationFailed
                    drop_set.add(position)
            else:
                drop_set.add(position)

        self.z_features = [z_feat for i, z_feat in enumerate(self.z_features) if i not in drop_set]

    # gets unique patterns
    def get_unique_queries(self):
        return self.unique_queries

    # returns all patterns which z variable corresponds to an action argument
    def not_addable_arguments(self, trace: Trace):
        output = dict()
        for feature in self.z_features:
            if feature.is_unique() and feature.is_active():
                positions = feature.contained_positions(trace)
                if len(positions) > 0:
                    output[feature.get_predicate_pattern()] = positions
        return output

    # This is still missing
    def not_addable_combis(self, trace):
        return set()

    # adds the arguments for single patterns which are unique
    def add_arguments(self, trace: Trace):

        added = False

        for feature in self.z_features:
            was_added = feature.add_arguments(trace)
            added = was_added or added
            if feature.is_active() and feature.is_unique():
                fdict = feature.get_identified_arguments()
                new_dict = {x:list(val)[0] for x, val in fdict.items()}
                already_contained = trace.is_contained_in_positions(new_dict, self.name)
                for pos in already_contained:
                    self.unique_queries.add((pos, frozenset([feature.get_predicate_pattern()])))

        return added

    # updates self.unique_queries
    def set_unique_patterns(self):
        for feature in self.z_features:
            if feature.is_active() and feature.is_unique():
                self.unique_queries.add(frozenset([feature.get_predicate_pattern()]))

    # check for what this is used
    def get_results(self):

        res_dict = dict()

        for z_feat in self.z_features:
            if z_feat.is_active() and z_feat.is_unique():
                res = z_feat.get_results()
            else:
                continue
                # res = z_feat.get_results()
            if res is not None:
                if z_feat.action_pattern in res_dict:
                    res_dict[z_feat.action_pattern].append(res)
                else:
                    res_dict[z_feat.action_pattern] = [res]

        return res_dict

    # build a mapping from z-feature to its position in a list
    def set_pattern_dictionary_map(self):
        self.pattern_dictionary_map = dict()
        for pos, feature in enumerate(self.z_features):
            self.pattern_dictionary_map[feature.get_predicate_pattern()] = pos

    # used for validation
    # for a given query add its arguments to the action groundings, returns false if this fails
    def add_query_arguments(self, query, trace):
        self.set_pattern_dictionary_map()
        if len(query) == 1:
            try:

                return self.z_features[self.pattern_dictionary_map[list(query)[0]]].add_arguments(trace)
            except KeyError:
                return False
            #    raise ValidationFailed
        elif len(query) == 0:
            raise ValueError

        try:
            all_dicts = [self.z_features[self.pattern_dictionary_map[feat]].get_identified_arguments()
                     for feat in query]
        except KeyError:
            return False

        intersetion_dict = dict()
        states = all_dicts[0].keys()
        for state in states:
            set_list = [dic[state] for dic in all_dicts]
            inter = set.intersection(*set_list)
            if len(inter) == 0:
                #print('add2')
                return False
            elif len(inter) > 1:
                #print('IT IS NOT UNIQUE')
                return False
            intersetion_dict[state] = list(inter)[0]

        possible = trace.add_arguments(intersetion_dict, self.name, query)

        if not possible:
            # print('add3')
            return False

        return True

    # checks for every combination is unique AND tries to add the arguments
    def check_combis(self, trace: Trace, action_name):
        return self.check_combis_internal(trace, action_name, True)

    # checks for every combination if its unquer, returns all combinations that are unique and its values
    # cannot be added since the arguments are already contained in the action groundings
    def get_not_addable_combis(self, trace: Trace, action_name):
        return self.check_combis_internal(trace, action_name, False)

    # combines all non-unique and active patterns, to see whether the combination is unique
    def check_combis_internal(self, trace: Trace, action_name, add_args):

        already_contained_input = dict()

        argument_was_added = False

        non_unique = [z_feat for z_feat in self.z_features if not z_feat.is_unique() and z_feat.is_active()]

        added_tuples = []
        current_sets = [[i] for i in range(len(non_unique))]
        additions = [i for i in range(len(non_unique))]
        all_combi_dicts = {tuple([pos]): non_unique[pos].get_identified_arguments() for pos in range(len(non_unique))}
        addition_dicts = {pos: non_unique[pos].get_identified_arguments() for pos in range(len(non_unique))}

        while len(current_sets) > 0:

            print(len(current_sets), len(non_unique))

            next_sets = []
            next_all_combi_dicts = dict()

            for cset in current_sets:
                u_res, p_res = parallel_function(
                                        cset,
                                        all_combi_dicts[tuple(cset)],
                                        len(non_unique),
                                        addition_dicts
                                        )

                for c_tuple, c_dict in u_res.items():

                    # self.unique_queries.add(frozenset([non_unique[pos].get_predicate_pattern() for pos in c_tuple]))

                    test_addition_dict = {key: list(val)[0] for key, val in c_dict.items()}
                    combi_added_thingy = False
                    if add_args:
                        combi_added_thingy = trace.add_arguments(test_addition_dict, action_name,
                                                             {non_unique[c].get_predicate_pattern() for c in c_tuple})
                        already_contained_positions = trace.is_contained_in_positions(test_addition_dict, action_name)
                        for pos in already_contained_positions:
                            self.unique_queries.add((pos,
                                frozenset([non_unique[pos].get_predicate_pattern() for pos in c_tuple])))
                    else:
                        already_contained_positions = trace.is_contained_in_positions(test_addition_dict, action_name)
                        if len(already_contained_positions) > 0:
                            already_contained_input[frozenset([non_unique[pos].get_predicate_pattern() for pos in c_tuple])] = already_contained_positions


                    added_tuples.append(set(c_tuple))

                    if combi_added_thingy:
                        print('THERE WAS AN ARGUMENT ADDED BY AN COMBINATION!')
                        argument_was_added = True
                        print(self.name)
                        for x in c_tuple:
                            print(non_unique[x].action_pattern, non_unique[x].predicate_name,
                                  non_unique[x].get_name())
                        print('############################################\n')

                for p_tuple, p_dict in p_res.items():
                    next_sets.append(copy.deepcopy(p_tuple))
                    next_all_combi_dicts[p_tuple] = p_dict

            all_combi_dicts = next_all_combi_dicts
            current_sets = copy.deepcopy(next_sets)
        if add_args:
            return argument_was_added
        else:
            return already_contained_input

    # checks for a set of give queries, whether they are unique in a parsed state
    def check_unique_queries(self, queries, trace):
        self.set_pattern_dictionary_map()
        # print(queries)
        for (q_positions,q) in queries:
            if len(q) == 1:
                try:
                    feature = self.z_features[self.pattern_dictionary_map[list(q)[0]]]
                    if not feature.is_active() or not feature.is_unique():
                        #print('add4')
                        raise ValidationFailed
                    fdict = feature.get_identified_arguments()
                    new_dict = {x: list(val)[0] for x, val in fdict.items()}
                    already_contained = trace.is_contained_in_positions(new_dict, self.name)
                    if q_positions not in already_contained:
                        #print('add5', q_positions, already_contained, feature.get_predicate_pattern())
                        raise ValidationFailed
                except KeyError:
                    #print('xxx', self.pattern_dictionary_map)
                    #print('add6')
                    raise ValidationFailed
            else:

                try:
                    all_dicts = [self.z_features[self.pattern_dictionary_map[feat]].get_identified_arguments()
                                 for feat in q]
                except KeyError:
                    #print('Pattern Dictionary Map', self.pattern_dictionary_map)
                    #print('add')
                    raise ValidationFailed
                addition_dict = dict()
                states = all_dicts[0].keys()
                for state in states:
                    set_list = [dic[state] for dic in all_dicts]
                    inter = set.intersection(*set_list)
                    if len(inter) != 1:
                        raise ValidationFailed
                    addition_dict[state] = list(inter)[0]
                possible_positions = trace.is_contained_in_positions(addition_dict, self.name)
                if q_positions not in possible_positions:
                    raise ValidationFailed


        return True

