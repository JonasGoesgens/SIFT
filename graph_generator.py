import pymimir
import networkx as nx
import random
import math
from py_separator_utils.mimir_holder import mimir_holder

def create_random_initial_state(mimir_stuff: mimir_holder,cur,distance):

    random_number = int(math.pow(2,random.randint(1, math.ceil(math.log2(5 * distance)))))
    for _ in range(random_number):
        applicable_actions = mimir_stuff.get_applicable_actions(cur)
        random_action = random.choice(applicable_actions)
        cur = mimir_stuff.get_successor_state(cur, random_action)
    
    return cur 

# create a partial graph in bfs style
def bfs_state_space(mimir_stuff: mimir_holder, num_edges, number_of_input, introduce_false_edge: bool):

    # get object mapping
    object_mapping = mimir_stuff.get_object_mapping()
    action_mapping, _ = mimir_stuff.get_action_mapping_and_arity()

    # create graph
    G = nx.DiGraph()

    node_atoms_dict = dict()

    # nodes that have be seen
    seen_nodes = set()

    # applicable action generator and successive state generatpr

    successor_dict = {}

    # queue of state to visit, create initial state
    initial_node = mimir_stuff.get_SSG().get_or_create_initial_state()
    if number_of_input != 0:
        initial_node = create_random_initial_state(mimir_stuff,initial_node,num_edges)
    #print("initial state: ", mimir_stuff.print_state(initial_node))
    successor_dict[initial_node.get_id()] = dict() 

    queue = []
    applicable_actions = mimir_stuff.get_applicable_actions(initial_node)
    for app_act in applicable_actions:
        succ_state = mimir_stuff.get_successor_state(initial_node, app_act)
        queue.append(succ_state)
        successor_dict[initial_node.get_id()][succ_state.get_id()] = app_act

    node_and_corrensponding_state = dict()
    node_and_corrensponding_state[initial_node.get_id()] = initial_node

    mapped_action_to_mimir_action = dict()

    # set that contains all possible actions
    all_actions, seen = set(), set()
    
    init_id = initial_node.get_id()
    seen.add(init_id)
    G.add_node(init_id)

    # while the graph is smaller than the threshold, exapan an node
    while len(G.edges) < num_edges and len(queue) > 0:

        # get current state and its applicable actions
        cur_state = queue.pop(0)

        cur_id = cur_state.get_id()
        applicable_actions = mimir_stuff.get_applicable_actions(cur_state)

        successor_dict[cur_id] = dict()

        node_and_corrensponding_state[cur_id] = cur_state

        for app_act in applicable_actions:
            succ_state = mimir_stuff.get_successor_state(cur_state, app_act)
            if succ_state.get_id() not in seen:
                queue.append(succ_state)
                seen.add(succ_state.get_id())
            successor_dict[cur_id][succ_state.get_id()] = app_act

        for node in list(G.nodes()):
            if cur_id in successor_dict[node].keys():
                _act = successor_dict[node][cur_id]
                action_name = _act.get_name()
                action_objects = tuple([object_mapping[_obj.get_name()] for _obj in _act.get_objects()])
                current_action = (action_name, action_objects)
                mapped_action_to_mimir_action[current_action] = _act
                all_actions.add(current_action)
                G.add_edge(node, cur_id, action={current_action})
            if node in successor_dict[cur_id].keys():
                _act = successor_dict[cur_id][node]
                action_name = _act.get_name()
                action_objects = tuple([object_mapping[_obj.get_name()] for _obj in _act.get_objects()])
                current_action = (action_name, action_objects)
                all_actions.add(current_action)
                mapped_action_to_mimir_action[current_action] = _act
                G.add_edge(cur_id, node, action={current_action})

    all_nodes = [i for i in G.nodes()]

    sample = random.sample(all_nodes, k=5)
    for node in sample:
        node_atoms_dict[node] = set()
        state = node_and_corrensponding_state[node]
        atoms = state.get_fluent_atoms()
        atoms = random.sample(atoms, k=int((len(atoms)+1)/2))
        for atom in mimir_stuff.get_parser().get_factories().get_fluent_ground_atoms_from_ids(atoms):
            node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects())))

    if introduce_false_edge:
        negative_action_mapping = random.choice(list(all_actions))
        negative_action = mapped_action_to_mimir_action[negative_action_mapping]

        # QUICK BUGFIX 
        # TODO SEE WHY THIS NOT WORK
        #print('Graph', G.nodes())
        #print('Dict', node_and_corrensponding_state)
        node = None
        random.shuffle(all_nodes)

        new_id = max(all_nodes) + 1

        while len(all_nodes):
            node = all_nodes.pop(0)

            applicable_actions = mimir_stuff.get_applicable_actions(node_and_corrensponding_state[node])
            
            if negative_action in applicable_actions:
                pass
                #print('THE OTHER CASE CAN HAPPEN')
            else:
                break

        G.add_edge(node, new_id, action={negative_action_mapping})

    return G, init_id, node_atoms_dict

