import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
from py_separator_utils.object_types import LOCM_Types
from itertools import permutations
from typing import Optional, Tuple, Set, FrozenSet, Dict, List
import sys
import warnings
#features will invalitate themselfs on a color failure
#remember to deepcopy them for testing unsafe graphs
#or to use the backup system, note that this will only use shallow copies
#so dont manually edit a color split
class Feature:
    def __init__(self, type_combination : pt.TypeCombi,
        all_patterns : pt.PatternTSetLike,
        selected_patterns : pt.PatternTSetLike,
        other : Optional['Feature'] = None
    ):
        if not isinstance(other, Feature):
            self.type_combination = type_combination
            self.all_patterns = set(all_patterns)
            self.selected_patterns = frozenset(selected_patterns)
            #in the begining we do not know any relative colour information
            #all patterns will appear sometimes
            #color splits need to be a list to allow ordered removal
            self.color_splits = [
                ({pat},set(),set(),set(),set(),set()) for pat in selected_patterns
            ]
        else:
            #extends a feature by unseen patterns
            if (
                other.all_patterns.difference(
                    other.selected_patterns
                ).intersection(
                    selected_patterns
                )
            ):
                raise ValueError("A feature can only be extended by unseen patterns.")

            if type_combination is None:
                self.type_combination = other.type_combination
            else:
                self.type_combination = type_combination
            self.type_combination.freeze()
            self.all_patterns = set(other.all_patterns.union(all_patterns))
            self.selected_patterns = frozenset(
                other.selected_patterns.union(selected_patterns)
            )
            #in the begining we do not know any relative colour information
            #all patterns will appear sometimes
            #color splits need to be a list to allow ordered removal
            if other.color_splits is None:
                self.color_splits = None
            else:
                self.color_splits = other.color_splits.copy().extend(
                    [({pat},set(),set(),set(),set(),set())
                    for pat in selected_patterns.difference(
                        set().union(*(other.color_splits[0]))
                        .union(*(other.color_splits[1]))
                )])
        self.unselected_patterns = set(
            self.all_patterns.difference(self.selected_patterns)
        )
        self.extended_identifier = None
        self.backup_color_splits = None
        self.precondition_splits = None
        self.undefined_preconditions = None

    def delete_initial_atoms(self) -> None:
        if not self.is_invalid():
            for split in self.color_splits:
                split[4].clear()
                split[5].clear()
            self.precondition_splits = None

    def parse_edge_label(self, edge_label : pt.Edge_LabelT,
        grounding : pt.GroundingT
    ) -> Tuple[bool, bool, Set[pt.PatternT], Set[pt.PatternT]]:
        #grounding a tuple holding the currently active objects
        #TODO handle unknown object -2
        found_matching = False
        found_unmatching = False
        matching_selected_pattens = set()
        matching_unselected_pattens = set()
        for label in edge_label:
            found = False
            found_unknown = False
            for sel_pat in self.selected_patterns:
                mismatch = False
                unknown = False
                if label[0] != sel_pat[0]:
                    mismatch = True
                else:
                    #this loop will not run for zeronary features
                    for index, entry in enumerate(sel_pat[1]):
                        object_pat = grounding[index]
                        object_label = label[1][entry]
                        if object_label == pt.ObjectNotKnown:
                            unknown = True
                        elif object_label != object_pat:
                            mismatch = True
                if not mismatch:
                    if unknown:
                        found_unknown = True
                    else:
                        found = True
                        matching_selected_pattens.add(sel_pat)
            #There are only preconditions if found when there are identical arguments
            for unsel_pat in self.unselected_patterns:
                #if included set up list for preconditions
                mismatch = False
                if label[0] != unsel_pat[0]:
                    mismatch = True
                else:
                    #this loop will not run for zeronary features
                    for index, entry in enumerate(unsel_pat[1]):
                        object_pat = grounding[index]
                        object_label = label[1][entry]
                        if object_label == pt.ObjectNotKnown:
                            mismatch = True
                        elif object_label != object_pat:
                            mismatch = True
                if not mismatch:
                    matching_unselected_pattens.add(unsel_pat)

            if found:
                found_matching = True
            elif not found_unknown:
                found_unmatching = True

        return (found_matching,
            found_unmatching,
            matching_selected_pattens,
            matching_unselected_pattens)

    def add_color_constraint(
        self, pattern_colors : pt.ColorSplitT
    ) -> Optional[pt.ColorSplitT]:
        #pattern_colors is a list of four sets of patterns
        if self.is_invalid():
            return None
        #new_split will grow with any old split it connects
        #recreate it to avoid external changes and ensure the correct format
        new_split = (set(pattern_colors[0]),set(pattern_colors[1]),
            set(pattern_colors[2]),set(pattern_colors[3]),
            set(pattern_colors[4]),set(pattern_colors[5]))
        if (
            (not new_split[0]) and 
            (not new_split[1])
        ):
            #not a useful input
            return new_split

        if (
            (not new_split[0].issubset(self.selected_patterns)) or 
            (not new_split[1].issubset(self.selected_patterns))
        ):
            #not a correct input
            warnings.warn(
                f"Tried to add incorrect color constraint for feature:\n{self}",
                UserWarning
            )
            return None
        if new_split[0].intersection(new_split[1]):
            #invalid local patern coloring
            self.invalitate()
            return None

        #reverse iteration for deleting connected splits
        for i in range(len(self.color_splits) - 1, -1, -1):
            color_split = self.color_splits[i]
            if (
                new_split[0].intersection(color_split[0]) or 
                new_split[1].intersection(color_split[1])
            ):
                new_split[0].update(color_split[0])
                new_split[1].update(color_split[1])
                new_split[2].update(color_split[2])
                new_split[3].update(color_split[3])
                new_split[4].update(color_split[4])
                new_split[5].update(color_split[5])
                if (
                    new_split[0].intersection(color_split[1]) or 
                    new_split[1].intersection(color_split[0])
                ):
                    #this feature got invalid
                    self.invalitate()
                    return None
                del self.color_splits[i]
            elif (
                new_split[0].intersection(color_split[1]) or 
                new_split[1].intersection(color_split[0])
            ):
                new_split[0].update(color_split[1])
                new_split[1].update(color_split[0])
                new_split[2].update(color_split[3])
                new_split[3].update(color_split[2])
                new_split[4].update(color_split[5])
                new_split[5].update(color_split[4])
                del self.color_splits[i]
        if new_split[0] or new_split[1]:
            if len(new_split[5]) < len(new_split[4]):
                #try to have positive atoms more rare than negative atoms.
                new_split = (
                    new_split[1],
                    new_split[0],
                    new_split[3],
                    new_split[2],
                    new_split[5],
                    new_split[4]
                )
            self.color_splits.append(new_split)
            self.precondition_splits = None
            self.undefined_preconditions = None
        return new_split

    def color_graph(self,
        instance : int,
        Graph : pt.GraphT,
        grounding : pt.GroundingT,
        initial_state : Optional[pt.NodeT] = None
    ) -> Optional[Dict[pt.NodeT, Optional[int]]]:
        if self.is_invalid():
            return None
        node_color = {i: None for i in Graph.nodes()}
        unvisited_nodes = set(Graph.nodes())
        while unvisited_nodes:
            if initial_state is not None and initial_state in unvisited_nodes:
                node_color[initial_state] = 0
                pattern_colors = (set(),set(),set(),set(),{(instance, grounding)},set())
                open_nodes = [initial_state]
            else:
                #Continue coloring for unconnected graphs
                node = next(iter(unvisited_nodes))
                node_color[node] = 0
                pattern_colors = (set(),set(),set(),set(),set(),set())
                open_nodes = [node]

            while open_nodes:
                node = open_nodes.pop(0)
                if node not in unvisited_nodes:
                    continue
                unvisited_nodes.discard(node)
                for edges, a, b in [
                    [Graph.out_edges([node],data='action'), 1, 0],
                    [Graph.in_edges([node],data='action'), 0, 1]
                ]:
                    #note every edge is seen twice this is neccesary for the open list
                    #checking for duplicates would take as much time as running them
                    for edge in edges:
                        (found_matching, found_unmatching,
                        matching_selected_pattens, matching_unselected_pattens
                        ) = self.parse_edge_label(edge[2], grounding)
                        if found_matching and found_unmatching:
                            #invalid edge, merging should remove most of these cases,
                            #but we need to handle them for cases,
                            #where merging is not applicable.
                            self.invalitate()
                            return None

                        elif found_matching:
                            #feature edge switch color
                            if node_color[edge[a]] is None:
                                node_color[edge[a]] = 1 - node_color[edge[b]]
                                open_nodes.append(edge[a])
                            elif node_color[edge[a]] == node_color[edge[b]]:
                                #invalid coloring
                                self.invalitate()
                                return None

                            #effect pattern get the same color as target nodes
                            (pattern_colors[node_color[edge[1]]]
                            .update(matching_selected_pattens))
                            #precondition pattern get the same color as source nodes
                            (pattern_colors[node_color[edge[0]]+2]
                            .update(matching_unselected_pattens))

                        elif found_unmatching:
                            #neutral edge keep color
                            if node_color[edge[a]] is None:
                                node_color[edge[a]] = node_color[edge[b]]
                                open_nodes.append(edge[a])
                            elif node_color[edge[a]] != node_color[edge[b]]:
                                #invalid coloring
                                self.invalitate()
                                return None

                            #precondition pattern get the same color as source nodes
                            (pattern_colors[node_color[edge[0]]+2]
                            .update(matching_unselected_pattens))

                        else:
                            #uncertain edge with unknown arguments,
                            #handle as if it does not exist.
                            #This may disconnect the graph.
                            continue

            #check pattern consitency at the end to keep stuff readable
            result = self.add_color_constraint(pattern_colors)
            if result is None :
                if self.is_invalid():
                    return None

        return node_color

    def find_non_applicable_edges(self,
        instance : int,
        Graph : pt.GraphT,
        grounding : pt.GroundingT,
        all_ground_edges : pt.SetLike[pt.Ground_Edge_Info],
        split_index : int = 0
    ) -> Optional[Set[Tuple[int, pt.NodeT, pt.Ground_Edge_Info, Optional[pt.PatternT]]]]:
        if self.is_invalid():
            return None
        add_list, del_list, pos_precs, neg_precs, _, _, _ = self.get_color_split_combination(split_index)
        not_applicable_edges = set()
        unvisited_nodes = set(Graph.nodes())
        node_color = {i: None for i in Graph.nodes()}
        while unvisited_nodes:
            node = next(iter(unvisited_nodes))
            node_color[node] = 0
            pattern_colors = (set(),set(),set(),set(),set(),set())
            open_nodes = {node}
            initial_color = None
            hypo_not_applicable_edges = [set(),set()]
            while open_nodes:
                node = open_nodes.pop()
                unvisited_nodes.discard(node)
                for edges, a, b in [
                    [Graph.out_edges([node],data='action'), 1, 0],
                    [Graph.in_edges([node],data='action'), 0, 1]
                ]:
                    #note every edge is seen twice this is neccesary for the open list
                    #checking for duplicates would take as much time as running them
                    for edge in edges:
                        (found_matching, found_unmatching,
                        matching_selected_pattens, matching_unselected_pattens
                        ) = self.parse_edge_label(edge[2], grounding)
                        #print(edge)
                        if found_matching:
                            #feature edge switch color
                            if edge[a] in unvisited_nodes:
                                open_nodes.add(edge[a])
                            if initial_color is None:
                                if matching_selected_pattens.intersection(add_list):
                                    initial_color = a
                                else:
                                    initial_color = b
                            node_color[edge[a]] = 1 - node_color[edge[b]]

                        elif found_unmatching:
                            #neutral edge keep color
                            if edge[a] in unvisited_nodes:
                                open_nodes.add(edge[a])
                            node_color[edge[a]] = node_color[edge[b]]

                        else:
                            #uncertain edge with unknown arguments,
                            #handle as if it does not exist.
                            #This may disconnect the graph.
                            continue

                merged_nodes = {node}.union(Graph.nodes[node].get('merged', set()))
                #print(all_ground_edges)
                for edge_label in all_ground_edges:
                    (found_matching, found_unmatching,
                    matching_selected_pattens, matching_unselected_pattens
                    ) = self.parse_edge_label({edge_label}, grounding)

                    #print(matching_selected_pattens, add_list)
                    if matching_selected_pattens.intersection(add_list):
                        for merged_node in merged_nodes:
                            hypo_not_applicable_edges[node_color[node]].add((
                                instance, merged_node, edge_label, None
                            ))
                    if matching_selected_pattens.intersection(del_list):
                        for merged_node in merged_nodes:
                            hypo_not_applicable_edges[1 - node_color[node]].add((
                                instance, merged_node, edge_label, None
                            ))
                    patterns = matching_unselected_pattens.intersection(pos_precs)
                    for pattern in patterns:
                        for merged_node in merged_nodes:
                            hypo_not_applicable_edges[1 - node_color[node]].add((
                                instance, merged_node, edge_label, pattern
                            ))
                    patterns = matching_unselected_pattens.intersection(neg_precs)
                    for pattern in patterns:
                        for merged_node in merged_nodes:
                            hypo_not_applicable_edges[node_color[node]].add((
                                instance, merged_node, edge_label, pattern
                            ))
            
            if initial_color is not None:
                not_applicable_edges.update(hypo_not_applicable_edges[initial_color])

        return not_applicable_edges

    def extend_seen_patterns(self, new_patterns : pt.PatternTSetLike,
        new_type_combination : pt.TypeCombi
    ) -> None:
        if not new_type_combination is None:
            self.type_combination = new_type_combination
        extend_set = new_patterns.difference(self.all_patterns)
        self.all_patterns.update(extend_set)
        self.unselected_patterns.update(extend_set)
        self.precondition_splits = None
        self.undefined_preconditions = None

    def get_type_combination(self) -> pt.TypeCombi:
        return self.type_combination

    def set_type_combination(self, type_combination : pt.TypeCombi) -> None:
        self.type_combination = type_combination
        self.type_combination.freeze()

    def invalitate(self) -> None:
        self.color_splits = None
        self.precondition_splits = None
        self.undefined_preconditions = None

    def is_invalid(self) -> bool:
        return self.color_splits == None

    def get_selected_patterns(self) -> Set[pt.PatternT]:
        return set(self.selected_patterns)

    def get_identifier(self) -> FrozenSet[pt.PatternT]:
        #returns the frozenset to use as key in dicts
        #in theory a feature is completly determined by the selected patterns
        #all other vars are merly computional caches
        #converging into the same form for the same input no matter the order
        return self.selected_patterns

    @classmethod
    def extend_identifier(cls,
        identifier : FrozenSet[pt.PatternT], arity : int
    ) -> FrozenSet[FrozenSet[pt.PatternT]]:
        if arity < 2:
            return frozenset({identifier})
        extended_identifier = set()
        for permutation in permutations(range(arity)):
            sub_identifier = set()
            for pattern in identifier:
                sub_identifier.add((pattern[0],tuple(
                    pattern[1][index]
                    for index in permutation
                )))
            extended_identifier.add(frozenset(sub_identifier))
        return frozenset(extended_identifier)

    def get_extended_identifier(self) -> FrozenSet[FrozenSet[pt.PatternT]]:
        #returns a frozenset of all the frozensets
        #with the same meaning to use as key in dicts
        #in theory a feature is completly determined by the selected patterns
        #all other vars are merly computional caches
        #converging into the same form for the same input no matter the order
        if self.extended_identifier is not None:
            return self.extended_identifier
        self.extended_identifier = self.__class__.extend_identifier(
            self.get_identifier(), self.get_type_combination().size()
        )
        return self.extended_identifier

    def __hash__(self) -> int:
        #implemented hash to allow direct use in dicts
        #only the first added feature will be present in a set
        #in most cases this should be the desired behaviour
        return hash(self.get_extended_identifier())

    def __eq__(self, other : object) -> bool:
        if isinstance(other, Feature):
            return self.get_extended_identifier() == other.get_extended_identifier()
        if isinstance(other, frozenset):
            return self.get_extended_identifier() == other
        return False

    def get_color_split_combination_string(
        self, index : int,
        precondition_filter : Optional[pt.PatternTSetLike] = None
    ) -> str:
        output_lines = []
        (
            add_list, del_list,
            pos_precs, neg_precs,
            undefined_precs,
            init_true_atoms, init_false_atoms
        ) = self.get_color_split_combination(index)
        if precondition_filter is not None:
            pos_precs = pos_precs.intersection(precondition_filter)
            neg_precs = neg_precs.intersection(precondition_filter)
            undefined_precs = undefined_precs.intersection(precondition_filter)
        if add_list:
            output_lines.append(f"  Add List: {add_list}")
        if del_list:
            output_lines.append(f"  Delete List: {del_list}")
        if pos_precs:
            output_lines.append(f"  Positive Preconditions: {pos_precs}")
        if neg_precs:
            output_lines.append(f"  Negative Preconditions: {neg_precs}")
        if undefined_precs:
            output_lines.append(f"  Undecided Preconditions: {undefined_precs}")
        if init_true_atoms:
            output_lines.append(f"  True initial Atoms: {init_true_atoms}")
        if init_false_atoms:
            output_lines.append(f"  False initial Atoms: {init_false_atoms}")
        return "\n".join(output_lines)

    def __str__(self) -> str:
        if self.is_invalid():
            return f"Feature is invalid. {self.get_identifier()}"

        output_lines = []
        output_lines.append(f"Type Combination: {self.type_combination}")

        for i in range(self.get_number_of_split_combinations()):
            if not self.has_unique_colouring():
                output_lines.append(f"Kombination {i + 1}:")
            output_lines.append(self.get_color_split_combination_string(i))
            output_lines.append("")

        return "\n".join(output_lines)

    def __repr__(self) -> str:
        return f"Feature({self.get_identifier()}, {not self.is_invalid()})"

    def get_not_selected_patterns(self) -> Set[pt.PatternT]:
        return set(self.unselected_patterns)

    def get_all_patterns(self) -> Set[pt.PatternT]:
        return set(self.all_patterns)

    def get_color_splits(self) -> List[pt.ColorSplitT]:
        return self.color_splits.copy()

    def has_unique_colouring(self) -> bool:
        if (self.color_splits == None):
            return False
        return len(self.color_splits) == 1

    def has_valid_backup(self) -> bool:
        return self.backup_color_splits is not None

    def overwrite_feature(self, other : 'Feature') -> None:
        if not isinstance(other, Feature):
            raise ValueError("A feature can only be overwritten by a feature.")
        elif (other.selected_patterns != self.selected_patterns):
            raise ValueError("A feature can only be overwritten by a logically identical feature.")
        else:
            self.type_combination = other.type_combination
            self.all_patterns = other.all_patterns.copy()
            self.color_splits = ut.safe_copy(other.color_splits)
            self.unselected_patterns = other.unselected_patterns.copy()
            self.backup_color_splits = ut.safe_copy(other.backup_color_splits)
            self.precondition_splits = None
            self.undefined_preconditions = None

    def save_backup(self) -> None:
        #shallow copy should be enough as we only add a new color split and delete the older ones
        #but we do not manipulate the content of an older split.
        if not is_invalid(self):
            self.backup_color_splits = self.color_splits.copy()

    def restore_backup(self) -> None:
        if self.has_valid_backup():
            self.color_splits = self.backup_color_splits.copy()

    def has_changed_since_backup(self) -> bool:
        if self.is_invalid():
            return True
        if not self.has_valid_backup():
            return True
        return not sorted(self.color_splits) == sorted(self.backup_color_splits)

    def extract_precondition_splits(self) -> Optional[Tuple[
            List[pt.PreconditionSplitT],
            Set[pt.PatternT]
        ]]:
        if self.is_invalid():
            return None
        if not self.precondition_splits is None:
            return self.precondition_splits, self.undefined_preconditions
        impossible_prec = set()
        defined_prec = set()
        for color_split in self.color_splits:
            impossible_prec.update(color_split[2].intersection(color_split[3]))
            defined_prec.update(color_split[2].union(color_split[3]))
        undefined_precs = self.unselected_patterns.difference(defined_prec)
        precondition_splits = list()
        for color_split in self.color_splits:
            precondition_splits.append((color_split[0],color_split[1],color_split[2].difference(impossible_prec),color_split[3].difference(impossible_prec),color_split[4],color_split[5]))
        #chache the results until splits are changed again
        self.precondition_splits = precondition_splits
        self.undefined_preconditions = undefined_precs
        return self.precondition_splits, self.undefined_preconditions

    def get_number_of_split_combinations(self) -> int:
        if self.is_invalid():
            return None
        return int(2**(len(self.color_splits) - 1))

    def get_color_split_combination(self, index : int) -> Optional[Tuple[
        Set[pt.PatternT],
        Set[pt.PatternT],
        Set[pt.PatternT],
        Set[pt.PatternT],
        Set[pt.PatternT],
        Set[Tuple[int,pt.GroundingT]],
        Set[Tuple[int,pt.GroundingT]],
    ]]:
        if not (0 <= index < self.get_number_of_split_combinations()):
            return None
        add_list = set()
        del_list = set()
        pos_precs = set()
        neg_precs = set()
        init_true_atoms = set()
        init_false_atoms = set()
        precondition_split, undefined_precs = self.extract_precondition_splits()

        for i, color_split in enumerate(precondition_split):
            #color_flip is an int in range 0 ... 1 holding the ith bit of index and 0 for the last color_split
            color_flip = (index >> i) & 1
            add_list.update(color_split[color_flip])
            del_list.update(color_split[1-color_flip])
            pos_precs.update(color_split[2 + color_flip])
            neg_precs.update(color_split[3 - color_flip])
            init_true_atoms.update(color_split[4 + color_flip])
            init_false_atoms.update(color_split[5 - color_flip])

        remove_list = pos_precs.intersection(neg_precs)
        pos_precs.difference_update(remove_list)
        neg_precs.difference_update(remove_list)
        return add_list, del_list, pos_precs, neg_precs, undefined_precs, init_true_atoms, init_false_atoms

    def get_type_sorted_feature(self, locm_types : LOCM_Types) -> 'Feature':
        try:
            if self.type_combination.size() < 2:
                #We do not need to sort a tuple of size 1 or 0
                return self
            #Important notice: ALL used sortings in this function must be STABLE
            #setup mapping dict
            pattern_mapping = dict()
            for pattern in self.all_patterns:
                new_pattern = (pattern[0],tuple(sorted(
                    pattern[1],
                    key=lambda x: locm_types.get_arg_type((pattern[0],x))
                )))
                pattern_mapping[pattern] = new_pattern

            all_patterns = set(pattern_mapping[pattern] for pattern in self.all_patterns)
            selected_patterns = frozenset(pattern_mapping[pattern] for pattern in self.selected_patterns)
            #in the begining we do not know any relative colour information
            #all patterns will appear sometimes
            #color splits need to be a list to allow ordered removal
            if self.color_splits is not None:
                color_splits = list()
                for split in self.color_splits:
                    new_split = (
                        set(pattern_mapping[pattern] for pattern in split[0]),
                        set(pattern_mapping[pattern] for pattern in split[1]),
                        set(pattern_mapping[pattern] for pattern in split[2]),
                        set(pattern_mapping[pattern] for pattern in split[3]),
                        set((instance, tuple(sorted(
                            grounding,
                            key=lambda x: locm_types.get_obj_type((instance,x))
                        ))) for (instance, grounding) in split[4]
                        ),
                        set((instance, tuple(sorted(
                            grounding,
                            key=lambda x: locm_types.get_obj_type((instance,x))
                        ))) for (instance, grounding) in split[5]
                        )
                    )
                    color_splits.append(new_split)
            else:
                color_splits = None
            #ignore this information for now as it can be restored
            #Constructor will set them to None anyway,
            #but left as comment to see we are not handling them
            #backup_color_splits = None
            #precondition_splits = None
            #undefined_preconditions = None

            new_feature = Feature(
                self.type_combination,
                all_patterns,
                selected_patterns
            )
            new_feature.color_splits = color_splits
            return new_feature
        except KeyError as e:
            sys.stderr.write(f"KeyError sorting {self}: {e}. Using unsorted feature instead.\n")
        except TypeError as e:
            sys.stderr.write(f"TypeError sorting {self}: {e}. Using unsorted feature instead.\n")
        except Exception as e:
            sys.stderr.write(f"Unexpected error sorting {self}: {e}. Using unsorted feature instead.\n")

        #using the old feature will just decrease performance
        #as the new feature would later be generated as well
        #and both duplicates continue to be checked
        return self

    @classmethod
    def extend_features(cls, feature_list : list['Feature'],
        new_patterns : pt.PatternTSetLike,
        type_combination : pt.TypeCombi
    ) -> list['Feature']:
        new_feature_list = list(feature_list)
        powerset = ut.power_set_without_empty_set(new_patterns)
        for feature in feature_list:
            new_feature_list.extend(feature(type_combination, new_patterns, new_selected_patterns, feature)
                for new_selected_patterns in powerset)
            feature.extend_seen_patterns(new_patterns, type_combination)
