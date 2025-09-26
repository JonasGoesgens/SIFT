import json
import networkx as nx

class JSON_Parser:
    def __init__(self):
        self.data = None
        self.object_mappings = dict()
        self.inverse_object_mappings = dict()

    def load_json_file(self, file_path):
        with open(file_path, 'r') as file:
            self.data = json.load(file)

    def store_json_file(self, file_path):
        if self.data:
            with open(file_path, 'w') as file:
                json.dump(self.data, file, indent=2)

    def get_graphs(self) -> dict:
        graphs = dict()
        for instance_data in self.data.get('instances', list()):
            instance_id = instance_data['instance_id']
            object_mapping = instance_data['objects']
            inverse_object_mapping = {
                value : key
                for key, value in object_mapping.items()
            }
            init = instance_data['initial_state']
            graph = nx.DiGraph()
            for state in instance_data['states']:
                graph.add_node(state['id'])
            for transition in instance_data['transitions']:
                in_state = transition['in_state']
                out_state = transition['out_state']
                edge_label = set()
                for ground_action in transition['ground_actions']:
                    action_name = ground_action['name']
                    args = tuple(
                        object_mapping[arg]
                        for arg in ground_action['args']
                    )
                    edge_label.add((action_name,args))
                edge_data = dict()
                edge_data['action'] = edge_label
                graph.add_edge(in_state, out_state, **edge_data)
            graphs[instance_id] = (init, graph)
            self.object_mappings[instance_id] = object_mapping
            self.inverse_object_mappings[instance_id] = inverse_object_mapping
        return graphs

    def update_graphs(self, graphs : dict):
        for instance_data in self.data.get('instances', list()):
            instance_id = instance_data['instance_id']

            if instance_id not in graphs:
                continue

            init_state, graph = graphs[instance_id]

            for transition in instance_data.get('transitions', list()):
                in_state = transition['in_state']
                out_state = transition['out_state']

                if graph.has_edge(in_state, out_state):
                    edge_data = graph[in_state][out_state]
                    edge_label = edge_data['action']

                    ground_actions = list()
                    for action_name, args in edge_label:
                        ground_actions.append({
                            'name': action_name,
                            'args': [
                                self.inverse_object_mappings[instance_id][arg]
                                for arg in args
                            ]
                        })

                    transition['ground_actions'] = ground_actions