# create a rl style trace
def get_trace_rl(mimir_stuff: mimir_holder, number_edges, number_of_input, introduce_false_edge: bool):

    if (introduce_false_edge and (number_edges < 2)):
        return None

    # get object mapping
    object_mapping = mimir_stuff.get_object_mapping()
    action_mapping, _ = mimir_stuff.get_action_mapping_and_arity()

    # create graph
    G = nx.DiGraph()

    node_atoms_dict = dict()

    # applicable action generator and successive state generatpr

    # create initial state
    next_state = mimir_stuff.get_SSG().get_or_create_initial_state()
    if number_of_input != 0:
        next_state = create_random_initial_state(mimir_stuff,next_state,number_edges)
    #print("initial state: ", mimir_stuff.print_state(next_state))

    node_and_corrensponding_state = dict()
    node_and_corrensponding_state[0] = next_state

    mapped_action_to_mimir_action = dict()

    next_state_index = 0
    cur_node_index = None
    cur_number_nodes = 1

    init_id = next_state_index

    all_actions = set()

    # while the graph is smaller than the threshold, exapan an node
    while cur_number_nodes - 1 <= number_edges:

        # get current node and its index
        cur_node_index = next_state_index
        cur_state = next_state        

        # get current state and its applicable actions 
        applicable_actions = mimir_stuff.get_applicable_actions(cur_state)

        applied_action = random.choice(applicable_actions)

        for _act in applicable_actions:
            # get succeor state for applicable action
            succ_state = mimir_stuff.get_successor_state(cur_state, _act)

            action_name = _act.get_name()
            action_objects = tuple([object_mapping[_obj.get_name()] for _obj in _act.get_objects()])
            current_action = (action_name, action_objects)

            mapped_action_to_mimir_action[current_action] = _act

            all_actions.add(current_action)

            if _act == applied_action:
                next_state = succ_state
                next_state_index = cur_number_nodes

            # add edge to the graph
            G.add_edge(cur_node_index, cur_number_nodes, action={current_action})

            node_and_corrensponding_state[cur_number_nodes] = succ_state

            cur_number_nodes += 1

    all_nodes = [i for i in range(cur_number_nodes)]

    sample = random.sample(all_nodes, k=5)
    for node in sample:
        node_atoms_dict[node] = set()
        state = node_and_corrensponding_state[node]
        atoms = state.get_fluent_atoms()
        atoms = random.sample(atoms, k=int((len(atoms)+1)/2))
        for atom in mimir_stuff.get_parser().get_factories().get_fluent_ground_atoms_from_ids(atoms):
            node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects())))

    if introduce_false_edge:
        negative_action_mapped = random.choice(list(all_actions))
        negative_action = mapped_action_to_mimir_action[negative_action_mapped]

        node = None
        random.shuffle(all_nodes)

        while len(all_nodes):
            node = all_nodes.pop(0)

            applicable_actions = mimir_stuff.get_applicable_actions(node_and_corrensponding_state[node])
            
            if not negative_action in applicable_actions:
                break
            else:
                pass
                #print('THE OTHER CASE IS POSSIBLE')

        G.add_edge(node, cur_number_nodes, action={negative_action_mapped})

    return G, init_id, node_atoms_dict

# create a simple trace in random style
def get_trace_simple(mimir_stuff: mimir_holder, length, number_of_input, introduce_false_edge: bool):

    if (introduce_false_edge and (length < 2)):
        return None

    # get object mapping
    object_mapping = mimir_stuff.get_object_mapping()
    action_mapping, _ = mimir_stuff.get_action_mapping_and_arity()

    # create graph
    G = nx.DiGraph()

    node_atoms_dict = dict()

    # applicable action generator and successive state generatpr
 
    # create initial state
    next_state = mimir_stuff.get_SSG().get_or_create_initial_state()
    if number_of_input != 0:
        next_state = create_random_initial_state(mimir_stuff,next_state,length)
    #print("initial state: ", mimir_stuff.print_state(next_state))

    next_state_index = 1

    init_id = next_state_index - 1

    all_actions = set()

    mapped_action_to_mimir_action = dict()

    node_and_corrensponding_state = dict()
    node_and_corrensponding_state[0] = next_state

    # while the graph is smaller than the threshold, exapan an node
    for _ in range(length):

        # get current node and its index
        cur_node_index = next_state_index
        cur_state = next_state        

        # get current state and its applicable actions 
        applicable_actions = mimir_stuff.get_applicable_actions(cur_state)

        applied_action = random.choice(applicable_actions)

        succ_state = mimir_stuff.get_successor_state(cur_state, applied_action)
        
        node_and_corrensponding_state[next_state_index] = succ_state 

        action_name = applied_action.get_name()
        action_objects = tuple([object_mapping[_obj.get_name()] for _obj in applied_action.get_objects()])
        current_action = (action_name, action_objects)

        mapped_action_to_mimir_action[current_action] = applied_action

        all_actions.add(current_action)

        next_state = succ_state

        # add edge to the graph
        G.add_edge(next_state_index-1, next_state_index, action={current_action})
            
        next_state_index += 1
    
    all_nodes = [i for i in range(next_state_index)]
    all_atoms = set()
    for node in all_nodes:
        state = node_and_corrensponding_state[node]
        atoms = state.get_fluent_atoms()
        all_atoms.update(atoms)

    print(all_atoms)

    sample = random.sample(all_nodes, k=int((len(all_nodes))))
    for node in sample:
        node_atoms_dict[node] = set()
        state = node_and_corrensponding_state[node]
        atoms = state.get_fluent_atoms()
        atoms = random.sample(atoms, k=int((len(atoms))))
        for atom in mimir_stuff.get_parser().get_factories().get_fluent_ground_atoms_from_ids(atoms):
            node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects())))

    if introduce_false_edge:
        negative_action_mapped = random.choice(list(all_actions))
        negative_action = mapped_action_to_mimir_action[negative_action_mapped]

        random.shuffle(all_nodes)

        node = None
        while len(all_nodes):
            node = all_nodes.pop(0)

            applicable_actions = mimir_stuff.get_applicable_actions(node_and_corrensponding_state[node])
            
            if not negative_action in applicable_actions:
                break
            else:
                pass
                #print('THE OTHER CASE CAN HAPPEN')

        G.add_edge(node, next_state_index, action={negative_action_mapped})

    return G, init_id, node_atoms_dict

