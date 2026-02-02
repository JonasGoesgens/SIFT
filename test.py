import unittest
import networkx as nx
from py_separator_utils.mimir_holder import mimir_holder
from graph_generator import bfs_state_space, dfs_state_space, rand_state_space
from graph_generator import get_nx_graph_from_state_space
import py_separator_utils.utils as ut
from networkx.algorithms.isomorphism import DiGraphMatcher
from networkx.algorithms.isomorphism import categorical_edge_match

class TestGraphGenerationMethods(unittest.TestCase):

    def setUp(self):
        # Define paths
        self.domain_path = "pddl_files/logistics/logistics.pddl"
        self.instance_paths = [
            "pddl_files/logistics/logistics-3c.pddl",
            "pddl_files/logistics/logistics-3a.pddl",
            "pddl_files/logistics/logistics-3t.pddl"
        ]
        self.num_edges = [
            1392,
            57344,
            46440
        ]
        # Parameters
        self.number_inputs = 1
        self.introduce_false_edge = False
        self.arg_mask = {
            'load': {2},
            'unload': {1, 2},
            'drive': {1},
            'fly': {1}
        }
        self.methods = {
            'bfs': bfs_state_space,
            'dfs': dfs_state_space,
            'rand': rand_state_space,
        }

    def generate_and_compare_graphs(self, method_name):
        self.assertTrue(
            method_name in self.methods,
            msg = f"{ut.format_cur_time()}: Tried to test unimplemented method {method_name}")
        # Load PDDL holders
        for i in [0,1,2]:
            pddl_holder = mimir_holder(self.domain_path, self.instance_paths[i])

            # Generate graph using get_nx_graph_from_state_space
            G_fg, _, _, _ = get_nx_graph_from_state_space(
                mimir_stuff = pddl_holder,
                introduce_false_edge = self.introduce_false_edge,
                static_relaxation = pddl_holder,
                arg_mask = self.arg_mask
            )

            # Generate graph using bfs_state_space
            G_bpg, _, _, _ = self.methods[method_name](
                mimir_stuff=pddl_holder,
                num_edges=self.num_edges[i],
                number_of_input=self.number_inputs,
                introduce_false_edge=self.introduce_false_edge,
                static_relaxation=pddl_holder,
                arg_mask=self.arg_mask
            )

            edge_match = categorical_edge_match('action', set())

            matcher = DiGraphMatcher(G_fg, G_bpg, edge_match=edge_match)

            is_isomorphic = matcher.is_isomorphic()
            self.assertTrue(
                is_isomorphic,
                msg=f"{ut.format_cur_time()}: The generated graphs from {method_name} at index {i} are not isomorphic."
            )
            print(f"{ut.format_cur_time()}: Passed {method_name} test for instance {i}", flush=True)

    def test_bfs_graph_generation(self):
        """Test BFS-based graph generation."""
        self.generate_and_compare_graphs('bfs')

    def test_dfs_graph_generation(self):
        """Test DFS-based graph generation."""
        self.generate_and_compare_graphs('dfs')

    def test_rand_graph_generation(self):
        """Test random-based graph generation."""
        self.generate_and_compare_graphs('rand')

class TestGraphErrorGenerationMethodsSimple(unittest.TestCase):

    def setUp(self):
        # Define paths
        self.domain_path = "pddl_files/blocks_3/blocks_world.pddl"
        self.instance_path = "pddl_files/blocks_3/blocks_world_7.pddl"
        self.domain_path_static = "pddl_files/blocks_3/blocks_world_static_relax.pddl"
        self.instance_path_static = "pddl_files/blocks_3/blocks_world_7_static_relax.pddl"
        self.num_edges = 2000
        # Parameters
        self.number_inputs = 1
        self.introduce_false_edge = True
        self.arg_mask = {
            'load': {2},
            'unload': {1, 2},
            'drive': {1},
            'fly': {1}
        }
        self.methods = {
            'bfs': bfs_state_space,
            'dfs': dfs_state_space,
            'rand': rand_state_space,
        }

    def generate_and_compare_error_graphs(self, method_name):
        self.assertTrue(
            method_name in self.methods,
            msg = f"{ut.format_cur_time()}: Tried to test unimplemented method {method_name}")
        # Load PDDL holders
        pddl_holder = mimir_holder(self.domain_path, self.instance_path)
        static_pddl_holder = mimir_holder(self.domain_path_static, self.instance_path_static)

        # Generate graph using bfs_state_space
        ret = self.methods[method_name](
            mimir_stuff=pddl_holder,
            num_edges=self.num_edges,
            number_of_input=self.number_inputs,
            introduce_false_edge=self.introduce_false_edge,
            static_relaxation=static_pddl_holder,
            arg_mask=self.arg_mask
        )
        self.assertTrue(
            ret is not None,
            msg = f"{ut.format_cur_time()}: Failed to create negative graph with {method_name}"
        )

    def test_bfs_graph_error_generation(self):
        """Test BFS-based error graph generation."""
        self.generate_and_compare_error_graphs('bfs')

    def test_dfs_graph_error_generation(self):
        """Test DFS-based error graph generation."""
        self.generate_and_compare_error_graphs('dfs')

    def test_rand_graph_error_generation(self):
        """Test random-based error graph generation."""
        self.generate_and_compare_error_graphs('rand')

class TestGraphErrorGenerationMethods(unittest.TestCase):

    def setUp(self):
        # Define paths
        self.domain_path = "pddl_files/logistics/logistics.pddl"
        self.instance_path = "pddl_files/logistics/logistics-3-3-2-2-3.pddl"
        self.domain_path_static = "pddl_files/logistics/logistics_static_relax.pddl"
        self.instance_path_static = "pddl_files/logistics/logistics-3-3-2-2-3_static_relax.pddl"
        self.num_edges = 2000
        # Parameters
        self.number_inputs = 1
        self.introduce_false_edge = True
        self.arg_mask = {
            'load': {2},
            'unload': {1, 2},
            'drive': {1},
            'fly': {1}
        }
        self.methods = {
            'bfs': bfs_state_space,
            'dfs': dfs_state_space,
            'rand': rand_state_space,
        }

    def generate_and_compare_error_graphs(self, method_name):
        self.assertTrue(
            method_name in self.methods,
            msg = f"{ut.format_cur_time()}: Tried to test unimplemented method {method_name}")
        # Load PDDL holders
        pddl_holder = mimir_holder(self.domain_path, self.instance_path)
        static_pddl_holder = mimir_holder(self.domain_path_static, self.instance_path_static)

        # Generate graph using bfs_state_space
        ret = self.methods[method_name](
            mimir_stuff=pddl_holder,
            num_edges=self.num_edges,
            number_of_input=self.number_inputs,
            introduce_false_edge=self.introduce_false_edge,
            static_relaxation=static_pddl_holder,
            arg_mask=self.arg_mask
        )
        self.assertTrue(
            ret is not None,
            msg = f"{ut.format_cur_time()}: Failed to create negative graph with {method_name}"
        )

    def test_bfs_graph_error_generation(self):
        """Test BFS-based error graph generation."""
        self.generate_and_compare_error_graphs('bfs')

    def test_dfs_graph_error_generation(self):
        """Test DFS-based error graph generation."""
        self.generate_and_compare_error_graphs('dfs')

    def test_rand_graph_error_generation(self):
        """Test random-based error graph generation."""
        self.generate_and_compare_error_graphs('rand')

if __name__ == '__main__':
    unittest.main()
