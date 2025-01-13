from py_separator_utils.feature import Feature
from py_separator_utils.object_types import LOCM_Types
from py_separator_utils.graph_merger import Graph_Holder
import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
import copy
from concurrent.futures import ProcessPoolExecutor, ALL_COMPLETED, as_completed, wait

class SIFT:
    def __init__(self, graphs : list[pt.GraphT], num_max_worker : int = 8):
        self.all_graphs = dict()
        self.all_ground_edges = dict()
        self.LOCM_types = LOCM_Types()
        self.admissible_features = set()
        self.all_features = set()
        self.instance_id_gen = ut.UniqueIDAllocator()
        self.process_pool = ProcessPoolExecutor(max_workers=num_max_worker)
        self._add_graphs(graphs)

    def _add_graphs(self, graphs : list[pt.GraphT]):
        for graph in graphs:
            instance_id = self.instance_id_gen.take_free_id()
            self.all_graphs[instance_id] = Graph_Holder(graph, self.LOCM_types)
            self.all_ground_edges[instance_id] = set()
            edges = graph.out_edges(graph.nodes(),data='action')
            for edge in edges:
                self.all_ground_edges[instance_id].update(edge[2])
            _ = self.LOCM_types.update_LOCM_types_from_groundings(
                self.all_ground_edges[instance_id], instance_id
            )

    @classmethod
    def _check_feature(
        cls, feature : Feature,
        check_list : list[tuple[pt.GraphT, pt.GroundingT]]
    ):
        for graph, grounding in check_list:
            feature.color_graph(graph, grounding)
            if feature.is_invalid():
                break
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
                graph = self.all_graphs[instance].get_final_graph_for_grounding(
                    grounding,
                    type_combination
                )
                check_list.append((graph, grounding))
        return check_list

    def run(self) -> set[Feature]:
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

            for instance, grounding_keys in groundingkeys_sets.items():
                for grounding_key in grounding_keys:
                    graphholder = self.all_graphs[instance]
                    classtype = type(graphholder)
                    new_obj = next(iter(grounding_key))
                    smaller_grounding_key = classtype.get_sub_grounding_key(grounding_key, new_obj)
                    smaller_graph = self.all_graphs[instance].get_simple_graph_for_grounding_key(smaller_grounding_key)

                    runs[(arity,instance,grounding_key)] = self.process_pool.submit(
                        classtype.merge_graph_for_missing_arg,
                        smaller_graph,
                        new_obj
                    )
            #wait for intermediate results to be available
            wait(runs.values(), return_when=ALL_COMPLETED)
            for (arity,instance,grounding_key), future in runs.items():
                try:
                    result = future.result()
                    self.all_graphs[instance].set_simple_graph_for_grounding_key(
                        grounding_key, result
                    )
                except Exception as e:
                    print(f"Error processing {(arity,instance,grounding_key)}: {e}")

        #as the simple merges are all done the complex merges all
        #only require local data and can run all in parallel
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
                        #make a deep copy as we need the old graph intact as intermediate result.
                        graph = copy.deepcopy(graphholder.get_simple_graph_for_grounding(grounding))
                        all_patterns = self.LOCM_types.get_all_patterns_for_typecombination(type_combination)
                        dead_patterns = set()
                        runs[(arity,type_combination,instance,grounding)] = self.process_pool.submit(
                            classtype.merge_graph_for_dead_patterns,
                            graph, grounding, all_patterns,
                            dead_patterns
                        )
        #wait for intermediate results to be available
        wait(runs.values(), return_when=ALL_COMPLETED)

        for (arity,type_combination,instance,grounding), future in runs.items():
            try:
                graph, dead_patterns = future.result()
                self.all_graphs[instance].set_final_graph_and_dead_pattern_for_grounding(
                    grounding, type_combination, graph, dead_patterns
                )
            except Exception as e:
                print(f"Error processing {(arity,type_combination,instance,grounding)}: {e}")

        #generate all features, typecombinations for zeronary features included
        for arity, type_combinations in sorted(
            self.LOCM_types.get_all_type_combinations().items()
            #, key=lambda item: item[0]
        ):
            for type_combination in type_combinations:
                patterns = set(self.LOCM_types.get_all_patterns_for_typecombination(type_combination))
                for instance, graph in self.all_graphs.items():
                    patterns.difference_update(graph.get_dead_patterns_for_typecombination(type_combination))
                feature_candidates = ut.power_set_without_empty_set(patterns)
                for pats in feature_candidates:
                    self.all_features.add(Feature(
                        type_combination,
                        self.LOCM_types.get_all_patterns_for_typecombination(type_combination),
                        pats
                    ))

        #run sift
        runs = dict()
        for feature in self.all_features:
            check_list = self._get_graph_list_for_feature(feature)
            runs[feature] = self.process_pool.submit(
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