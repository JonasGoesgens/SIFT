from py_separator_utils.feature import Feature
from py_separator_utils.object_types import LOCM_Types
from py_separator_utils.graph_merger import Graph_Holder
from py_separator_utils.equivalence_classes import EquivalenceClasses
import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
import copy
from concurrent.futures import ProcessPoolExecutor, ALL_COMPLETED, as_completed, wait

class SIFT:
    def __init__(self, graphs : list[tuple[pt.GraphT,pt.NodeT]]):
        self.all_graphs = dict()
        self.all_ground_edges = dict()
        self.LOCM_types = LOCM_Types()
        self.admissible_features = set()
        self.all_features = set()
        self.dead_patterns = dict()
        #TODO class attribute
        self.instance_id_gen = ut.UniqueIDAllocator()
        self.equivalent_patterns = EquivalenceClasses[pt.PatternT]()
        self._add_graphs(graphs)

    def _add_graphs(self, graphs : list[tuple[pt.GraphT, pt.NodeT]]):
        for graph, init in graphs:
            instance_id = self.instance_id_gen.take_free_id()
            self.all_graphs[instance_id] = Graph_Holder(graph, init, self.LOCM_types)
            self.all_ground_edges[instance_id] = set()
            edges = graph.out_edges(graph.nodes(),data='action')
            for edge in edges:
                self.all_ground_edges[instance_id].update(edge[2])
            _ = self.LOCM_types.update_LOCM_types_from_groundings(
                self.all_ground_edges[instance_id], instance_id
            )

    def replace_graphs(self, graphs : list[tuple[pt.GraphT, pt.NodeT]]):
        self.all_graphs = dict()
        self.all_ground_edges = dict()
        self.LOCM_types.clear_instance_information()
        for feature in self.admissible_features:
            feature.delete_initial_atoms()
        self.admissible_features = set()
        self._add_graphs(graphs)
        self.update_type_combination_keys()

    @classmethod
    def _check_feature(
        cls, feature : Feature,
        check_list : list[tuple[int, pt.GraphT, pt.NodeT, pt.GroundingT]]
    ):
        for instance, graph, initial_state, grounding in check_list:
            if feature.is_invalid():
                break
            feature.color_graph(instance, graph, initial_state, grounding)
        return feature

    def _get_graph_list_for_feature(self, feature : Feature) -> list[tuple[pt.GraphT, pt.GroundingT]]:
        check_list = list()
        if feature.is_invalid():
            return check_list
        type_combination = feature.get_type_combination()
        
        for instance, groundings in self.LOCM_types.get_all_groundings_for_typecombination(
            type_combination
        ).items():
            for grounding in groundings:
                graph, initial_state = self.all_graphs[instance].get_final_graph_for_grounding(
                    grounding,
                    type_combination
                )
                check_list.append((instance, graph, initial_state, grounding))
        return check_list

    def update_type_combination_keys(self):
        dead_patterns = dict()
        for type_combination, dead_pats in self.dead_patterns.items():
            new_type_combination = self.LOCM_types.update_type_combination(type_combination)
            if new_type_combination in dead_patterns:
                dead_patterns[new_type_combination].update(dead_pats)
            else:
                dead_patterns[new_type_combination] = dead_pats
        self.dead_patterns = dead_patterns

    def update_dead_patterns_for_typecombination(
        self, type_combination : pt.TypeCombi,
        dead_patterns : pt.PatternTSetLike
    ):
        if not type_combination in self.dead_patterns:
            #ensure the set is not manipulated externally
            self.dead_patterns[type_combination] = set()
        self.dead_patterns[type_combination].update(dead_patterns)

    def get_dead_patterns_for_typecombination(self, type_combination : pt.TypeCombi):
        if not type_combination in self.dead_patterns:
            return set()
        else:
            return set(self.dead_patterns[type_combination])

    def run(self, process_pool_args : dict) -> set[Feature]:
        #premerge graphs parallel to speed up things
        for arity, type_combinations in sorted(
            self.LOCM_types.get_all_type_combinations().items()
            #, key=lambda item: item[0]
        ):
            #it is important to iterate over arity in increasing order
            #and to wait after each outer loop to avoid race conditions
            #in the used classes
            #ariry,type_combination,instance,gounding are all ints or tuples of ints
            #we dont want to merge for no selected arguments
            if arity < 1:
                continue

            runs = dict()

            #groundingkeys_sets colects the groundset needed for simple merge
            #this is only for cases where to typecombinations can provide the same grounding
            #which only happens on non default type definitions
            groundingkeys_sets = dict()
            for type_combination in type_combinations:
                #get it here to avoid recalculating it parallelized later multiple times
                _ = self.LOCM_types.get_all_patterns_for_typecombination(type_combination)
                for instance, groundings in self.LOCM_types.get_all_groundings_for_typecombination(
                    type_combination
                ).items():
                    for grounding in groundings:
                        grounding_key = frozenset(grounding)
                        #smaller grounding_keys were already calculated earlier
                        if len(grounding_key) == arity:
                            if instance in groundingkeys_sets:
                                groundingkeys_sets[instance].add(grounding_key)
                            else:
                                groundingkeys_sets[instance] = {grounding_key}

            with ProcessPoolExecutor(**process_pool_args) as process_pool:
                for instance, grounding_keys in groundingkeys_sets.items():
                    for grounding_key in grounding_keys:
                        graphholder = self.all_graphs[instance]
                        classtype = type(graphholder)
                        new_obj = next(iter(grounding_key))
                        smaller_grounding_key = classtype.get_sub_grounding_key(grounding_key, new_obj)
                        smaller_graph, smaller_initial_state = self.all_graphs[instance].get_simple_graph_for_grounding_key(smaller_grounding_key)

                        runs[(arity,instance,grounding_key)] = process_pool.submit(
                            classtype.merge_graph_for_missing_arg,
                            smaller_graph,
                            smaller_initial_state,
                            new_obj
                        )
                #wait for intermediate results to be available
                wait(runs.values(), return_when=ALL_COMPLETED)
                for (arity,instance,grounding_key), future in runs.items():
                    try:
                        graph, initial_state = future.result()
                        self.all_graphs[instance].set_simple_graph_for_grounding_key(
                            grounding_key, graph, initial_state
                        )
                    except Exception as e:
                        print(f"Error processing {(arity,instance,grounding_key)}: {e}")

        #as the simple merges are all done the complex merges all
        #only require local data and can run all in parallel
        merge = True
        local_dead_patterns = dict()
        while merge:
            merge = False
            with ProcessPoolExecutor(**process_pool_args) as process_pool:
                runs = dict()
                for arity, type_combinations in sorted(
                    self.LOCM_types.get_all_type_combinations().items()
                    #, key=lambda item: item[0]
                ):
                    for type_combination in type_combinations:
                        for instance, groundings in self.LOCM_types.get_all_groundings_for_typecombination(
                            type_combination
                        ).items():
                            for grounding in groundings:
                                graphholder = self.all_graphs[instance]
                                classtype = type(graphholder)
                                all_patterns = self.LOCM_types.get_all_patterns_for_typecombination(type_combination)
                                dead_patterns = self.get_dead_patterns_for_typecombination(type_combination)
                                if (type_combination, instance, grounding) in local_dead_patterns:
                                    #graph was merged for local dead patterns, check if update is needed
                                    if not dead_patterns.difference(local_dead_patterns[(type_combination, instance, grounding)]):
                                        #there are no additionally dead patterns, graph not updated
                                        continue
                                if not graphholder.has_final_graph_for_grounding(grounding):
                                    #we dont have complex merged yet for this grounding, take simple merge as start.
                                    #make a deep copy as we need the old graph intact as intermediate result.

                                    graph, initial_state = graphholder.get_simple_graph_for_grounding(grounding)
                                    graph = copy.deepcopy(graph)
                                else:
                                    graph, initial_state = graphholder.get_final_graph_for_grounding(grounding, type_combination)
                                runs[(arity,type_combination,instance,grounding)] = process_pool.submit(
                                    classtype.merge_graph_for_dead_patterns,
                                    graph, initial_state, grounding, all_patterns,
                                    dead_patterns, self.equivalent_patterns
                                )
                #wait for intermediate results to be available
                wait(runs.values(), return_when=ALL_COMPLETED)

                for (arity,type_combination,instance,grounding), future in runs.items():
                    try:
                        graph, initial_state, dead_patterns, equivalent_patterns = future.result()
                        self.all_graphs[instance].set_final_graph_for_grounding(
                            grounding, type_combination, graph, initial_state
                        )
                        self.update_dead_patterns_for_typecombination(type_combination, dead_patterns)
                        local_dead_patterns[(type_combination, instance, grounding)] = dead_patterns
                        self.equivalent_patterns.update(equivalent_patterns)
                    except Exception as e:
                        print(f"Error processing {(arity,type_combination,instance,grounding)}: {e}")

            for (type_combination, instance, grounding), dead_patterns in local_dead_patterns.items():
                if self.get_dead_patterns_for_typecombination(type_combination).difference(dead_patterns):
                    #guarantee termination if something odd happens
                    self.update_dead_patterns_for_typecombination(type_combination, dead_patterns)
                    #there are graphs that need futher merge
                    merge = True
                    break

        #check for already existing features to update their typing if necessary
        for feature in self.all_features:
            feature.set_type_combination(
                self.LOCM_types.update_type_combination(
                    feature.get_type_combination()
                )
            )
        #print(self.equivalent_patterns)
        #generate all features, typecombinations for zeronary features included
        for arity, type_combinations in sorted(
            self.LOCM_types.get_all_type_combinations().items()
            #, key=lambda item: item[0]
        ):
            for type_combination in type_combinations:
                all_patterns = self.LOCM_types.get_all_patterns_for_typecombination(type_combination)
                patterns = set(all_patterns)
                dead_patterns = self.get_dead_patterns_for_typecombination(type_combination)
                patterns.difference_update(dead_patterns)
                #patterns.difference_update(self.equivalent_patterns.get_listed_elements())
                patterns = ut.pack_into_frozensets(patterns)
                #patterns.update(self.equivalent_patterns.filter_valid_related_groups(
                #    all_patterns.difference(dead_patterns))
                #)
                feature_candidates = ut.power_set_without_empty_set(patterns)
                feature_candidates = ut.extract_from_double_packed_frozensets(feature_candidates)
                for pats in feature_candidates:
                    self.all_features.add(Feature(
                        type_combination,
                        all_patterns,
                        pats
                    ))

        #print(f"Num Features to test: {len(self.all_features)}")
        #run sift
        with ProcessPoolExecutor(**process_pool_args) as process_pool:
            runs = dict()
            for feature in self.all_features:
                check_list = self._get_graph_list_for_feature(feature)
                runs[feature] = process_pool.submit(
                    self.__class__._check_feature,
                    feature, check_list
                )
            wait(runs.values(), return_when=ALL_COMPLETED)
            for feature, future in runs.items():
                try:
                    checked_feature = future.result()
                    feature.overwrite_feature(checked_feature)
                except Exception as e:
                    print(f"Error processing {feature}: {e}")

        for feature in self.all_features:
            if not feature.is_invalid():
                self.admissible_features.add(feature)

        return self.admissible_features