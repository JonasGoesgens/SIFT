import py_separator_utils.py_types as pt
from py_separator_utils.object_types import LOCM_Types
from multiprocessing import Manager
from typing import Optional
import copy
class Graph_Holder:
    def __init__(self, graph : pt.GraphT,
        locm_types : LOCM_Types
    ):
        self.base_graph = graph
        self.locm_types = locm_types
        self.simple_merged_graphs = dict()
        self.final_merged_graphs = dict()
        self.zeronary_graph = None

    @classmethod
    def get_sub_grounding(cls,
        grounding : pt.GroundingT,
        element_to_remove : pt.ObjectT
    ) -> pt.GroundingT:
        return tuple(item for item in grounding if item != element_to_remove)

    @classmethod
    def get_sub_grounding_key(cls,
        grounding_key : pt.GroundingKeyT,
        element_to_remove : pt.ObjectT
    ) -> pt.GroundingKeyT:
        return frozenset(item for item in grounding_key if item != element_to_remove)

    @classmethod
    def merge_attributes(cls, existing_attrs: dict, new_attrs: Optional[dict] = None) -> dict:
        #Merges attributes based on the key.
        merged_attrs = existing_attrs.copy()

        if new_attrs is None:
            return merged_attrs

        for key in new_attrs:
            if key == 'action':
                merged_attrs[key].update(new_attrs[key])
            else:
                # default keep the old value if present.
                merged_attrs[key] = existing_attrs.get(key, new_attrs[key])

        return merged_attrs

    @classmethod
    def merge_nodes(cls, graph: pt.GraphT, node_keep: int, node_rem: int):
        #Merges node node_rem into node node_keep.

        #Generate set of affected edges
        edges_to_migate = set()
        for neighbor in graph.successors(node_rem):
            edges_to_migate.add((node_rem, neighbor))
        for predecessor in graph.predecessors(node_rem):
            edges_to_migate.add((predecessor, node_rem))

        for old_edge in edges_to_migate:
            source = old_edge[0]
            target = old_edge[1]
            new_source = node_keep if source == node_rem else source
            new_target = node_keep if target == node_rem else target

            edge_data = graph[source][target]

            if graph.has_edge(new_source,new_target):
                graph[source][target].update(cls.merge_attributes(
                    graph[new_source].get(new_target),
                    edge_data
                ))
            else:
                graph.add_edge(new_source,new_target , **edge_data)

        # Remove node_rem from graph
        graph.remove_node(node_rem)

    @classmethod
    def check_label_needs_merge_simple(cls, labels : pt.Edge_LabelT, obj : pt.ObjectT) -> bool:
        return any(obj not in label[1] for label in labels)

    @classmethod
    def merge_graph_for_missing_arg(
        cls, graph : pt.GraphT, arg : pt.ObjectT
    ) -> pt.GraphT:
        new_graph = copy.deepcopy(graph)
        for node in list(new_graph.nodes()):
            if not new_graph.has_node(node):
                continue
            merged = True
            while merged:
                merged = False
                edges_to_check = set()
                for neighbor in new_graph.successors(node):
                    if neighbor != node:
                        edges_to_check.add((node, neighbor))
                for predecessor in new_graph.predecessors(node):
                    if predecessor != node:
                        edges_to_check.add((predecessor, node))
                for edge in edges_to_check:
                    other_node = edge[1] if node == edge[0] else edge[0]
                    if not new_graph.has_node(other_node):
                        continue
                    if cls.check_label_needs_merge_simple(new_graph[edge[0]][edge[1]].get('action'), arg):
                        cls.merge_nodes(new_graph, node, other_node)
                        merged = True
        return new_graph

    def set_simple_graph_for_grounding_key(
        self, grounding_key : pt.GroundingKeyT, graph : pt.GraphT
    ) -> None:
        self.simple_merged_graphs[grounding_key] = graph

    def get_simple_graph_for_grounding_key(
        self, grounding_key : pt.GroundingKeyT
    ) -> pt.GraphT:
        if grounding_key in self.simple_merged_graphs:
            return self.simple_merged_graphs[grounding_key]
        elif len(grounding_key) < 1:
            return self.base_graph
        else:
            new_obj = next(iter(grounding_key))
            smaller_grounding_key = self.__class__.get_sub_grounding_key(grounding_key, new_obj)
            smaller_graph = self.get_simple_graph_for_grounding_key(smaller_grounding_key)
            graph = self.__class__.merge_graph_for_missing_arg(
                smaller_graph,
                new_obj
            )
            self.set_simple_graph_for_grounding_key(
                grounding_key, graph
            )
            return graph

    def get_simple_graph_for_grounding(
        self, grounding : pt.GroundingT
    ) -> pt.GraphT:
        grounding_key = frozenset(grounding)
        return self.get_simple_graph_for_grounding_key(grounding_key)

    @classmethod
    def get_compatible_patterns_from_edge_label(cls,
        edge_labels : pt.Edge_LabelT,
        grounding : pt.GroundingT,
        all_patterns : pt.PatternTSetLike
    ) -> pt.PatternTSetLike:
        #grounding is a tupel holding the currently active objects
        matching_pattens = set()
        for label in edge_labels:
            for pat in all_patterns:
                mismatch = False
                if label[0] != pat[0]:
                    mismatch = True
                else:
                    #this loop will not run for zeronary features
                    for index, entry in enumerate(pat[1]):
                        object_pat = grounding[index]
                        object_label = label[1][entry]
                        if object_label != object_pat:
                            mismatch = True
                if not mismatch:
                    matching_pattens.add(pat)
        return matching_pattens

    @classmethod
    def merge_graph_for_dead_patterns(
        cls, graph : pt.GraphT, grounding : pt.GroundingT,
        all_patterns : pt.PatternTSetLike,
        dead_patterns : Optional[pt.PatternTSetLike]
    ) -> (pt.GraphT, pt.PatternTSetLike):
        if dead_patterns is None:
            dead_patterns = set()

        merged = True
        while merged:
            merged = False
            #find dead pattern
            for node in graph.nodes():
                pat_in = set()
                pat_out = set()
                for predecessor in graph.predecessors(node):
                    edge_label = graph[predecessor][node].get('action')
                    pat_in.update(cls.get_compatible_patterns_from_edge_label(
                        edge_label,
                        grounding,
                        all_patterns
                    ))
                for neighbor in graph.successors(node):
                    edge_label = graph[node][neighbor].get('action')
                    pat_out.update(cls.get_compatible_patterns_from_edge_label(
                        edge_label,
                        grounding,
                        all_patterns
                    ))
                #a patter dies if it is both on an in and an out edge of the same (merged) node.
                dead_patterns.update(pat_in.intersection(pat_out))

            #merge dead pattern
            for node in list(graph.nodes()):
                if not graph.has_node(node):
                    continue
                for neighbor in list(graph.successors(node)):
                    if neighbor != node:
                        edge_label = graph[node][neighbor].get('action')
                        pat = cls.get_compatible_patterns_from_edge_label(
                            edge_label,
                            grounding,
                            all_patterns
                        )
                        if dead_patterns.intersection(pat):
                            cls.merge_nodes(graph, node, neighbor)
                            merged = True

        return graph, dead_patterns

    def set_final_graph_and_dead_pattern_for_grounding(
        self, grounding : pt.GroundingT, type_combination : pt.TypeCombi,
        graph : pt.GraphT
    ) -> None:
        self.final_merged_graphs[grounding] = graph

    def has_final_graph_for_grounding(
        self, grounding : pt.GroundingT
    ) -> bool:
        return grounding in self.final_merged_graphs

    def get_final_graph_for_grounding(
        self, grounding : pt.GroundingT,
        type_combination : pt.TypeCombi
    ) -> pt.GraphT:
        if grounding in self.final_merged_graphs:
            return self.final_merged_graphs[grounding]
        else:
            #make a deep copy as we need the old graph intact as intermediate result.
            graph = copy.deepcopy(self.get_simple_graph_for_grounding(grounding))
            all_patterns = self.locm_types.get_all_patterns_for_typecombination(type_combination)

            graph, _ = self.__class__.merge_graph_for_dead_patterns(
                graph, grounding, all_patterns,
                set()
            )
            self.set_final_graph_and_dead_pattern_for_grounding(
                grounding, type_combination, graph
            )
            return graph
