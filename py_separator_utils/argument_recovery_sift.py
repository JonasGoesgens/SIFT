import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
from py_separator_utils.sift import SIFT
from py_separator_utils.feature import Feature
from py_separator_utils.ordered_identifier_feature import Ordered_Identifier_Feature as OIFeature
from py_separator_utils.conflict_manager import ConflictManager
from py_separator_utils.synth import synth_update_graphs
import copy
import sys
import time
import warnings
from typing import Set, List, Tuple, Dict, Union, Iterable
from concurrent.futures import ProcessPoolExecutor, ALL_COMPLETED, as_completed, wait
from py_separator_utils.exceptions import StratificationError

class Argument_Recovery_Sift:
    def __init__(self, graphs : Union[List[Tuple[pt.GraphT, pt.NodeT]],
        Dict[int, Tuple[pt.GraphT, pt.NodeT]]]
    ):
        self.sift_iterations = dict()
        self.sift_iterations[0] = SIFT(graphs)
        self.order_id_features = dict()
        self.order_id_features[0] = set()
        self.arg_feature_assignments = dict()
        self.multi_arg_feature_assignment = dict()
        self.all_arg_feature_assignments = dict()
        self.admissible_order_id_features = dict()
        self.argument_identifier_features = dict()
        self.argument_identifier_features[0] = tuple()
        self.updated_oi_features = dict()
        self.updated_oi_features[0] = set()
        self.revised_oi_features = dict()
        self.pre_pattern_disabling = True

    @classmethod
    def _check_feature(
        cls, oi_feature : OIFeature,
        check_list : list[tuple[int, pt.GraphT, pt.GroundingT]]
    ) -> OIFeature:
        for instance, graph, grounding in check_list:
            if oi_feature.is_invalid():
                break
            oi_feature.label_graph(instance, graph, grounding)
        oi_feature.update_argument_identifier_patterns()
        return oi_feature

    def set_pre_pattern_disabling(self, pre_pattern_disabling : bool = True):
        self.pre_pattern_disabling = pre_pattern_disabling
        for iteration, oi_features in self.order_id_features.items():
            for oi_feature in oi_features:
                oi_feature.pre_pattern_disabling = pre_pattern_disabling

    def replace_graphs(self, graphs : Union[List[Tuple[pt.GraphT, pt.NodeT]],
        Dict[int, Tuple[pt.GraphT, pt.NodeT]]]
    ) -> None:
        for iteration, sift in self.sift_iterations.items():
            sift.replace_graphs(list())
        self.sift_iterations[0].replace_graphs(graphs)
        for iteration, order_id_features in self.order_id_features.items():
            for oi_feature in order_id_features:
                oi_feature.delete_identified_arguments()

    def _get_graph_list_for_feature(
        self, oi_feature : OIFeature, iteration : int
        ) -> list[tuple[pt.GraphT, pt.GroundingT]]:
        check_list = list()
        if oi_feature.is_invalid():
            return check_list
        type_combination = oi_feature.get_type_combination()
        for instance, groundings in self.sift_iterations[iteration].LOCM_types.get_all_groundings_for_typecombination(
            type_combination
        ).items():
            for grounding in groundings:
                graph, initial_state = self.sift_iterations[iteration].all_graphs[instance].get_switching_graph_for_grounding(
                    grounding
                )
                check_list.append((instance, graph, grounding))
        return check_list

    def type_sort_features(self, iteration : int) -> None:
        #regroup arguments in patterns by type if they got merged.
        if iteration not in self.sift_iterations:
            return
        if iteration not in self.order_id_features:
            return

        features_sorting = dict()
        for feature in self.sift_iterations[iteration].all_features:
            features_sorting[feature] = feature.get_type_sorted_feature(
                self.sift_iterations[iteration].LOCM_types
            )
        oi_features_sorting = dict()
        for oi_feature in self.order_id_features[iteration]:
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
        self.order_id_features[iteration] = set(
            oi_features_sorting.get(oi_feature,oi_feature)
            for oi_feature in self.order_id_features[iteration]
        )
        if iteration in self.argument_identifier_features:
            self.argument_identifier_features[iteration] = tuple(
                oi_features_sorting.get(oi_feature,oi_feature)
                for oi_feature in self.argument_identifier_features[iteration]
            )
        if iteration in self.updated_oi_features:
            self.updated_oi_features[iteration] = set(
                oi_features_sorting.get(oi_feature,oi_feature)
                for oi_feature in self.updated_oi_features[iteration]
            )
        if iteration in self.revised_oi_features:
            self.revised_oi_features[iteration] = set(
                oi_features_sorting.get(oi_feature,oi_feature)
                for oi_feature in self.revised_oi_features[iteration]
            )

    def update_type_combination_keys(
        self, iteration : int,
        verification_mode : bool = False
    ) -> None:
        #check for already existing features to update their typing if necessary
        for oi_feature in self.order_id_features[iteration]:
            type_combination = self.sift_iterations[iteration].LOCM_types.update_type_combination(
                oi_feature.get_type_combination()
            )
            oi_feature.set_type_combination(type_combination)
            if oi_feature.is_invalid():
                continue
            if verification_mode:
                continue
            if oi_feature.has_static_existence():
                #Add and delete pattens appear always together.
                new_patterns = set(
                    self.sift_iterations[iteration].LOCM_types.get_all_patterns_for_typecombination(type_combination)
                ).difference(oi_feature.del_patterns)
            else:
                if not oi_feature.existence_feature.has_unique_colouring():
                    warnings.warn(
                        f"Existence Feature had non unique coloring, this OIFeature should never have been created. oi feature:\n{oi_feature}existence:\n{oi_feature.existence_feature}",
                        UserWarning
                    )
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
                    warnings.warn(
                        f"OIFeature had no common effect pattern with existence Feature this should never happen. oi feature:\n{oi_feature}existence:\n{oi_feature.existence_feature}",
                        UserWarning
                    )
                    continue
            new_patterns.difference_update(oi_feature.pre_patterns)
            oi_feature.update_pre_patterns(new_patterns)
            if new_patterns:
                self.updated_oi_features[iteration].add(oi_feature)

    def run_iteration(
        self, iteration : int, process_pool_args : dict,
        verification_mode : bool = False
    ) -> set[OIFeature]:
        print(f"{ut.format_cur_time()}: Argument Recovery iteration {iteration}: Running Normal Sift", flush=True)
        features = self.sift_iterations[iteration].run(process_pool_args)
        print(f"{ut.format_cur_time()}: Argument Recovery iteration {iteration}: Found {len(features)}/{len(self.sift_iterations[iteration].all_features)} Normal Features", flush=True)
        print(f"{ut.format_cur_time()}: Argument Recovery iteration {iteration}: Current Locm Types: {repr(self.sift_iterations[iteration].LOCM_types)}")
        print(f"{ut.format_cur_time()}: Argument Recovery iteration {iteration}: Creating mutex features", flush=True)
        action_arities = self.sift_iterations[iteration].LOCM_types.get_action_arities()
        equivalent_switching_patterns = self.sift_iterations[iteration].equivalent_switching_patterns

        if not verification_mode:
            #oi features from fluids
            for feature in features:
                dead_patterns = self.sift_iterations[
                    iteration
                ].get_dead_switching_patterns_for_typecombination(
                    feature.get_type_combination()
                )
                self.order_id_features[iteration].update(
                    OIFeature.expand_existence_feature(
                        feature,
                        dead_patterns,
                        equivalent_switching_patterns,
                        action_arities,
                        self.pre_pattern_disabling
                    )
                )
            #oi features from statics
            for type_combinations in self.sift_iterations[iteration].LOCM_types.get_all_type_combinations().values():
                for type_combination in type_combinations:
                    all_patterns = self.sift_iterations[iteration].LOCM_types.get_all_patterns_for_typecombination(type_combination)
                    dead_patterns = self.sift_iterations[iteration].get_dead_switching_patterns_for_typecombination(type_combination)
                    equivalent_switching_patterns = self.sift_iterations[iteration].equivalent_switching_patterns
                    self.order_id_features[iteration].update(
                        OIFeature.create_io_features_for_static_type_combination(
                            type_combination,
                            all_patterns,
                            dead_patterns,
                            equivalent_switching_patterns,
                            action_arities,
                            self.pre_pattern_disabling
                        )
                    )
        #run ar sift
        print(f"{ut.format_cur_time()}: Argument Recovery iteration {iteration}: Testing {len(self.order_id_features[iteration])} mutex features", flush=True)
        with ProcessPoolExecutor(**process_pool_args) as process_pool:
            runs = dict()
            for oi_feature in self.order_id_features[iteration]:
                if oi_feature.is_invalid():
                    continue
                if verification_mode:
                    if oi_feature not in self.revised_oi_features[iteration]:
                        #no need to check them again
                        #unless they got checked in the original run
                        continue
                else:
                    if oi_feature in self.argument_identifier_features[iteration] and oi_feature not in self.updated_oi_features[iteration]:
                        #no need to check them again
                        #unless they got more prec patterns
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

        self.admissible_order_id_features[iteration] = set()
        for feature in self.order_id_features[iteration]:
            if not feature.is_invalid():
                self.admissible_order_id_features[iteration].add(feature)

        return self.admissible_order_id_features[iteration]

    def run(self,
        process_pool_args : dict,
        max_iterations : int = 0,
        find_oi_features_in_last_iteration : bool = False,
        verification_mode : bool = False
    ) -> Tuple[Set[OIFeature], Set[Feature]]:
        """
        Main loop of argument recovery sift.

        :param process_pool_args: Arguments for the multiprocessing pool.
        :param max_iterations: Maximal number of stratification levels to try.
        :param find_oi_features_in_last_iteration: Also look for OI features in last stratification level.
        :param verification_mode: If true disables feature generation and aborts if any part of the known stratification is not applicable.

        :returns:
        Set of admissible Ordered Identifier Features,
        Set of admissible basic Sift Features.

        :throws StratificationError if in verification mode the stratification cannot be reapplied because an OI feature or pattern became invalid.

        The loop runs until the stratification can no longer be extended or the specified limit is reached.
        """
        iteration = 0
        input_changed = True
        synth_changed_graph = False
        #self.arg_feature_assignments = dict()
        while input_changed and (
            max_iterations == 0 or
            iteration < max_iterations
        ):
            if verification_mode:
                previous_disabled_patterns = dict()
                for oi_feature in self.argument_identifier_features[iteration]:
                    previous_disabled_patterns[oi_feature] = oi_feature.disabled_pre_patterns.copy()
            self.run_iteration(iteration, process_pool_args, verification_mode)
            print(f"{ut.format_cur_time()}: Argument Recovery iteration {iteration}: Found {len(self.admissible_order_id_features[iteration])}/{len(self.order_id_features[iteration])} Mutex Features", flush=True)
            if verification_mode:
                if (iteration + 1) in self.sift_iterations:
                    if any(
                        oi_feature.is_invalid() or
                        oi_feature.disabled_pre_patterns.difference(previous_disabled_patterns[oi_feature])
                        for oi_feature in self.argument_identifier_features[iteration]
                    ):
                        print(f"{ut.format_cur_time()}: Argument Recovery iteration {iteration}: Failed to apply new arguments on {self.argument_identifier_features[iteration]}")
                        for oi_feature in self.argument_identifier_features[iteration]:
                            if oi_feature.is_invalid():
                                print(f"Required OI_Feature {repr(oi_feature)} got invalid")
                            elif oi_feature.disabled_pre_patterns.difference(previous_disabled_patterns[oi_feature]):
                                print(f"Required Prec Patterns were disabled: {oi_feature.disabled_pre_patterns.difference(previous_disabled_patterns[oi_feature])}")
                                print(f"Allowed disabled Prec Patterns List: {previous_disabled_patterns[oi_feature]}")
                                print(f"Actual disabled Prec Patterns List: {oi_feature.disabled_pre_patterns}")
                        raise StratificationError(
                            iteration,
                            f"An OI Feature or Pattern used to setup the next graph became invalid in iteration {iteration}"
                        )
            else:
                new_oi_features = tuple(
                    self.admissible_order_id_features[iteration].difference(self.argument_identifier_features[iteration])
                )
                self.argument_identifier_features[iteration] = self.argument_identifier_features[iteration] + new_oi_features
                if iteration == 0:
                    self.revised_oi_features[0] = self.argument_identifier_features[0]

                self.revised_oi_features[iteration] = tuple(
                    oi_feature
                    for oi_feature in self.argument_identifier_features[iteration]
                    if not oi_feature.is_invalid() and
                    oi_feature in self.updated_oi_features[iteration].union(new_oi_features)
                )

            #Interpretation of current run complete prepare next run.
            print(f"{ut.format_cur_time()}: Argument Recovery iteration {iteration}: Updating action labels", flush=True)
            iteration += 1

            #update input graphs for next iteration.
            if verification_mode:
                if iteration not in self.sift_iterations:
                    #We finished the final iteration of the original run.
                    input_changed = False
                    break
                graph_dict = dict()
                for instance, graphholder in self.sift_iterations[
                    iteration - 1
                ].all_graphs.items():
                    graph_dict[instance] = (
                        copy.deepcopy(graphholder.base_graph),
                        copy.deepcopy(graphholder.initial_state)
                    )
                self.sift_iterations[iteration].replace_graphs(graph_dict)
            else:
                self.sift_iterations[iteration] = copy.deepcopy(
                    self.sift_iterations[iteration - 1]
                )
                mapping_dict = dict()
                self.order_id_features[iteration] = set()
                for oi_feature in self.order_id_features[iteration - 1]:
                    new_oi_feature = copy.deepcopy(oi_feature)
                    mapping_dict[oi_feature] = new_oi_feature
                    self.order_id_features[iteration].add(new_oi_feature)
                self.argument_identifier_features[iteration] = tuple(
                    mapping_dict[oi_feature]
                    for oi_feature in self.argument_identifier_features[iteration - 1]
                )
                self.sift_iterations[iteration].delete_complex_pattern_relations()

            #TODO clean up oifeatures additional_arguments.
            old_arities = self.sift_iterations[iteration - 1].LOCM_types.action_arities.copy()
            (
                new_graphs,
                input_changed,
                arg_feature_assignment,
                multi_arg_feature_assignment,
                all_arg_feature_assignments
            ) = self.update_graphs(
                self.revised_oi_features[iteration - 1],
                iteration,
                old_arities,
                verification_mode
            )
            #TODO annotate new_graphs
            feature_index_list = list()
            for feature in self.sift_iterations[iteration - 1].admissible_features:
                if feature.has_unique_colouring():
                    feature_index_list.append((feature,0))
            all_objects = dict()
            for instance, obj in self.sift_iterations[iteration - 1].LOCM_types.obj_types:
                if instance not in all_objects:
                    all_objects[instance] = set()
                all_objects[instance].add(obj)
            new_graphs = self.label_graph_with_atoms(
                new_graphs,
                feature_index_list,
                self.revised_oi_features[iteration - 1],
                all_objects
            )
            #TODO submit new_graphs to synth
            new_graphs, synth_changed_graph = synth_update_graphs(new_graphs)
            input_changed = input_changed or synth_changed_graph

            self.sift_iterations[iteration].replace_graphs(new_graphs)
            if not verification_mode:
                self.updated_oi_features[iteration] = set()

            self.type_sort_features(iteration)
            self.update_type_combination_keys(iteration, verification_mode)

            for action, assignments in arg_feature_assignment.items():
                if action not in self.arg_feature_assignments:
                    self.arg_feature_assignments[action] = assignments
                else:
                    for index, assignment in assignments.items():
                        self.arg_feature_assignments[action][index] = assignment

            #TODO fix assignments added to wrong actions
            for action, assignments in multi_arg_feature_assignment.items():
                if action not in self.multi_arg_feature_assignment:
                    self.multi_arg_feature_assignment[action] = assignments
                else:
                    for index, assignment in assignments.items():
                        if index not in self.multi_arg_feature_assignment[action]:
                            self.multi_arg_feature_assignment[action][index] = set()
                        self.multi_arg_feature_assignment[action][index].update(assignment)

            for action, assignments in all_arg_feature_assignments.items():
                if action not in self.all_arg_feature_assignments:
                    self.all_arg_feature_assignments[action] = assignments
                else:
                    for index, assignment in assignments.items():
                        if index not in self.all_arg_feature_assignments[action]:
                            self.all_arg_feature_assignments[action][index] = set()
                        self.all_arg_feature_assignments[action][index].update(assignment)

        #Main Loop terminated, finalize and cleanup depending on termination cause.
        #input_changed == True  termination by runlinmit execute last run.
        #input_changed == False termination by natural end of stratification clean up.
        #                       can also be caused by verfication mode if primary run ended.
        if input_changed:
            if find_oi_features_in_last_iteration:
                #Search for both types of features in last run
                print(f"{ut.format_cur_time()}: Argument Recovery iteration {iteration}: Finalizing Running Normal Sift and searching for new mutex features", flush=True)
                self.run_iteration(iteration, process_pool_args)
            else:
                #Only search for base Sift features in last run
                print(f"{ut.format_cur_time()}: Argument Recovery iteration {iteration}: Finalizing Running Normal Sift", flush=True)
                features = self.sift_iterations[iteration].run(process_pool_args)
                print(f"{ut.format_cur_time()}: Argument Recovery iteration {iteration}: Found {len(features)}/{len(self.sift_iterations[iteration].all_features)} Normal Features", flush=True)
        else:
            #Remove prepared iteration as it wont change anything anymore
            _ = self.sift_iterations.pop(iteration, None)
            _ = self.order_id_features.pop(iteration, None)
            _ = self.updated_oi_features.pop(iteration, None)
            _ = self.argument_identifier_features.pop(iteration, None)
            _ = self.admissible_order_id_features.pop(iteration, None)
            _ = self.revised_oi_features.pop(iteration, None)
            iteration -= 1

        #An oi feature may not have been changed in the final iteration
        #and thus not been checked again and marked as admissible.
        overall_admissible_order_id_features = set()
        for _, admissible_features in reversed(sorted(self.admissible_order_id_features.items())):
            #reverse order so the most recent version is reported
            overall_admissible_order_id_features.update(admissible_features)
        overall_admissible_features = set()
        for _, sift_iteration in reversed(sorted(self.sift_iterations.items())):
            #reverse order so the most recent version is reported
            overall_admissible_features.update(sift_iteration.admissible_features)
        
        return (
            overall_admissible_order_id_features,
            overall_admissible_features
        )

    def label_graph_with_atoms(self,
        graphs : Dict[int, Tuple[pt.GraphT, pt.NodeT]],
        feature_index_list : List[Tuple[Feature, int]],
        oi_features : Iterable[OIFeature],
        all_objects : Dict[int, Iterable[pt.ObjectT]]
    ) -> Dict[int, Tuple[pt.GraphT, pt.NodeT]]:
        for instance, (graph, init) in graphs.items():
            open_nodes = set()
            for in_node, out_node, edge_labels in graph.edges(data=pt.Edge_Label_key):
                in_node_atoms_dict = graph.nodes[in_node].get(pt.Atom_List_key, dict())
                out_node_atoms_dict = graph.nodes[out_node].get(pt.Atom_List_key, dict())
                for feature, split_index in feature_index_list:
                    arity = feature.get_arity()
                    (
                        pos_ground_eff,
                        neg_ground_eff,
                        unk_ground_eff
                    ) = feature.apply_edge_label(
                        edge_labels,
                        split_index
                    )
                    predicate = feature.get_identifier()
                    if arity not in in_node_atoms_dict:
                        in_node_atoms_dict[arity] = dict()
                    if predicate not in in_node_atoms_dict[arity]:
                        in_node_atoms_dict[arity][predicate] = (set(),set())
                    if arity not in out_node_atoms_dict:
                        out_node_atoms_dict[arity] = dict()
                    if predicate not in out_node_atoms_dict[arity]:
                        out_node_atoms_dict[arity][predicate] = (set(),set())
                    old_in_atoms = tuple(s.copy() for s in in_node_atoms_dict[arity][predicate])
                    old_out_atoms = tuple(s.copy() for s in out_node_atoms_dict[arity][predicate])
                    in_node_atoms_dict[arity][predicate][0].update(neg_ground_eff)
                    in_node_atoms_dict[arity][predicate][1].update(pos_ground_eff)
                    out_node_atoms_dict[arity][predicate][0].update(pos_ground_eff)
                    out_node_atoms_dict[arity][predicate][1].update(neg_ground_eff)
                    if any(
                        s.difference(o_s)
                        for o_s, s in zip(old_in_atoms, in_node_atoms_dict[arity][predicate])
                    ):
                        open_nodes.add(in_node)
                    if any(
                        s.difference(o_s)
                        for o_s, s in zip(old_out_atoms, out_node_atoms_dict[arity][predicate])
                    ):
                        open_nodes.add(out_node)
                graph.nodes[in_node][pt.Atom_List_key] = in_node_atoms_dict
                graph.nodes[out_node][pt.Atom_List_key] = out_node_atoms_dict
            while open_nodes:
                old_open_nodes = open_nodes
                open_nodes = set()
                for node in old_open_nodes:
                    for edges, a, b in [
                        [graph.out_edges([node],data='action'), 1, 0],
                        [graph.in_edges([node],data='action'), 0, 1]
                    ]:
                        for edge in edges:
                            other_node = edge[a]
                            edge_labels = edge[2]
                            for feature, split_index in feature_index_list:
                                arity = feature.get_arity()
                                (
                                    pos_ground_eff,
                                    neg_ground_eff,
                                    unk_ground_eff
                                ) = feature.apply_edge_label(
                                    edge_labels,
                                    split_index
                                )
                                node_atoms_dict = graph.nodes[node].get(pt.Atom_List_key, dict())
                                other_node_atoms_dict = graph.nodes[other_node].get(pt.Atom_List_key, dict())
                                predicate = feature.get_identifier()
                                if arity not in node_atoms_dict:
                                    node_atoms_dict[arity] = dict()
                                if predicate not in node_atoms_dict[arity]:
                                    node_atoms_dict[arity][predicate] = (set(),set())
                                if arity not in other_node_atoms_dict:
                                    other_node_atoms_dict[arity] = dict()
                                if predicate not in other_node_atoms_dict[arity]:
                                    other_node_atoms_dict[arity][predicate] = (set(),set())
                                pos_inertia = node_atoms_dict[arity][predicate][0].difference(
                                    pos_ground_eff.union(neg_ground_eff)
                                )
                                neg_inertia = node_atoms_dict[arity][predicate][1].difference(
                                    pos_ground_eff.union(neg_ground_eff)
                                )
                                pos_unknown = unk_ground_eff.intersection(pos_inertia)
                                neg_unknown = unk_ground_eff.intersection(neg_inertia)
                                pos_inertia.difference_update(unk_ground_eff)
                                neg_inertia.difference_update(unk_ground_eff)
                                #TODO detailed update for unknown case.
                                old_other_atoms = tuple(s.copy() for s in other_node_atoms_dict[arity][predicate])
                                other_node_atoms_dict[arity][predicate][0].update(pos_inertia)
                                other_node_atoms_dict[arity][predicate][1].update(neg_inertia)
                                if any(
                                    s.difference(o_s)
                                    for o_s, s in zip(old_other_atoms, other_node_atoms_dict[arity][predicate])
                                ):
                                    open_nodes.add(other_node)
                            graph.nodes[node][pt.Atom_List_key] = node_atoms_dict
                            graph.nodes[other_node][pt.Atom_List_key] = other_node_atoms_dict
            for node in graph.nodes():
                node_atoms_dict = graph.nodes[node].get(pt.Atom_List_key, dict())
                for oi_feature in oi_features:
                    arity = oi_feature.get_arity()
                    predicate = oi_feature.get_identifier()
                    if arity not in node_atoms_dict:
                        node_atoms_dict[arity] = dict()
                    if predicate not in node_atoms_dict[arity]:
                        node_atoms_dict[arity][predicate] = (set(),set())
                    for grounding, id_object in oi_feature.object_memory.get((instance, node), dict()).items():
                        if id_object == None:
                            continue
                        elif id_object == pt.ObjectNotKnown:
                            continue
                        all_relevant_objects = all_objects.get(instance, set())
                        if id_object == pt.ObjectNotExisting:
                            for obj in all_relevant_objects:
                                node_atoms_dict[arity][predicate][1].add(grounding + (obj,))
                        else:
                            node_atoms_dict[arity][predicate][0].add(grounding + (id_object,))
                            for obj in all_relevant_objects:
                                if obj != id_object:
                                    node_atoms_dict[arity][predicate][1].add(grounding + (obj,))

        return graphs

    def update_graphs(self,
        new_oi_features : tuple[OIFeature],
        iteration : int,
        old_arities : Dict[pt.ActionT,int],
        verification_mode : bool = False
    ) -> Tuple[dict, bool,
        pt.Arg_Feature_AssignmentT,
        pt.Arg_Feature_Multi_AssignmentT,
        pt.Arg_Feature_AssignmentT
    ]:
        new_graphs = dict()
        arities = dict()
        arg_feature_assignment = dict()
        multi_arg_feature_assignment = dict()
        all_arg_feature_assignments = dict()
        arg_conflicts = ConflictManager[Tuple[pt.ActionT,int]]()
        arg_emulations = ConflictManager[Tuple[pt.ActionT,int]]()
        new_label = None

        some_label = None

        whitelist = dict()
        #Add all deduced arguments to graph
        for instance, graphholder in self.sift_iterations[iteration].all_graphs.items():
            graph = graphholder.base_graph
            init = graphholder.initial_state
            for state, next_state, edge_label in graph.edges(data='action'):
                for label in edge_label.copy():
                    new_label = label
                    if verification_mode:
                        if not label[0] in whitelist:
                            whitelist[label[0]] = set()
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

                            if verification_mode:
                                if (oi_feature,ai_pattern) in self.arg_feature_assignments[label[0]].values():
                                    whitelist[label[0]].add(new_index)

                            #Remember differences to already known arguments
                            #to later delete args that do not add new information
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
                            for index, arg in enumerate(new_label[1]):
                                if new_arg != arg:
                                    arg_emulations.add_conflict(
                                            (new_label[0],index),
                                            (new_label[0],new_index)
                                    )
                            new_label = (new_label[0], new_label[1]+(new_arg,))
                    arities[new_label[0]] = max(arities.get(new_label[0],0),len(new_label[1]))
                    edge_label.remove(label)
                    edge_label.add(new_label)
                    if new_label[0] == 'stack':
                        some_label = (label, new_label)
                graph[state][next_state]['action'] = edge_label
            new_graphs[instance] = (graph,init)

        #Identify duplicated arguments that were deduced in multiple ways
        args_to_delete = dict()
        for action in old_arities:
            args_to_delete[action] = dict()
        for action, arity in arities.items():
            #args to delete dict action -> dict arg -> cause
            args_to_delete[action] = dict()
            for first_arg in range(arity):
                later_args = set((action, arg) for arg in range(
                    max(first_arg + 1, old_arities[action]), arity
                ))
                for _, arg in arg_conflicts.find_non_conflicting_elements(
                    (action, first_arg), later_args
                ):
                    args_to_delete[action][arg] = min(
                        first_arg, args_to_delete[action].get(arg, first_arg)
                    )
            later_args = set((action, arg) for arg in range(
                old_arities[action], arity
            ))
            for _, arg in arg_conflicts.find_non_conflicting_elements(
                (action, pt.ObjectNotKnown), later_args
            ):
                args_to_delete[action][arg] = min(
                    pt.ObjectNotKnown, args_to_delete[action].get(arg, pt.ObjectNotKnown)
                )

        if verification_mode:
            args_to_delete_old = args_to_delete
            args_to_delete = dict()
            for action in old_arities:
                args_to_delete[action] = dict()
            for action, arity in arities.items():
                args_to_delete[action] = dict()
                old_arity = old_arities.get(action, 0)
                for arg in range(old_arity, arity):
                    if arg not in whitelist[action]:
                        args_to_delete[action][arg] = args_to_delete_old[action].get(arg, pt.ObjectNotKnown)

        for action, arity in old_arities.items():
            arg_feature_assignment[action] = dict()
            index = arity
            for oi_feature in new_oi_features:
                for ai_pattern in oi_feature.argument_identifier_patterns:
                    arg_feature_assignment[action][index] = (oi_feature,ai_pattern)
                    index += 1

        for action, arity in arities.items():
            all_arg_feature_assignments[action] = dict()
            for index in range(arity):
                other_args = set((action, arg) for arg in range(arity))
                all_arg_feature_assignments[action][index] = set()
                for _, arg in arg_emulations.find_non_conflicting_elements(
                    (action, index), other_args
                ):
                    if arg in arg_feature_assignment[action]:
                        all_arg_feature_assignments[action][index].add(
                            arg_feature_assignment[action][arg]
                        )

        for action, arity in old_arities.items():
            index = arity
            index_mapping = dict()
            action_arg_feature_assignment = dict()
            action_multi_arg_feature_assignment = dict()
            for old_index, assignment in sorted(arg_feature_assignment[action].items()):
                if old_index not in args_to_delete[action]:
                    action_arg_feature_assignment[index] = assignment
                    index_mapping[old_index] = index
                    index += 1

            for old_index, assignment in sorted(arg_feature_assignment[action].items()):
                multi_index = args_to_delete[action].get(old_index, old_index)
                multi_index = index_mapping.get(multi_index, multi_index)
                if multi_index not in action_multi_arg_feature_assignment:
                    action_multi_arg_feature_assignment[multi_index] = set()
                action_multi_arg_feature_assignment[multi_index].add(assignment)

            arg_feature_assignment[action] = action_arg_feature_assignment
            multi_arg_feature_assignment[action] = action_multi_arg_feature_assignment

        for action, arity in arities.items():
            protected_pos = old_arities.get(action,0)
            index = 0
            action_arg_feature_assignment = dict()
            for old_index, assignment in sorted(all_arg_feature_assignments[action].items()):
                if old_index not in args_to_delete[action] or old_index < protected_pos:
                    action_arg_feature_assignment[index] = assignment
                    index += 1
            all_arg_feature_assignments[action] = action_arg_feature_assignment

        for action, arr in arities.items():
            arities[action] = arities[action] - len(args_to_delete[action])

        #delete duplicated arguments again
        for graph, _ in new_graphs.values():
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

        #self.sift_iterations[iteration].replace_graphs(new_graphs)
        return (
        new_graphs,
        any(
            key not in old_arities or
            arities[key] > old_arities[key]
            for key in arities
        ), arg_feature_assignment,
        multi_arg_feature_assignment,
        all_arg_feature_assignments)
