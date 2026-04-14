import unittest
import copy
import networkx as nx
from py_separator_utils.mimir_holder import mimir_holder
from graph_generator import bfs_state_space, dfs_state_space, rand_state_space
from graph_generator import get_nx_graph_from_state_space
from py_separator_utils.sift import SIFT
from py_separator_utils.argument_recovery_sift import Argument_Recovery_Sift as ARSift
from py_separator_utils.exceptions import StratificationError
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

        def create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature = None,
            type_combination = None
        ):
            #pattern structure (name, (arguments,))
            if existence_feature is not None:
                _, _, pos_pre, neg_pre, *_ = existence_feature.get_color_split_combination(0)
                type_combination = existence_feature.get_type_combination()
                if existence_feature_sign:
                    pre_patterns = pos_pre
                else:
                    pre_patterns = neg_pre
            else:
                if type_combination is None:
                    raise ValueError("Either existence_feature or type_combination must not be None")
                pre_patterns = locm_types.get_all_patterns_for_typecombination(
                    type_combination
                )
            #Arity of add patterns = 1 + Arity of others remove last element to get the identifying part.
            reduced_add_patterns = {(t[0],t[1][:-1]) for t in add_patterns}
            pre_patterns = pre_patterns.difference(
                reduced_add_patterns.union(del_patterns)
            )
            oi_feature = Ordered_Identifier_Feature(
                existence_feature,
                add_patterns,
                del_patterns,
                pre_patterns,
                type_combination = type_combination,
                pre_pattern_disabling = False
            )
            oi_feature.disabled_pre_patterns = pre_patterns.difference(remaining_pre_patterns)
            if previous_oi_feature is not None:
                oi_feature.argument_identifier_patterns = previous_oi_feature.argument_identifier_patterns
            oi_feature.update_argument_identifier_patterns()
            return oi_feature

        # recovered args:
        #   load(0: pak, 1:truck, 2:chaos, 3:loc)
        # unload(0: pak, 1:truck, 2:chaos, 3:loc)
        #  board(0: dri, 1:truck, 2:loc)
        # dis-em(0: dri, 1:truck, 2:loc)
        #  drive(0:  to, 1:  dri, 2:truck, 3:from)
        #   walk(0: dri, 1:   to, 2:from)

        # Define start point
        locm_types_list = [LOCM_Types(), LOCM_Types(), LOCM_Types()]
        locm_types_list[0].type_args = {
            0: {('unload-truck', 0), ('load-truck', 0)},
            1: {('board-truck', 1), ('load-truck', 1)},
            2: {('walk', 1),
                ('drive-truck', 0)},
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
                ('board-truck', 2)},
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
        locm_types_list[2].updated_types[3] = 2
        for locm_types in locm_types_list:
            for arg_type, arg_set in locm_types.type_args.items():
                locm_types.type_updates[arg_type] = set()
                locm_types.type_objs[arg_type] = set()
                for arg in arg_set:
                    locm_types.arg_types[arg] = arg_type
        locm_types_list[2].type_updates[2].add(3)

        locm_types_list[0].action_arities = {
            'load-truck' :2,
            'unload-truck' :1,
            'board-truck' :2,
            'disembark-truck' :1,
            'drive-truck' :2,
            'walk' :2
        }

        locm_types_list[1].action_arities = {
            'load-truck' :2,
            'unload-truck' :2,
            'board-truck' :3,
            'disembark-truck' :3,
            'drive-truck' :4,
            'walk' :3
        }

        locm_types_list[2].action_arities = {
            'load-truck' :4,
            'unload-truck' :4,
            'board-truck' :3,
            'disembark-truck' :3,
            'drive-truck' :4,
            'walk' :3
        }

        features = [dict(), dict(), dict()]

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
        features[iteration][1] = (feature)

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
        features[iteration][3] = (feature)

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
        features[iteration][1] = (feature)

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
        features[iteration][2] = (feature)

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
        features[iteration][3] = (feature)

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
        features[iteration][4] = (feature)

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
        features[iteration][6] = (feature)

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
        features[iteration][8] = (feature)

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
        features[iteration][11] = (feature)

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
        features[iteration][12] = (feature)

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
        features[iteration][14] = (feature)

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
        features[iteration][18] = (feature)

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
        features[iteration][21] = (feature)

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
        features[iteration][22] = (feature)

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
        features[iteration][1] = (feature)

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
        features[iteration][2] = (feature)

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
        features[iteration][3] = (feature)

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
        features[iteration][4] = (feature)

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
        features[iteration][5] = (feature)

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
        features[iteration][6] = (feature)

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
        features[iteration][8] = (feature)

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
        features[iteration][11] = (feature)

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
        features[iteration][12] = (feature)

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
        features[iteration][14] = (feature)

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
        features[iteration][18] = (feature)

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
        features[iteration][21] = (feature)

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
        features[iteration][22] = (feature)

        oi_features = [dict(), dict(), dict()]

        ### Iteration 0 ###

        iteration = 0
        locm_types = locm_types_list[iteration]

        # OI Feature 1 Package is loaded into Truck
        existence_feature = features[iteration][1]
        existence_feature_sign = True
        add_patterns = frozenset({('load-truck', (0, 1))})
        del_patterns = frozenset({('unload-truck', (0,))})
        remaining_pre_patterns = set()
        previous_oi_feature = None
        type_combination = hm.Multiset({0: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[0][1] = oi_feature

        existence_feature = features[iteration][3]
        existence_feature_sign = True
        add_patterns = frozenset({('board-truck', (0, 1))})
        del_patterns = frozenset({('disembark-truck', (0,))})
        remaining_pre_patterns = {('drive-truck', (1,))}
        previous_oi_feature = None
        type_combination = hm.Multiset({3: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[0][10] = oi_feature

        # OI Feature 13 pos of Driver
        existence_feature = None
        existence_feature_sign = None
        add_patterns = frozenset({('drive-truck', (1, 0)), ('walk', (0, 1))})
        del_patterns = frozenset({('drive-truck', (1,)), ('walk', (0,))})
        remaining_pre_patterns = {('disembark-truck', (0,)), ('board-truck', (0,))}
        previous_oi_feature = None
        type_combination = hm.Multiset({3: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[0][13] = oi_feature

        ### Iteration 1 ###

        iteration = 1
        locm_types = locm_types_list[iteration]

        # OI Feature 1 Package is loaded into Truck
        existence_feature = features[iteration][1]
        existence_feature_sign = True
        add_patterns = frozenset({('load-truck', (0, 1))})
        del_patterns = frozenset({('unload-truck', (0,))})
        remaining_pre_patterns = set()
        previous_oi_feature = oi_features[0][1]
        type_combination = hm.Multiset({0: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][1] = oi_feature

        # OI Feature 4
        existence_feature = None
        existence_feature_sign = None
        add_patterns = frozenset({('board-truck', (1, 0)), ('disembark-truck', (1, 2))})
        del_patterns = frozenset({('disembark-truck', (1,)), ('board-truck', (1,))})
        remaining_pre_patterns = {('load-truck', (1,)), ('drive-truck', (2,)), ('unload-truck', (1,))}
        previous_oi_feature = None
        type_combination = hm.Multiset({1: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][4] = oi_feature

        # OI Feature 5
        existence_feature = features[iteration][2]
        existence_feature_sign = True
        add_patterns = frozenset({('board-truck', (1, 0))})
        del_patterns = frozenset({('disembark-truck', (1,))})
        remaining_pre_patterns = {('drive-truck', (2,))}
        previous_oi_feature = None
        type_combination = hm.Multiset({1: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][5] = oi_feature

        # OI Feature 6
        existence_feature = None
        existence_feature_sign = None
        add_patterns = frozenset({('drive-truck', (2, 0))})
        del_patterns = frozenset({('drive-truck', (2,))})
        remaining_pre_patterns = {('load-truck', (1,)), ('unload-truck', (1,)), ('disembark-truck', (1,)), ('board-truck', (1,))}
        previous_oi_feature = None
        type_combination = hm.Multiset({1: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][6] = oi_feature

        # OI Feature 7
        existence_feature = features[iteration][2]
        existence_feature_sign = False
        add_patterns = frozenset({('disembark-truck', (1, 2))})
        del_patterns = frozenset({('board-truck', (1,))})
        remaining_pre_patterns = set()
        previous_oi_feature = None
        type_combination = hm.Multiset({1: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][7] = oi_feature

        # OI Feature 8
        existence_feature = features[iteration][2]
        existence_feature_sign = True
        add_patterns = frozenset({('drive-truck', (2, 0)), ('board-truck', (1, 2))})
        del_patterns = frozenset({('drive-truck', (2,)), ('disembark-truck', (1,))})
        remaining_pre_patterns = set()
        previous_oi_feature = None
        type_combination = hm.Multiset({1: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][8] = oi_feature

        # OI Feature 9
        existence_feature = features[iteration][3]
        existence_feature_sign = False
        add_patterns = frozenset({('disembark-truck', (0, 2)), ('walk', (0, 1))})
        del_patterns = frozenset({('board-truck', (0,)), ('walk', (0,))})
        remaining_pre_patterns = set()
        previous_oi_feature = None
        type_combination = hm.Multiset({3: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][9] = oi_feature

        # OI Feature 10
        existence_feature = features[iteration][3]
        existence_feature_sign = True
        add_patterns = frozenset({('board-truck', (0, 1))})
        del_patterns = frozenset({('disembark-truck', (0,))})
        remaining_pre_patterns = {('drive-truck', (1,))}
        previous_oi_feature = oi_features[0][10]
        type_combination = hm.Multiset({3: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][10] = oi_feature

        # OI Feature 11
        existence_feature = None
        existence_feature_sign = None
        add_patterns = frozenset({('disembark-truck', (0, 2)), ('board-truck', (0, 1)), ('walk', (0, 1))})
        del_patterns = frozenset({('disembark-truck', (0,)), ('board-truck', (0,)), ('walk', (0,))})
        remaining_pre_patterns = {('drive-truck', (1,))}
        previous_oi_feature = None
        type_combination = hm.Multiset({3: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][11] = oi_feature

        # OI Feature 12
        existence_feature = features[iteration][3]
        existence_feature_sign = True
        add_patterns = frozenset({('board-truck', (0, 2)), ('drive-truck', (1, 0))})
        del_patterns = frozenset({('disembark-truck', (0,)), ('drive-truck', (1,))})
        remaining_pre_patterns = set()
        previous_oi_feature = None
        type_combination = hm.Multiset({3: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][12] = oi_feature

        # OI Feature 13
        existence_feature = None
        existence_feature_sign = None
        add_patterns = frozenset({('drive-truck', (1, 0)), ('walk', (0, 1))})
        del_patterns = frozenset({('drive-truck', (1,)), ('walk', (0,))})
        remaining_pre_patterns = {('disembark-truck', (0,)), ('board-truck', (0,))}
        previous_oi_feature = oi_features[0][13]
        type_combination = hm.Multiset({3: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][13] = oi_feature

        # OI Feature 14
        existence_feature = features[iteration][8]
        existence_feature_sign = True
        add_patterns = frozenset({('drive-truck', (2, 0, 1)), ('board-truck', (1, 2, 0))})
        del_patterns = frozenset({('drive-truck', (2, 3)), ('disembark-truck', (1, 2))})
        remaining_pre_patterns = set()
        previous_oi_feature = None
        type_combination = hm.Multiset({1: 1, 2: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][14] = oi_feature

        # OI Feature 15
        existence_feature = features[iteration][6]
        existence_feature_sign = True
        add_patterns = frozenset({('drive-truck', (2, 1, 0)), ('board-truck', (1, 0, 2))})
        del_patterns = frozenset({('drive-truck', (2, 1)), ('disembark-truck', (1, 0))})
        remaining_pre_patterns = set()
        previous_oi_feature = None
        type_combination = hm.Multiset({1: 1, 3: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][15] = oi_feature

        # OI Feature 16
        existence_feature = features[iteration][21]
        existence_feature_sign = True
        add_patterns = frozenset({('drive-truck', (0, 1, 2)), ('board-truck', (2, 0, 1))})
        del_patterns = frozenset({('drive-truck', (3, 1)), ('disembark-truck', (2, 0))})
        remaining_pre_patterns = set()
        previous_oi_feature = None
        type_combination = hm.Multiset({2: 1, 3: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[1][16] = oi_feature

        ### Iteration 2 ###

        iteration = 2
        locm_types = locm_types_list[iteration]

        # OI Feature 1 Package is loaded into Truck
        existence_feature = features[iteration][1]
        existence_feature_sign = True
        add_patterns = frozenset({('load-truck', (0, 1))})
        del_patterns = frozenset({('unload-truck', (0,))})
        remaining_pre_patterns = set()
        previous_oi_feature = oi_features[1][1]
        type_combination = hm.Multiset({0: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][1] = oi_feature

        # OI Feature 2
        existence_feature = features[iteration][1]
        existence_feature_sign = False
        add_patterns = frozenset({('unload-truck', (0, 3))})
        del_patterns = frozenset({('load-truck', (0,))})
        remaining_pre_patterns = set()
        previous_oi_feature = None
        type_combination = hm.Multiset({0: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][2] = oi_feature

        # OI Feature 3
        existence_feature = None
        existence_feature_sign = None
        add_patterns = frozenset({('unload-truck', (0, 3)), ('load-truck', (0, 1))})
        del_patterns = frozenset({('unload-truck', (0,)), ('load-truck', (0,))})
        remaining_pre_patterns = set()
        previous_oi_feature = None
        type_combination = hm.Multiset({0: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][3] = oi_feature

        # OI Feature 4
        existence_feature = None
        existence_feature_sign = None
        add_patterns = frozenset({('board-truck', (1, 0)), ('disembark-truck', (1, 2))})
        del_patterns = frozenset({('disembark-truck', (1,)), ('board-truck', (1,))})
        remaining_pre_patterns = {('load-truck', (1,)), ('drive-truck', (2,)), ('unload-truck', (1,))}
        previous_oi_feature = oi_features[1][4]
        type_combination = hm.Multiset({1: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][4] = oi_feature

        # OI Feature 5
        existence_feature = features[iteration][2]
        existence_feature_sign = True
        add_patterns = frozenset({('board-truck', (1, 0))})
        del_patterns = frozenset({('disembark-truck', (1,))})
        remaining_pre_patterns = {('drive-truck', (2,))}
        previous_oi_feature = oi_features[1][5]
        type_combination = hm.Multiset({1: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][5] = oi_feature

        # OI Feature 6
        existence_feature = None
        existence_feature_sign = None
        add_patterns = frozenset({('drive-truck', (2, 0))})
        del_patterns = frozenset({('drive-truck', (2,))})
        remaining_pre_patterns = {('load-truck', (1,)), ('unload-truck', (1,)), ('disembark-truck', (1,)), ('board-truck', (1,))}
        previous_oi_feature = oi_features[1][6]
        type_combination = hm.Multiset({1: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][6] = oi_feature

        # OI Feature 7
        existence_feature = features[iteration][2]
        existence_feature_sign = False
        add_patterns = frozenset({('disembark-truck', (1, 2))})
        del_patterns = frozenset({('board-truck', (1,))})
        remaining_pre_patterns = set()
        previous_oi_feature = oi_features[1][7]
        type_combination = hm.Multiset({1: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][7] = oi_feature

        # OI Feature 8
        existence_feature = features[iteration][2]
        existence_feature_sign = True
        add_patterns = frozenset({('drive-truck', (2, 0)), ('board-truck', (1, 2))})
        del_patterns = frozenset({('drive-truck', (2,)), ('disembark-truck', (1,))})
        remaining_pre_patterns = set()
        previous_oi_feature = oi_features[1][8]
        type_combination = hm.Multiset({1: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][8] = oi_feature

        # OI Feature 9
        existence_feature = features[iteration][3]
        existence_feature_sign = False
        add_patterns = frozenset({('disembark-truck', (0, 2)), ('walk', (0, 1))})
        del_patterns = frozenset({('board-truck', (0,)), ('walk', (0,))})
        remaining_pre_patterns = set()
        previous_oi_feature = oi_features[1][9]
        type_combination = hm.Multiset({2: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][9] = oi_feature

        # OI Feature 10
        existence_feature = features[iteration][3]
        existence_feature_sign = True
        add_patterns = frozenset({('board-truck', (0, 1))})
        del_patterns = frozenset({('disembark-truck', (0,))})
        remaining_pre_patterns = {('drive-truck', (1,))}
        previous_oi_feature = oi_features[1][10]
        type_combination = hm.Multiset({2: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][10] = oi_feature

        # OI Feature 11
        existence_feature = None
        existence_feature_sign = None
        add_patterns = frozenset({('disembark-truck', (0, 2)), ('board-truck', (0, 1)), ('walk', (0, 1))})
        del_patterns = frozenset({('disembark-truck', (0,)), ('board-truck', (0,)), ('walk', (0,))})
        remaining_pre_patterns = {('drive-truck', (1,))}
        previous_oi_feature = oi_features[1][11]
        type_combination = hm.Multiset({2: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][11] = oi_feature

        # OI Feature 12
        existence_feature = features[iteration][3]
        existence_feature_sign = True
        add_patterns = frozenset({('board-truck', (0, 2)), ('drive-truck', (1, 0))})
        del_patterns = frozenset({('disembark-truck', (0,)), ('drive-truck', (1,))})
        remaining_pre_patterns = set()
        previous_oi_feature = oi_features[1][12]
        type_combination = hm.Multiset({2: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][12] = oi_feature

        # OI Feature 13
        existence_feature = None
        existence_feature_sign = None
        add_patterns = frozenset({('drive-truck', (1, 0)), ('walk', (0, 1))})
        del_patterns = frozenset({('drive-truck', (1,)), ('walk', (0,))})
        remaining_pre_patterns = {('disembark-truck', (0,)), ('board-truck', (0,))}
        previous_oi_feature = oi_features[1][13]
        type_combination = hm.Multiset({2: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][13] = oi_feature

        # OI Feature 14
        existence_feature = features[iteration][8]
        existence_feature_sign = True
        add_patterns = frozenset({('drive-truck', (2, 0, 1)), ('board-truck', (1, 2, 0))})
        del_patterns = frozenset({('drive-truck', (2, 3)), ('disembark-truck', (1, 2))})
        remaining_pre_patterns = set()
        previous_oi_feature = oi_features[1][14]
        type_combination = hm.Multiset({1: 1, 2: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][14] = oi_feature

        # OI Feature 15
        existence_feature = features[iteration][6]
        existence_feature_sign = True
        add_patterns = frozenset({('drive-truck', (2, 1, 0)), ('board-truck', (1, 0, 2))})
        del_patterns = frozenset({('drive-truck', (2, 1)), ('disembark-truck', (1, 0))})
        remaining_pre_patterns = set()
        previous_oi_feature = oi_features[1][15]
        type_combination = hm.Multiset({1: 1, 2: 1})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][15] = oi_feature

        # OI Feature 16
        existence_feature = features[iteration][21]
        existence_feature_sign = True
        add_patterns = frozenset({('drive-truck', (0, 1, 2)), ('board-truck', (2, 0, 1))})
        del_patterns = frozenset({('drive-truck', (3, 1)), ('disembark-truck', (2, 0))})
        remaining_pre_patterns = set()
        previous_oi_feature = oi_features[1][16]
        type_combination = hm.Multiset({2: 2})
        oi_feature = create_oi_feature(
            existence_feature,
            existence_feature_sign,
            add_patterns,
            del_patterns,
            remaining_pre_patterns,
            previous_oi_feature,
            type_combination
        )
        oi_features[2][16] = oi_feature

        # Define paths
        self.domain_path = "pddl_files/driverlog/driverlog.pddl"
        self.instance_paths = [
            "pddl_files/driverlog/driverlog-p2l3.pddl",
            "pddl_files/driverlog/driverlog-t2l3.pddl",
            "pddl_files/driverlog/driverlog-td2.pddl"
        ]
        self.num_edges = [
            4000,
            4000,
            4000
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

        self.process_pool_args = {
            'max_workers' : 10
        }

        oi_feature_order = (1,10,13,4,6,5,7,8,9,11,12,14,15,16,2,3)

        self.ar_sift = ARSift(dict(), output_file_name="module_test_2")
        for i in [0,1,2]:
            self.ar_sift.sift_iterations[i] = SIFT(dict())
            self.ar_sift.order_id_features[i] = set(oi_features[i].values())
            self.ar_sift.argument_identifier_features[i] = tuple(
                oi_features[i][key]
                for key in oi_feature_order
                if key in oi_features[i]
            )
            self.ar_sift.sift_iterations[i].LOCM_types = locm_types_list[i]
            self.ar_sift.sift_iterations[i].all_features = set(features[i].values())

        self.ar_sift.updated_oi_features[0] = set()
        self.ar_sift.revised_oi_features[0] = (oi_features[0][1],oi_features[0][10],oi_features[0][13])

        self.ar_sift.updated_oi_features[1] = set()
        self.ar_sift.revised_oi_features[1] = tuple(
            oi_features[1][key]
            for key in oi_feature_order
            if key not in oi_features[0] and
            key in oi_features[1]
        )

        self.ar_sift.updated_oi_features[2] = set(
            oi_features[2][key]
            for key in oi_feature_order
            if key in oi_features[1] and
            oi_features[2][key].get_type_combination().count(2)>0
        )
        self.ar_sift.revised_oi_features[2] = tuple(
            oi_features[2][key]
            for key in oi_feature_order
            if key not in oi_features[1] or
            oi_features[2][key].get_type_combination().count(2)>0
        )

        assign = {
            #action -> oif num -> pat[1]
            "load-truck" : {2 : (4,(1,)), 3 : (6,(1,))},
            "drive-truck" : {2 : (10,(1,)), 3 : (13,(1,))},
            "walk" : {2 : (13,(0,))},
            "board-truck" : {2 : (13,(0,))},
            "unload-truck" : {1 : (1,(0,)), 2 : (4,(1,)), 3 : (6,(1,))},
            "disembark-truck" : {1 : (10,(0,)), 2 : (13,(0,))}
        }
        for action, assigns in assign.items():
            self.ar_sift.arg_feature_assignments[action] = dict()
            for arg, (fnum, pat1) in assigns.items():
                oi_feature = oi_features[2][fnum]
                ai_pattern = (action, pat1)
                self.ar_sift.arg_feature_assignments[action][arg] = (oi_feature,ai_pattern)
        print(self.ar_sift.arg_feature_assignments)

    def test_verifier(self):
        verifier = copy.deepcopy(self.ar_sift)

        method_name = 'bfs'
        graphs = dict()
        for i in range(len(self.instance_paths)):
            pddl_holder = mimir_holder(self.domain_path, self.instance_paths[i])
            #static_pddl_holder = mimir_holder(self.domain_path_static, self.instance_path_static)

            # Generate graph using bfs_state_space
            ret = self.methods[method_name](
                mimir_stuff=pddl_holder,
                num_edges=self.num_edges[i],
                number_of_input=self.number_inputs,
                introduce_false_edge=self.introduce_false_edge,
                static_relaxation=pddl_holder,
                arg_mask=self.arg_mask
            )

            graphs[i] = (ret[0], ret[1])

        for instance in graphs.values():
            for u, v, data in instance[0].edges(data=True):
                labels = data['action']
                new_labels = set()
                for label in labels:
                    if label[0] in self.arg_mask:
                        mask = self.arg_mask[label[0]]
                        new_label = (label[0],tuple(x for i, x in enumerate(label[1]) if i not in mask))
                    else:
                        new_label = label
                    new_labels.add(new_label)
                data['action'] = new_labels
            print(f"Graph with {instance[0].number_of_nodes()} nodes and {instance[0].number_of_edges()} edges.")

        verifier.replace_graphs(graphs)
        verifier.run(
            self.process_pool_args,
            verification_mode = True
        )

if __name__ == '__main__':
    unittest.main()