# for a state space create the corresponding graph as directed nx graph 
# label: 'action': *grounded action*
def get_nx_graph_from_state_space(mimir_stuff: mimir_holder, introduce_false_edge: bool) -> nx.DiGraph:

    # get object mapping
    object_mapping = mimir_stuff.get_object_mapping()
    action_mapping, _ = mimir_stuff.get_action_mapping_and_arity()
    # get state space, expensive!
    state_space = mimir_stuff.get_complete_statespace()

    # set that contains all actions
    all_possible_actions = set()

    # create graph
    G = nx.DiGraph()

    node_atoms_dict = dict()

    # get state indices 
    states = {state_space.get_state_index(state) : state for state in state_space.get_states()}

    # add all states to the graph 
    G.add_nodes_from(states.keys())

    init_id = mimir_stuff.get_SSG().get_or_create_initial_state().get_id()

    # for each transition create a edge in the graph which is labeled with the corresponding grounded action
    for state in states.keys():
        for trans in state_space.get_forward_transitions(state):
            action_name = trans.get_creating_action().get_name()
            action_objects = tuple([object_mapping[_obj.get_name()] for _obj in trans.get_creating_action().get_objects()])
            current_action = (action_name, action_objects)
            if G.has_edge(trans.get_source_state(), trans.get_target_state()):
                G.edges[(trans.get_source_state(), trans.get_target_state())]['action'].add(current_action)
            else:
                G.add_edge(trans.get_source_state(), trans.get_target_state(), action={current_action})
            all_possible_actions.add(current_action)

    all_nodes = [i for i in G.nodes()]
    all_atoms = set()
    for node in all_nodes:
        state = states[node]
        atoms = state.get_fluent_atoms()
        all_atoms.update(atoms)

    #print(all_atoms)

    sample = random.sample(all_nodes, k=int((len(all_nodes)+4)/5))
    for node in sample:
        node_atoms_dict[node] = set()
        state = states[node]
        atoms = state.get_fluent_atoms()
        neg_atoms = list(all_atoms.difference(atoms))
        atoms = random.sample(atoms, k=int((len(atoms)+1)/2))
        neg_atoms = random.sample(neg_atoms, k=int((len(neg_atoms)+1)/2))
        for atom in state_space.get_pddl_factories().get_fluent_ground_atoms_from_ids(atoms):
            node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects()), True))
        for atom in state_space.get_pddl_factories().get_fluent_ground_atoms_from_ids(neg_atoms):
            node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects()), False))

    if introduce_false_edge:
        random.shuffle(all_nodes)
        while len(all_nodes):
            # get random node
            manipulated_node = all_nodes.pop(0)

            manipulated_node_actions = set()

            # get all its outgoing edges
            for edge in G.out_edges(manipulated_node, data='action'):
                for _act in edge[2]:
                    manipulated_node_actions.add(_act)

            # get edges that are not outgoing
            possible_negative_actions = all_possible_actions - manipulated_node_actions

            if len(possible_negative_actions) > 0:
                break

        # get random nodes that the edge leads to
        negative_action = random.choice(list(possible_negative_actions))
        
        # add edge to the graph
        node_dict = dict(nx.bfs_successors(G, manipulated_node, 3))
        
        node_set = set()
        for _, _nodes in node_dict.items():
            for _node in _nodes:
                node_set.add(_node)

        reached_node = random.choice(list(node_set))

        if G.has_edge(manipulated_node, reached_node):
            G.edges[(manipulated_node, reached_node)]['action'].add(negative_action)
        else:
            G.add_edge(manipulated_node, reached_node, action={negative_action})

    # return created graph
    return G, init_id, node_atoms_dict

