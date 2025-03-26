import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
from typing import Optional
#features will invalitate themselfs on a color failure
#remember to deepcopy them for testing unsafe graphs
#or to use the backup system, not that this will only use shallow copies
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
                [{pat},set(),set(),set(),set(),set()] for pat in selected_patterns
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
            self.all_patterns = set(other.all_patterns.union(all_patterns))
            self.selected_patterns = frozenset(
                other.selected_patterns.union(selected_patterns)
            )
            #in the begining we do not know any relative colour information
            #all patterns will appear sometimes
            #color splits need to be a list to allow ordered removal
            self.color_splits = other.color_splits.extend(
                [[{pat},set(),set(),set(),set(),set()]
                for pat in selected_patterns.difference(
                    set().union(*(other.color_splits[0]))
                    .union(*(other.color_splits[1]))
            )])
        self.unselected_patterns = set(
            self.all_patterns.difference(self.selected_patterns)
        )
        self.backup_color_splits = None
        self.precondition_splits = None
        self.undefined_preconditions = None

    def delete_initial_atoms(self):
        if not self.is_invalid():
            for split in self.color_splits:
                split[4] = set()
                split[5] = set()
            self.precondition_splits = None

    def parse_edge_label(self, edge_label : pt.Edge_LabelT,
        grounding : pt.GroundingT
    ):
        #grounding a tupel holding the currently active objects
        found_matching = False
        found_unmatching = False
        matching_selected_pattens = set()
        matching_unselected_pattens = set()
        for label in edge_label:
            found = False
            for sel_pat in self.selected_patterns:
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
                    found = True
                    matching_selected_pattens.add(sel_pat)
            if not found:
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
                            if object_label != object_pat:
                                mismatch = True
                    if not mismatch:
                        matching_unselected_pattens.add(unsel_pat)

            if found:
                found_matching = True
            else:
                found_unmatching = True

        return (found_matching,
            found_unmatching,
            matching_selected_pattens,
            matching_unselected_pattens)

    def add_color_constraint(self, pattern_colors : list):
        #pattern_colors is a list of four sets of patterns
        if self.is_invalid():
            return None
        #new_split will grow with any old split it connects
        new_split = [set(pattern_colors[0]),set(pattern_colors[1]),
            set(pattern_colors[2]),set(pattern_colors[3]),
            set(pattern_colors[4]),set(pattern_colors[5])]
        if (
            (not new_split[0].issubset(self.selected_patterns)) or 
            (not new_split[1].issubset(self.selected_patterns))
        ):
            #not a correct input
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
            self.color_splits.append(new_split)
            self.precondition_splits = None
            self.undefined_preconditions = None
        return new_split

    def color_graph(self, instance : int, Graph : pt.GraphT, initial_state : pt.NodeT,
        grounding : pt.GroundingT
    ):
        if self.is_invalid():
            return None
        node_color = {i: None for i in Graph.nodes()}
        node_color[initial_state] = 0
        pattern_colors = [set(),set(),set(),set(),{(instance, grounding)},set()]
        open_nodes = [initial_state]
        while len(open_nodes) > 0:
            node = open_nodes.pop(0)
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
                        
                        for col_pat in matching_selected_pattens:
                            #pattern get the same color as target nodes
                            pattern_colors[node_color[edge[1]]].add(col_pat)

                    else:
                        #neutral edge keep color
                        if node_color[edge[a]] is None:
                            node_color[edge[a]] = node_color[edge[b]]
                            open_nodes.append(edge[a])
                        elif node_color[edge[a]] != node_color[edge[b]]:
                            #invalid coloring
                            self.invalitate()
                            return None

                        (pattern_colors[node_color[edge[1]]+2]
                        .update(matching_unselected_pattens))

        #check pattern consitency at the end to keep stuff readable
        result = self.add_color_constraint(pattern_colors)
        if result is None :
            return None

        return node_color

    def extend_seen_patterns(self, new_patterns : pt.PatternTSetLike,
        new_type_combination : pt.TypeCombi
    ):
        if not new_type_combination is None:
            self.type_combination = new_type_combination
        extend_set = new_patterns.difference(self.all_patterns)
        self.all_patterns.update(extend_set)
        self.unselected_patterns.update(extend_set)
        self.precondition_splits = None
        self.undefined_preconditions = None

    def get_type_combination(self):
        return self.type_combination

    def invalitate(self):
        self.color_splits = None
        self.precondition_splits = None
        self.undefined_preconditions = None

    def is_invalid(self):
        return self.color_splits == None

    def get_selected_patterns(self):
        return set(self.selected_patterns)

    def get_identifier(self):
        #returns the frozenset to use as key in dicts
        #in theory a feature is completly determined by the selected features
        #all other vars are merly computional caches
        #converging into the same form for the same input no matter the order
        return self.selected_patterns

    def __hash__(self):
        #implemented hash to allow direct use in dicts
        #only the first added feature will be present in a set
        #in most cases this should be the desired behaviour
        return hash(self.get_identifier())

    def __eq__(self, other):
        if isinstance(other, Feature):
            return self.get_identifier() == other.get_identifier()
        return False

    def __str__(self):
        if self.is_invalid():
            return f"Feature is invalid. {self.selected_patterns}"

        output_lines = []
        output_lines.append(f"Type Combination: {self.type_combination}")

        for i in range(self.get_number_of_split_combinations()):
            add_list, del_list, pos_precs, neg_precs, undefined_precs, init_true_atoms, init_false_atoms = self.get_color_split_combination(i)
            if not self.has_unique_colouring():
                output_lines.append(f"Kombination {i + 1}:")
            output_lines.append(f"  Add List: {add_list}")
            output_lines.append(f"  Delete List: {del_list}")
            output_lines.append(f"  Positive Preconditions: {pos_precs}")
            output_lines.append(f"  Negative Preconditions: {neg_precs}")
            output_lines.append(f"  Undecided Preconditions: {undefined_precs}")
            output_lines.append(f"  True initial Atoms: {init_true_atoms}")
            output_lines.append(f"  False initial Atoms: {init_false_atoms}")
            output_lines.append("")

        return "\n".join(output_lines)

    def get_not_selected_patterns(self):
        return set(self.unselected_patterns)

    def get_all_patterns(self):
        return set(self.all_patterns)

    def get_color_splits(self):
        return self.color_splits

    def has_unique_colouring(self):
        if (self.color_splits == None):
            return False
        return len(self.color_splits) == 1

    def has_valid_backup(self):
        return self.backup_color_splits is not None

    def overwrite_feature(self, other):
        if not isinstance(other, Feature):
            raise ValueError("A feature can only be overwritten by a feature.")
        elif (other.selected_patterns != self.selected_patterns):
            raise ValueError("A feature can only be overwritten by a logically identical feature.")
        else:
            self.type_combination = other.type_combination
            self.all_patterns = set(other.all_patterns)
            if other.color_splits is None:
                self.color_splits = None
            else:
                self.color_splits = list(other.color_splits)
            self.unselected_patterns = set(other.unselected_patterns)
            if other.backup_color_splits is None:
                self.backup_color_splits = None
            else:
                self.backup_color_splits = list(other.backup_color_splits)
            self.precondition_splits = None
            self.undefined_preconditions = None

    def save_backup(self):
        #shallow copy should be enough as we only add a new color split and delete the older ones
        #but we do not manipulate the content of an older split.
        if not is_invalid(self):
            self.backup_color_splits = list(self.color_splits)

    def restore_backup(self):
        if self.has_valid_backup():
            self.color_splits = list(self.backup_color_splits)

    def has_changed_since_backup(self):
        if self.is_invalid():
            return True
        if not self.has_valid_backup():
            return True
        return not sorted(self.color_splits) == sorted(self.backup_color_splits)

    def extract_precondition_splits(self):
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
        precondition_split = list()
        for color_split in self.color_splits:
            precondition_split.append([color_split[0],color_split[1],color_split[2].difference(impossible_prec),color_split[3].difference(impossible_prec),color_split[4],color_split[5]])
        #chache the results until splits are changed again
        self.precondition_splits = precondition_split
        self.undefined_preconditions = undefined_precs
        return precondition_split, undefined_precs

    def get_number_of_split_combinations(self):
        if self.is_invalid():
            return None
        return int(2**(len(self.color_splits) - 1))

    def get_color_split_combination(self, index : int):
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

    @classmethod
    def extend_features(cls, feature_list : list['Feature'],
        new_patterns : pt.PatternTSetLike,
        type_combination : pt.TypeCombi
    ):
        new_feature_list = list(feature_list)
        powerset = ut.power_set_without_empty_set(new_patterns)
        for feature in feature_list:
            new_feature_list.extend(feature(type_combination, new_patterns, new_selected_patterns, feature)
                for new_selected_patterns in powerset)
            feature.extend_seen_patterns(new_patterns, type_combination)
