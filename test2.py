import unittest
import networkx as nx
from py_separator_utils.mimir_holder import mimir_holder
from graph_generator import bfs_state_space, dfs_state_space, rand_state_space
from graph_generator import get_nx_graph_from_state_spacefrom py_separator_utils.sift import SIFT
from py_separator_utils.argument_recovery_sift import Argument_Recovery_Sift as ARSift
from py_separator_utils.argument_recovery_sift import StratificationError
from py_separator_utils.feature import Feature
from py_separator_utils.ordered_identifier_feature import Ordered_Identifier_Feature
import py_separator_utils.hashable_multiset as hm
from py_separator_utils.object_types import LOCM_Types
import py_separator_utils.utils as ut

class TestGraphGenerationMethods(unittest.TestCase):

    def setUp(self):
        def create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        ):
            all_patterns = locm_types.get_all_patterns_for_typecombination(type_combination)
            selected_patterns = frozenset(add_patterns.union(del_patterns))
            feature = Feature(
                type_combination,
                all_patterns,
                selected_patterns
            )
            feature.color_splits = [(
                add_patterns, del_patterns,
                set(all_patterns).difference(neg_precs).difference(undefined_precs),
                set(all_patterns).difference(pos_precs).difference(undefined_precs),
                set(),
                set()
            )]
            return feature

        # recovered args:
        #   load(0: pak, 1:truck, 2:chaos, 3:loc)
        # unload(0: pak, 1:truck, 2:chaos, 3:loc)
        #  board(0: dri, 1:truck, 2:loc)
        # dis-em(0: dri, 1:truck, 2:loc)
        #  drive(0:  to, 1:  dri, 2:truck, 3:from)
        #   walk(0: dri, 1:   to, 2:from)

        # Define start point
        locm_types_list = [LOCM_Types()] * 3
        locm_types_list[0].type_args = {
            0: {('unload-truck', 0), ('load-truck', 0)},
            1: {('board-truck', 1), ('load-truck', 1)},
            2: {('walk', 1),
                ('drive-truck', 0)}
            3: {('disembark-truck', 0),
                ('drive-truck', 1),
                ('board-truck', 0),
                ('walk', 0)}
        }
        locm_types_list[1].type_args = {
            0: {('unload-truck', 0), ('load-truck', 0)},
            1: {('board-truck', 1), ('load-truck', 1),
                ('disembark-truck', 1), ('unload-truck', 1),
                ('drive-truck', 2)},
            2: {('walk', 2),
                ('walk', 1),
                ('disembark-truck', 2),
                ('drive-truck', 0),
                ('drive-truck', 3),
                ('board-truck', 2)}
            3: {('disembark-truck', 0),
                ('drive-truck', 1),
                ('board-truck', 0),
                ('walk', 0)}
        }
        locm_types_list[2].type_args = {
            0: {('unload-truck', 0), ('load-truck', 0)},
            1: {('board-truck', 1), ('load-truck', 1),
                ('disembark-truck', 1), ('unload-truck', 1),
                ('drive-truck', 2)},
            2: {('disembark-truck', 0), ('walk', 2),
                ('load-truck', 2), ('unload-truck', 3),
                ('drive-truck', 1), ('board-truck', 0),
                ('disembark-truck', 2), ('walk', 1),
                ('drive-truck', 0), ('unload-truck', 2),
                ('drive-truck', 3), ('load-truck', 3),
                ('walk', 0), ('board-truck', 2)}
        }
        for locm_types in locm_types_list:
            for arg_type, arg_set in locm_types.type_args.items():
                for arg in arg_set:
                    locm_types.arg_types[arg] = arg_type

        features = [list()] * 3

        ### Iteration 0 ###

        iteration = 0
        locm_types = locm_types_list[iteration]

        #Feature 1 Package is loaded
        type_combination = hm.Multiset({0: 1})
        add_patterns = {('load-truck', (0,))}
        del_patterns = {('unload-truck', (0,))}
        pos_precs = set()
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 3 Driver is driving
        type_combination = hm.Multiset({3: 1})
        add_patterns = {('board-truck', (0,))}
        del_patterns = {('disembark-truck', (0,))}
        pos_precs = {('drive-truck', (1,))}
        neg_precs = {('walk', (0,))}
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        ### Iteration 1 ###

        iteration = 1
        locm_types = locm_types_list[iteration]

        #Feature 1 Package is loaded
        type_combination = hm.Multiset({0: 1})
        add_patterns = {('load-truck', (0,))}
        del_patterns = {('unload-truck', (0,))}
        pos_precs = set()
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 2 Truck is driven
        type_combination = hm.Multiset({1: 1})
        add_patterns = {('board-truck', (1,))}
        del_patterns = {('disembark-truck', (1,))}
        pos_precs = {('drive-truck', (2,))}
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 3 Driver is driving
        type_combination = hm.Multiset({3: 1})
        add_patterns = {('board-truck', (0,))}
        del_patterns = {('disembark-truck', (0,))}
        pos_precs = {('drive-truck', (1,))}
        neg_precs = {('walk', (0,))}
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 4 Package is loaded into Truck
        type_combination = hm.Multiset({0: 1, 1: 1})
        add_patterns = {('load-truck', (0, 1))}
        del_patterns = {('unload-truck', (0, 1))}
        pos_precs = set()
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 6 Truck is driven by Driver
        type_combination = hm.Multiset({1: 1, 3: 1})
        add_patterns = {('board-truck', (1, 0))}
        del_patterns = {('disembark-truck', (1, 0))}
        pos_precs = {('drive-truck', (2, 1))}
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 8 loc of truck while driven
        type_combination = hm.Multiset({1: 1, 2: 1})
        add_patterns = {('drive-truck', (2, 0)), ('board-truck', (1, 2))}
        del_patterns = {('drive-truck', (2, 3)), ('disembark-truck', (1, 2))}
        pos_precs = set()
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 11 loc of truck while parked
        type_combination = hm.Multiset({1: 1, 2: 1})
        add_patterns = {('disembark-truck', (1, 2))}
        del_patterns = {('board-truck', (1, 2))}
        pos_precs = set()
        neg_precs = {('drive-truck', (2, 3)), ('drive-truck', (2, 0))}
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 12 loc of truck
        type_combination = hm.Multiset({1: 1, 2: 1})
        add_patterns = {('drive-truck', (2, 0))}
        del_patterns = {('drive-truck', (2, 3))}
        pos_precs = {('disembark-truck', (1, 2)), ('board-truck', (1, 2))}
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 14 position of driver global
        type_combination = hm.Multiset({2: 1, 3: 1})
        add_patterns = {('walk', (1, 0)), ('drive-truck', (0, 1))}
        del_patterns = {('drive-truck', (3, 1)), ('walk', (2, 0))}
        pos_precs = {('board-truck', (2, 0)), ('disembark-truck', (2, 0))}
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 18 position of driver by feet
        type_combination = hm.Multiset({2: 1, 3: 1})
        add_patterns = {('walk', (1, 0)), ('disembark-truck', (2, 0))}
        del_patterns = {('walk', (2, 0)), ('board-truck', (2, 0))}
        pos_precs = set()
        neg_precs = {('drive-truck', (0, 1)), ('drive-truck', (3, 1))}
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 21 position of driver in truck
        type_combination = hm.Multiset({2: 1, 3: 1})
        add_patterns = {('drive-truck', (0, 1)), ('board-truck', (2, 0))}
        del_patterns = {('drive-truck', (3, 1)), ('disembark-truck', (2, 0))}
        pos_precs = set()
        neg_precs = {('walk', (1, 0)), ('walk', (2, 0))}
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 22 position of driver and truck while driving
        type_combination = hm.Multiset({1: 1, 2: 1, 3: 1})
        add_patterns = {('drive-truck', (2, 0, 1)), ('board-truck', (1, 2, 0))}
        del_patterns = {('drive-truck', (2, 3, 1)), ('disembark-truck', (1, 2, 0))}
        pos_precs = set()
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        ### Iteration 2 ###

        iteration = 2
        locm_types = locm_types_list[iteration]

        #Feature 1 Package is loaded
        type_combination = hm.Multiset({0: 1})
        add_patterns = {('load-truck', (0,))}
        del_patterns = {('unload-truck', (0,))}
        pos_precs = set()
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 2 Truck is driven
        type_combination = hm.Multiset({1: 1})
        add_patterns = {('board-truck', (1,))}
        del_patterns = {('disembark-truck', (1,))}
        pos_precs = {('drive-truck', (2,))}
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 3 Driver is driving
        type_combination = hm.Multiset({2: 1})
        add_patterns = {('board-truck', (0,))}
        del_patterns = {('disembark-truck', (0,))}
        pos_precs = {('unload-truck', (2,)), ('drive-truck', (1,)), ('load-truck', (2,))}
        neg_precs = {('walk', (0,))}
        undefined_precs = {('disembark-truck', (2,)), ('drive-truck', (3,)), ('load-truck', (3,)), ('walk', (1,)), ('drive-truck', (0,)), ('board-truck', (2,)), ('unload-truck', (3,)), ('walk', (2,))}

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 4 Package is loaded into Truck
        type_combination = hm.Multiset({0: 1, 1: 1})
        add_patterns = {('load-truck', (0, 1))}
        del_patterns = {('unload-truck', (0, 1))}
        pos_precs = set()
        neg_precs = set()
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 5 loc of a package
        type_combination = hm.Multiset({0: 1, 2: 1})
        add_patterns = {('unload-truck', (0, 3))}
        del_patterns = {('load-truck', (0, 3))}
        pos_precs = {('load-truck', (0, 2))}
        neg_precs = {('unload-truck', (0, 2))}
        undefined_precs = set()

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 6 Truck is driven by Driver
        type_combination = hm.Multiset({1: 1, 2: 1})
        add_patterns = {('board-truck', (1, 0))}
        del_patterns = {('disembark-truck', (1, 0))}
        pos_precs = {('unload-truck', (1, 2)), ('drive-truck', (2, 1)), ('load-truck', (1, 2))}
        neg_precs = set()
        undefined_precs = {('unload-truck', (1, 3)), ('disembark-truck', (1, 2)), ('board-truck', (1, 2)), ('load-truck', (1, 3)), ('drive-truck', (2, 3)), ('drive-truck', (2, 0))}

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 8 loc of truck while driven
        type_combination = hm.Multiset({1: 1, 2: 1})
        add_patterns = {('drive-truck', (2, 0)), ('board-truck', (1, 2))}
        del_patterns = {('drive-truck', (2, 3)), ('disembark-truck', (1, 2))}
        pos_precs = set()
        neg_precs = {('unload-truck', (1, 2)), ('load-truck', (1, 2))}
        undefined_precs = {('board-truck', (1, 0)), ('drive-truck', (2, 1)), ('disembark-truck', (1, 0))}

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 11 loc of truck while parked
        type_combination = hm.Multiset({1: 1, 2: 1})
        add_patterns = {('disembark-truck', (1, 2))}
        del_patterns = {('board-truck', (1, 2))}
        pos_precs = {('unload-truck', (1, 2)), ('load-truck', (1, 2))}
        neg_precs = {('drive-truck', (2, 3)), ('drive-truck', (2, 0))}
        undefined_precs = {('board-truck', (1, 0)), ('drive-truck', (2, 1)), ('disembark-truck', (1, 0))}

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 12 position of truck
        type_combination = hm.Multiset({1: 1, 2: 1})
        add_patterns = {('drive-truck', (2, 0))}
        del_patterns = {('drive-truck', (2, 3))}
        pos_precs = {('unload-truck', (1, 3)), ('load-truck', (1, 3)), ('disembark-truck', (1, 2)), ('unload-truck', (1, 2)), ('load-truck', (1, 2)), ('board-truck', (1, 2))}
        neg_precs = set()
        undefined_precs = {('board-truck', (1, 0)), ('drive-truck', (2, 1)), ('disembark-truck', (1, 0))}

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 14 position of driver global
        type_combination = hm.Multiset({2: 2})
        add_patterns = {('walk', (1, 0)), ('drive-truck', (0, 1))}
        del_patterns = {('drive-truck', (3, 1)), ('walk', (2, 0))}
        pos_precs = {('load-truck', (3, 2)), ('unload-truck', (3, 2)), ('board-truck', (2, 0)), ('disembark-truck', (2, 0))}
        neg_precs = set()
        undefined_precs = {('disembark-truck', (0, 2)), ('walk', (2, 1)), ('drive-truck', (0, 3)), ('walk', (0, 1)), ('unload-truck', (2, 3)), ('drive-truck', (1, 3)), ('board-truck', (0, 2)), ('drive-truck', (1, 0)), ('walk', (0, 2)), ('walk', (1, 2)), ('drive-truck', (3, 0)), ('load-truck', (2, 3))}

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 18 position of driver by feet
        type_combination = hm.Multiset({2: 2})
        add_patterns = {('walk', (1, 0)), ('disembark-truck', (2, 0))}
        del_patterns = {('walk', (2, 0)), ('board-truck', (2, 0))}
        pos_precs = set()
        neg_precs = {('drive-truck', (0, 1)), ('drive-truck', (3, 1)), ('load-truck', (3, 2)), ('unload-truck', (3, 2))}
        undefined_precs = {('disembark-truck', (0, 2)), ('walk', (2, 1)), ('drive-truck', (0, 3)), ('walk', (0, 1)), ('unload-truck', (2, 3)), ('drive-truck', (1, 3)), ('board-truck', (0, 2)), ('drive-truck', (1, 0)), ('walk', (0, 2)), ('walk', (1, 2)), ('drive-truck', (3, 0)), ('load-truck', (2, 3))}

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 21 position of driver in truck
        type_combination = hm.Multiset({2: 2})
        add_patterns = {('drive-truck', (0, 1)), ('board-truck', (2, 0))}
        del_patterns = {('drive-truck', (3, 1)), ('disembark-truck', (2, 0))}
        pos_precs = {('load-truck', (3, 2)), ('unload-truck', (3, 2))}
        neg_precs = {('walk', (1, 0)), ('walk', (2, 0))}
        undefined_precs = {('disembark-truck', (0, 2)), ('walk', (2, 1)), ('drive-truck', (0, 3)), ('walk', (0, 1)), ('unload-truck', (2, 3)), ('drive-truck', (1, 3)), ('board-truck', (0, 2)), ('drive-truck', (1, 0)), ('walk', (0, 2)), ('walk', (1, 2)), ('drive-truck', (3, 0)), ('load-truck', (2, 3))}

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        #Feature 22 position of driver and truck while driving
        type_combination = hm.Multiset({1: 1, 2: 2})
        add_patterns = {('drive-truck', (2, 0, 1)), ('board-truck', (1, 2, 0))}
        del_patterns = {('drive-truck', (2, 3, 1)), ('disembark-truck', (1, 2, 0))}
        pos_precs = {('load-truck', (1, 3, 2)), ('unload-truck', (1, 3, 2))}
        neg_precs = set()
        undefined_precs = {('drive-truck', (2, 3, 0)), ('drive-truck', (2, 0, 3)), ('load-truck', (1, 2, 3)), ('disembark-truck', (1, 0, 2)), ('drive-truck', (2, 1, 3)), ('drive-truck', (2, 1, 0)), ('unload-truck', (1, 2, 3)), ('board-truck', (1, 0, 2))}

        feature = create_feature(
            type_combination,
            add_patterns,
            del_patterns,
            pos_precs,
            neg_precs,
            undefined_precs
        )
        features[iteration].append(feature)

        # Define paths
        self.domain_path = "pddl_files/driverlog/driverlog.pddl"
        self.instance_paths = [
            "pddl_files/driverlog/driverlog-2.pddl"
        ]
        self.num_edges = [
            40000
        ]
        # Parameters
        self.number_inputs = 1
        self.introduce_false_edge = False
        self.arg_mask = {
            'load-truck': {2},
            'unload-truck': {1, 2},
            'board-truck': {2},
            'disembark-truck': {1, 2},
            'drive-truck': {0, 1},
            'walk': {1}

        }
        self.methods = {
            'bfs': bfs_state_space
        }

if __name__ == '__main__':
    unittest.main()
