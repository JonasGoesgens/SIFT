import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
from py_separator_utils.sift import SIFT
from py_separator_utils.feature import Feature
from py_separator_utils.ordered_identifier_feature import Ordered_Identifier_Feature as OIFeature
from py_separator_utils.conflict_manager import ConflictManager
import copy
import sys
from typing import Tuple
from concurrent.futures import ProcessPoolExecutor, ALL_COMPLETED, as_completed, wait
class Argument_Recovery_Sift:
    def __init__(self, graphs : list[tuple[pt.GraphT,pt.NodeT]]):
        self.sift_iterations = dict()
        self.sift_iterations[0] = SIFT(graphs)
        self.order_id_features = set()
        self.arg_feature_assignments = dict()
        self.admissible_order_id_features = set()
        self.argument_identifier_features = tuple()
        self.updated_oi_features = set()
    @classmethod
    def _check_feature(
        cls, oi_feature : OIFeature,
        check_list : list[tuple[int, pt.GraphT, pt.GroundingT]]
    ):
        for instance, graph, grounding in check_list:
            if oi_feature.is_invalid():
                break
            oi_feature.label_graph(instance, graph, grounding)
        oi_feature.update_argument_identifier_patterns()
        return oi_feature

    def _get_graph_list_for_feature(self, oi_feature : OIFeature, iteration : int) -> list[tuple[pt.GraphT, pt.GroundingT]]:
        check_list = list()
        if oi_feature.is_invalid():
            return check_list
        type_combination = oi_feature.get_type_combination()
        for instance, groundings in self.sift_iterations[iteration].LOCM_types.get_all_groundings_for_typecombination(
            type_combination
        ).items():
            for grounding in groundings:
                graph, initial_state = self.sift_iterations[iteration].all_graphs[instance].get_switching_graph_for_grounding(
                    grounding, type_combination
                )
                check_list.append((instance, graph, grounding))
        return check_list

    def type_sort_features(self, iteration : int):
        #regroup arguments in patterns by type if they got merged.
        features_sorting = dict()
        for feature in self.sift_iterations[iteration].all_features:
            features_sorting[feature] = feature.get_type_sorted_feature(
                self.sift_iterations[iteration].LOCM_types
            )
        oi_features_sorting = dict()
        for oi_feature in self.order_id_features:
            #there may be errors leading to a feature not being sorted
            if oi_feature.existence_feature is None:
                oi_features_sorting[oi_feature] = oi_feature.get_type_sorted_feature(
                    self.sift_iterations[iteration].LOCM_types,
                    None
                )
            elif oi_feature.existence_feature in features_sorting:
                if oi_feature.existence_feature is features_sorting[oi_feature.existence_feature]:
                    #we did not sort existence so dont sort oi either
                    continue
                oi_features_sorting[oi_feature] = oi_feature.get_type_sorted_feature(
                    self.sift_iterations[iteration].LOCM_types,
                    features_sorting[oi_feature.existence_feature]
                )
            else:
                #we did not sort existence so dont sort oi either
                continue

        self.sift_iterations[iteration].all_features = set(
            features_sorting.get(feature,feature)
            for feature in self.sift_iterations[iteration].all_features
        )
        self.sift_iterations[iteration].admissible_features = set(
            features_sorting.get(feature,feature)
            for feature in self.sift_iterations[iteration].admissible_features
        )
        self.order_id_features = set(
            oi_features_sorting.get(oi_feature,oi_feature)
            for oi_feature in self.order_id_features
        )
        self.argument_identifier_features = tuple(
            oi_features_sorting.get(oi_feature,oi_feature)
            for oi_feature in self.argument_identifier_features
        )
        self.updated_oi_features = set(
            oi_features_sorting.get(oi_feature,oi_feature)
            for oi_feature in self.updated_oi_features
        )

    def update_type_combination_keys(self, iteration : int):
        #check for already existing features to update their typing if necessary
        for oi_feature in self.order_id_features:
            type_combination = self.sift_iterations[iteration].LOCM_types.update_type_combination(
                oi_feature.get_type_combination()
            )
            oi_feature.set_type_combination(type_combination)
            if oi_feature.is_invalid():
                continue
            if oi_feature.has_static_existence():
                #Add and delete pattens appear always together.
                new_patterns = set(
                    self.sift_iterations[iteration].LOCM_types.get_all_patterns_for_typecombination(type_combination)
                ).difference(oi_feature.del_patterns)
            else:
                if not oi_feature.existence_feature.has_unique_colouring():
                    continue
                split = oi_feature.existence_feature.get_color_split_combination(0)
                cut_add_list = {
                    (action,arguments[:-1])
                    for (action,arguments) in oi_feature.add_patterns if len(arguments) > 0
                }
                if split[0].intersection(cut_add_list) or split[1].intersection(oi_feature.del_patterns):
                    new_patterns = set(split[2].difference(cut_add_list.union(oi_feature.del_patterns)))
                elif split[1].intersection(cut_add_list) or split[0].intersection(oi_feature.del_patterns):
                    new_patterns = set(split[3].difference(cut_add_list.union(oi_feature.del_patterns)))
                else:
                    continue
            new_patterns.difference_update(oi_feature.pre_patterns)
            oi_feature.update_pre_patterns(new_patterns)
            if new_patterns:
                self.updated_oi_features.add(oi_feature)

    def run_iteration(self, iteration : int, process_pool_args : dict) -> set[Feature]:
        features = self.sift_iterations[iteration].run(process_pool_args)
        action_arities = self.sift_iterations[iteration].LOCM_types.get_action_arities()
        equivalent_switching_patterns = self.sift_iterations[iteration].equivalent_switching_patterns
        #oi features from fluids
        for feature in features:
            dead_patterns = self.sift_iterations[
                iteration
            ].get_dead_switching_patterns_for_typecombination(
                feature.get_type_combination()
            )
            self.order_id_features.update(
                OIFeature.expand_existence_feature(
                    feature,
                    dead_patterns,
                    equivalent_switching_patterns,
                    action_arities
                )
            )
        #oi features from statics
        for type_combinations in self.sift_iterations[iteration].LOCM_types.get_all_type_combinations().values():
            for type_combination in type_combinations:
                all_patterns = self.sift_iterations[iteration].LOCM_types.get_all_patterns_for_typecombination(type_combination)
                dead_patterns = self.sift_iterations[iteration].get_dead_switching_patterns_for_typecombination(type_combination)
                equivalent_switching_patterns = self.sift_iterations[iteration].equivalent_switching_patterns
                self.order_id_features.update(
                    OIFeature.create_io_features_for_static_type_combination(
                        type_combination,
                        all_patterns,
                        dead_patterns,
                        equivalent_switching_patterns,
                        action_arities
                    )
                )
        #run ar sift
        with ProcessPoolExecutor(**process_pool_args) as process_pool:
            runs = dict()
            for oi_feature in self.order_id_features:
                if oi_feature.is_invalid():
                    continue
                if oi_feature in self.argument_identifier_features and oi_feature not in self.updated_oi_features:
                    #no need to check them again
                    #unless they got more prec patterns
                    #TODO prec pat
                    continue
                check_list = self._get_graph_list_for_feature(oi_feature, iteration)
                runs[oi_feature] = process_pool.submit(
                    self.__class__._check_feature,
                    oi_feature, check_list
                )
            wait(runs.values(), return_when=ALL_COMPLETED)
            for oi_feature, future in runs.items():
                try:
                    checked_oi_feature = future.result()
                    oi_feature.overwrite_feature(checked_oi_feature)
                except Exception as e:
                    sys.stderr.write(f"Error processing {oi_feature}: {e}")

        for feature in self.order_id_features:
            if not feature.is_invalid():
                self.admissible_order_id_features.add(feature)

        return self.admissible_order_id_features

    def run(self,
        process_pool_args : dict,
        max_iterations : int = 0,
        find_oi_features_in_last_iteration : bool = False
    ):
        iteration = 0
        input_changed = True
        #self.arg_feature_assignments = dict()
        while input_changed and (
            max_iterations == 0 or
            iteration < max_iterations
        ):
            self.run_iteration(iteration, process_pool_args)
            new_oi_features = tuple(
                self.admissible_order_id_features.difference(self.argument_identifier_features)
            )
            for oi_feature in new_oi_features:
                oi_feature.update_argument_identifier_patterns()
            self.argument_identifier_features = self.argument_identifier_features + new_oi_features
            iteration += 1
            self.sift_iterations[iteration] = copy.deepcopy(
                self.sift_iterations[iteration - 1]
            )
            self.sift_iterations[iteration].delete_complex_pattern_relations()

            input_changed, arg_feature_assignment = self.update_graphs(
                tuple(
                    feature
                    for feature in self.argument_identifier_features
                    if feature in self.updated_oi_features and
                    not feature.is_invalid()
                ) + new_oi_features,
                iteration
            )
            self.updated_oi_features = set()

            self.type_sort_features(iteration)
            self.update_type_combination_keys(iteration)

            for action, assignments in arg_feature_assignment.items():
                if action not in self.arg_feature_assignments:
                    self.arg_feature_assignments[action] = assignments
                else:
                    for index, assignment in assignments.items():
                        self.arg_feature_assignments[action][index] = assignment

        if find_oi_features_in_last_iteration:
            self.run_iteration(iteration, process_pool_args)
        else:
            self.sift_iterations[iteration].run(process_pool_args)

        return (
            self.admissible_order_id_features,
            self.sift_iterations[iteration].admissible_features
        )

    def update_graphs(self,
        new_oi_features : tuple[OIFeature],
        iteration : int
    ):
        new_graphs = list()
        arities = dict()
        arg_feature_assignment = dict()
        old_arities = self.sift_iterations[iteration].LOCM_types.action_arities.copy()
        arg_conflicts = ConflictManager[Tuple[pt.ActionT,int]]()

        #Add all deduced arguments to graph
        for instance, graphholder in self.sift_iterations[iteration].all_graphs.items():
            graph = graphholder.base_graph
            init = graphholder.initial_state
            for state, next_state, edge_label in graph.edges(data='action'):
                for label in edge_label.copy():
                    new_label = label
                    for oi_feature in new_oi_features:
                        for ai_pattern in oi_feature.argument_identifier_patterns:
                            #if ai_pattern in oi_feature.disabled_pre_patterns:
                            #    continue
                            new_arg = oi_feature.additional_arguments.get(
                                (instance, state, label, ai_pattern)
                            )
                            if new_arg is None:
                                new_arg = pt.ObjectNotKnown
                            new_index = len(new_label[1])
                            #Remember diffences to already known arguments
                            #to later delete args the do not add new information
                            if new_arg != pt.ObjectNotKnown:
                                for index, arg in enumerate(new_label[1]):
                                    if new_arg != arg:
                                        arg_conflicts.add_conflict(
                                            (new_label[0],index),
                                            (new_label[0],new_index)
                                        )
                                arg_conflicts.add_conflict(
                                    (new_label[0],pt.ObjectNotKnown),
                                    (new_label[0],new_index)
                                )
                            new_label = (new_label[0], new_label[1]+(new_arg,))
                    arities[new_label[0]] = max(arities.get(new_label[0],0),len(new_label[1]))
                    edge_label.remove(label)
                    edge_label.add(new_label)
                graph[state][next_state]['action'] = edge_label
            new_graphs.append((graph,init))

        #Identify duplicated arguments that were deduced in multiple ways
        args_to_delete = dict()
        for action, arity in arities.items():
            args_to_delete[action] = set()
            for first_arg in range(arity):
                later_args = set((action, arg) for arg in range(
                    max(first_arg + 1, old_arities[action]), arity
                ))
                for _, arg in arg_conflicts.find_non_conflicting_elements(
                    (action, first_arg), later_args
                ):
                    args_to_delete[action].add(arg)
            later_args = set((action, arg) for arg in range(
                old_arities[action], arity
            ))
            for _, arg in arg_conflicts.find_non_conflicting_elements(
                (action, pt.ObjectNotKnown), later_args
            ):
                args_to_delete[action].add(arg)

        for action, arity in old_arities.items():
            arg_feature_assignment[action] = dict()
            index = arity
            for oi_feature in new_oi_features:
                for ai_pattern in oi_feature.argument_identifier_patterns:
                    arg_feature_assignment[action][index] = (oi_feature,ai_pattern)
                    index += 1
            index = arity
            action_arg_feature_assignment = dict()
            for old_index, assignment in sorted(arg_feature_assignment[action].items()):
                if old_index not in args_to_delete[action]:
                    action_arg_feature_assignment[index] = assignment
                    index += 1
            arg_feature_assignment[action] = action_arg_feature_assignment

        for action, arr in arities.items():
            arities[action] = arities[action] - len(args_to_delete[action])

        #delete duplicated arguments again
        for graph, _ in new_graphs:
            for state, next_state, edge_label in graph.edges(data='action'):
                for label in edge_label.copy():
                    new_label = label
                    action = new_label[0]
                    mask = args_to_delete.get(action)
                    if mask is not None:
                        new_label = (action, tuple(
                            x for i, x in enumerate(label[1]) if i not in mask
                        ))
                    edge_label.remove(label)
                    edge_label.add(new_label)
                graph[state][next_state]['action'] = edge_label

        self.sift_iterations[iteration].replace_graphs(new_graphs)

        return (any(
            key not in old_arities or
            arities[key] > old_arities[key]
            for key in arities
        ), arg_feature_assignment)
