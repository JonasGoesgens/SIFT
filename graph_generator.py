import pymimir
import networkx as nx
import random
import math
import sys
import traceback
from py_separator_utils.mimir_holder import mimir_holder
import py_separator_utils.utils as ut

def create_random_initial_state(
    mimir_stuff: mimir_holder,
    cur,
    distance
):
    #As also the instance is relaxed it is better to bisimulate with the original fully unknown init
    random_number = int(math.pow(2,random.randint(1, math.ceil(math.log2(5 * distance)))))
    for _ in range(random_number):
        applicable_actions = mimir_stuff.get_applicable_actions(cur)
        random_action = random.choice(applicable_actions)
        action_name = random_action.get_name()
        action_objects = tuple(_obj.get_name() for _obj in random_action.get_objects())

        cur = mimir_stuff.get_successor_state(cur, random_action)

    return cur

def select_expansion_bfs(queue : list):
    return queue.pop(0)

def select_expansion_dfs(queue : list):
    return queue.pop(-1)

def select_expansion_rand(queue : list):
    index = random.randint(0, len(queue) - 1)
    return queue.pop(index)

# create a partial graph in dfs style
def dfs_state_space(
    mimir_stuff: mimir_holder,
    num_edges,
    number_of_input,
    introduce_false_edge: bool,
    static_relaxation: mimir_holder,
    arg_mask : dict = dict()
):

    return expand_state_space(
    mimir_stuff,
    num_edges, number_of_input,
    introduce_false_edge,
    static_relaxation,
    arg_mask,
    select_expansion_dfs)

# create a partial graph in random balanced style
def rand_state_space(
    mimir_stuff: mimir_holder,
    num_edges,
    number_of_input,
    introduce_false_edge: bool,
    static_relaxation: mimir_holder,
    arg_mask : dict = dict()
):

    return expand_state_space(
    mimir_stuff,
    num_edges, number_of_input,
    introduce_false_edge,
    static_relaxation,
    arg_mask,
    select_expansion_rand)

# create a partial graph in bfs style
def bfs_state_space(
    mimir_stuff: mimir_holder,
    num_edges, number_of_input,
    introduce_false_edge: bool,
    static_relaxation: mimir_holder,
    arg_mask : dict = dict()):

    return expand_state_space(
    mimir_stuff,
    num_edges, number_of_input,
    introduce_false_edge,
    static_relaxation,
    arg_mask,
    select_expansion_bfs)

# bisimulate a state space with the static relaxed domain&instance to introduce an error
def bisimulate_and_add_error(
    G, init_id, object_mapping : dict,
    chooseable_actions : set,
    static_relaxation : mimir_holder,
    arg_mask : dict = dict(),
):
    def map_applicable_actions(state_static, static_state_id):
        successor_static_dict[static_state_id] = dict()
        state_action_static_successor_dict[static_state_id] = dict()
        applicable_actions = static_relaxation.get_applicable_actions(state_static)
        for app_act in applicable_actions:
            action_name = app_act.get_name()
            action_objects = tuple([object_mapping[_obj.get_name()] for _obj in app_act.get_objects()])
            current_action = (action_name, action_objects)

            mapped_action_static_to_mimir_action[current_action] = app_act
            succ_state = static_relaxation.get_successor_state(state_static, app_act)
            succ_state_id = succ_state.get_id()

            successor_static_dict[static_state_id][succ_state_id] = app_act
            state_action_static_successor_dict[static_state_id][current_action] = succ_state_id

            id_static_to_state_static_dict[succ_state_id] = succ_state

    try:
        all_nodes = [i for i in G.nodes()]
        initial_node_static = static_relaxation.get_SSG().get_or_create_initial_state()
        id_to_static_id_dict = dict()
        id_to_static_id_dict[init_id] = initial_node_static.get_id()
        id_static_to_state_static_dict = dict()
        id_static_to_state_static_dict[initial_node_static.get_id()] = initial_node_static

        successor_static_dict = dict()
        successor_static_dict[initial_node_static.get_id()] = dict()

        state_action_static_successor_dict = dict()
        state_action_static_successor_dict[initial_node_static.get_id()] = dict()
        mapped_action_static_to_mimir_action = dict()

        #BFS Backwards search from init_id to create open edges list while staying in sc component.
        edge_list = set()
        nodes_list = {init_id}
        nodes_visited_list = set()
        while nodes_list.difference(nodes_visited_list):
            node = next(iter(nodes_list.difference(nodes_visited_list)))
            nodes_visited_list.add(node)
            for other, _, labels in G.in_edges([node],data='action'):
                nodes_list.add(other)
                for label in labels:
                    edge_list.add((other,node,label))

        #Walk all edges in a single path to update the state of init_id
        node = init_id
        static_state_id = id_to_static_id_dict[node]
        edges_visited_list = set()
        while edge_list.difference(edges_visited_list):
            edge_open_list = edge_list.difference(edges_visited_list)

            #Fill static state information for current options
            state_static = id_static_to_state_static_dict[static_state_id]
            map_applicable_actions(state_static, static_state_id)

            #Try to greedy pick an outgoing open edge
            action_pick = None
            for _, other, labels in G.out_edges([node],data='action'):
                if action_pick is not None:
                    break
                for label in labels:
                    candidate = (node, other, label)
                    if candidate in edge_open_list:
                        action_pick = candidate
                        break

            if action_pick is not None:
                (_, other, label) = action_pick
                node = other
                static_state_id = state_action_static_successor_dict[static_state_id][label]
                edges_visited_list.add(action_pick)
                continue

            #Otherwise find closest connection to one
            #build target set and aquire target
            #target set will always be filled as the loop would have been terminated otherwise
            target_set = {n for (n, _, _) in edge_open_list}
            lengths = nx.single_source_shortest_path_length(G, node)
            #target = argmin(lenghts(target) where target in targetset)
            #target = min((t for t in target_set if t in lengths), key=lengths.get)
            #every target should be reachable as we are in a strongly connected component
            target = min((t for t in target_set), key=lengths.get)
            #target should not be None as otherwise the loop should have terminated
            path = nx.shortest_path(G, node, target)
            for next_node in path[1:]:
                #pick some action and get its name
                label = next(iter(G.get_edge_data(node, next_node).get('action')))

                #Fill static state information for current options
                state_static = id_static_to_state_static_dict[static_state_id]
                map_applicable_actions(state_static, static_state_id)

                #Go to next node
                static_state_id = state_action_static_successor_dict[static_state_id][label]
                node = next_node
            #Now we are again in a node were greedy works.

        #Complete the Path back to init_id
        if node != init_id:
            path = nx.shortest_path(G, node, init_id)
            for next_node in path[1:]:
                #pick some action and get its name
                label = next(iter(G.get_edge_data(node, next_node).get('action')))

                #Fill static state information for current options
                state_static = id_static_to_state_static_dict[static_state_id]
                map_applicable_actions(state_static, static_state_id)

                #Go to next node
                static_state_id = state_action_static_successor_dict[static_state_id][label]
                node = next_node

        #Broadcast state information to all reachable states
        id_to_static_id_dict[node] = static_state_id
        nodes_list = {node}
        nodes_visited_list = set()
        while nodes_list.difference(nodes_visited_list):
            node = next(iter(nodes_list.difference(nodes_visited_list)))
            static_state_id = id_to_static_id_dict[node]
            state_static = id_static_to_state_static_dict[static_state_id]
            nodes_visited_list.add(node)
            map_applicable_actions(state_static, static_state_id)

            for _, other, labels in G.out_edges([node],data='action'):
                nodes_list.add(other)
                #any action for a to b suffices now
                label = next(iter(labels))
                succ_state_id = state_action_static_successor_dict[static_state_id][label]
                id_to_static_id_dict[other] = succ_state_id

        #Introduce the error
        selected_node = None
        target_node = None
        candidate_actions = list(chooseable_actions)
        random.shuffle(candidate_actions)
        while selected_node is None and len(candidate_actions):
            negative_action_mapping = candidate_actions.pop(0)

            exclusion_set = {negative_action_mapping}
            for (action_name, action_objects) in mapped_action_static_to_mimir_action.keys():
                if negative_action_mapping[0] != action_name:
                    continue
                if any(
                    arg1 != arg2 and pos not in arg_mask.get(action_name, set())
                    for pos,(arg1,arg2) in enumerate(zip(negative_action_mapping[1],action_objects))
                ):
                    continue
                exclusion_set.add((action_name, action_objects))

            node = None
            nodes_to_try = all_nodes.copy()
            random.shuffle(nodes_to_try)

            while len(nodes_to_try):
                node = nodes_to_try.pop(0)

                applicable_actions = static_relaxation.get_applicable_actions(
                    id_static_to_state_static_dict[id_to_static_id_dict[node]]
                )

                if any(mapped_action_static_to_mimir_action[
                        (action_name, action_objects)
                    ] in applicable_actions
                    for (action_name, action_objects) in exclusion_set
                ):
                    continue
                else:
                    selected_node = node
                    break

        if selected_node is None:
            sys.stderr.write(f"{ut.format_cur_time()}: Verification input generation failed to generate negative action.\n")
            return None
        else:
            #print(selected_node, negative_action_mapping, mimir_stuff.print_state(node_and_corrensponding_state[selected_node]))
            if target_node is None:
                # A precondition is violated no need to connect two graph nodes.
                # Create a new target node.
                target_node = max(all_nodes) + 1
                # Else an effect or inertia is violated.
                # Target node has to be specified.
            G.add_edge(selected_node, target_node, action={negative_action_mapping})
        return G

    except Exception as e:
        sys.stderr.write(f"{ut.format_cur_time()}: Exception {e} happened during error addition.\n")
        sys.stderr.write(traceback.format_exc())
        return None

# create a partial graph in expand_func style
def expand_state_space(
    mimir_stuff: mimir_holder,
    num_edges, number_of_input,
    introduce_false_edge: bool,
    static_relaxation: mimir_holder,
    arg_mask : dict = dict(),
    queue_expand_func = None):

    try:
        if queue_expand_func is None:
            queue_expand_func = select_expansion_bfs

        # get object mapping
        # object mapping also valid for static relaxation as Instance is identical
        object_mapping = mimir_stuff.get_object_mapping()
        action_mapping, _ = mimir_stuff.get_action_mapping_and_arity()

        # create graph
        G = nx.DiGraph()

        node_atoms_dict = dict()
        # nodes that have be seen
        seen_nodes = set()

        # applicable action generator and successive state generator
        successor_dict = dict()

        # queue of state to visit, create initial state
        initial_node = mimir_stuff.get_SSG().get_or_create_initial_state()
        initial_node_static = static_relaxation.get_SSG().get_or_create_initial_state()
        if number_of_input != 0:
            initial_node = create_random_initial_state(
                mimir_stuff,
                initial_node,
                num_edges
            )
        #print("initial state: ", mimir_stuff.print_state(initial_node))

        queue = list()
        successor_dict[initial_node.get_id()] = dict()
        mapped_action_to_mimir_action = dict()
        applicable_actions = mimir_stuff.get_applicable_actions(initial_node)
        for app_act in applicable_actions:
            action_name = app_act.get_name()
            action_objects = tuple([object_mapping[_obj.get_name()] for _obj in app_act.get_objects()])
            current_action = (action_name, action_objects)
            mapped_action_to_mimir_action[current_action] = app_act
            succ_state = mimir_stuff.get_successor_state(initial_node, app_act)
            queue.append(succ_state)
            successor_dict[initial_node.get_id()][succ_state.get_id()] = app_act

        node_and_corrensponding_state = dict()
        node_and_corrensponding_state[initial_node.get_id()] = initial_node

        # set that contains all possible actions
        all_actions, seen = set(), set()

        init_id = initial_node.get_id()
        seen.add(init_id)
        G.add_node(init_id)

        # while the graph is smaller than the threshold, exapan an node
        while len(G.edges) < num_edges and len(queue) > 0:

            # get current state and its applicable actions
            cur_state = queue_expand_func(queue)

            cur_id = cur_state.get_id()

            successor_dict[cur_id] = dict()

            node_and_corrensponding_state[cur_id] = cur_state

            applicable_actions = mimir_stuff.get_applicable_actions(cur_state)
            for app_act in applicable_actions:
                succ_state = mimir_stuff.get_successor_state(cur_state, app_act)
                if succ_state.get_id() not in seen:
                    queue.append(succ_state)
                    seen.add(succ_state.get_id())
                successor_dict[cur_id][succ_state.get_id()] = app_act
                action_name = app_act.get_name()
                action_objects = tuple([object_mapping[_obj.get_name()] for _obj in app_act.get_objects()])
                current_action = (action_name, action_objects)

            for node in list(G.nodes()):
                #incomming edges
                if cur_id in successor_dict[node].keys():
                    _act = successor_dict[node][cur_id]
                    action_name = _act.get_name()
                    action_objects = tuple([object_mapping[_obj.get_name()] for _obj in _act.get_objects()])
                    current_action = (action_name, action_objects)
                    mapped_action_to_mimir_action[current_action] = _act
                    all_actions.add(current_action)
                    G.add_edge(node, cur_id, action={current_action})
                #outgoing edges
                if node in successor_dict[cur_id].keys():
                    _act = successor_dict[cur_id][node]
                    action_name = _act.get_name()
                    action_objects = tuple([object_mapping[_obj.get_name()] for _obj in _act.get_objects()])
                    current_action = (action_name, action_objects)
                    all_actions.add(current_action)
                    mapped_action_to_mimir_action[current_action] = _act
                    G.add_edge(cur_id, node, action={current_action})

        all_nodes = [i for i in G.nodes()]
        all_atoms = set()
        for node in all_nodes:
            state = node_and_corrensponding_state[node]
            atoms = state.get_fluent_atoms()
            all_atoms.update(atoms)

        sample = random.sample(all_nodes, k=min(10, len(all_nodes)))
        for node in sample:
            node_atoms_dict[node] = set()
            state = node_and_corrensponding_state[node]
            atoms = state.get_fluent_atoms()
            neg_atoms = list(all_atoms.difference(atoms))
            atoms = random.sample(atoms, k=int((len(atoms)+1)/2))
            neg_atoms = random.sample(neg_atoms, k=int((len(neg_atoms)+1)/2))
            for atom in mimir_stuff.get_parser().get_factories().get_fluent_ground_atoms_from_ids(atoms):
                node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects()), True))
            for atom in mimir_stuff.get_parser().get_factories().get_fluent_ground_atoms_from_ids(neg_atoms):
                node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects()), False))

        if introduce_false_edge:
            G = bisimulate_and_add_error(
                G, init_id, object_mapping, all_actions,
                static_relaxation,
                arg_mask
            )

        if G is None:
            return None

        return G, init_id, node_atoms_dict, mimir_stuff.get_inverse_object_mapping()

    except Exception as e:
        sys.stderr.write(f"{ut.format_cur_time()}: Exception {e} happened during graph creation.\n")
        sys.stderr.write(traceback.format_exc())
        return None

# create a partial graph in dfs style
def dfs_lookahead_state_space(
    mimir_stuff: mimir_holder,
    num_edges,
    number_of_input,
    introduce_false_edge: bool,
    static_relaxation: mimir_holder,
    arg_mask : dict = dict()
):

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
    initial_node_static = static_relaxation.get_SSG().get_or_create_initial_state()
    if number_of_input != 0:
        initial_node = create_random_initial_state(
            mimir_stuff,
            initial_node,
            num_edges
        )
    #print("initial state: ", mimir_stuff.print_state(initial_node))
    successor_dict[initial_node.get_id()] = dict()

    queue = []
    new_path_options = []
    applicable_actions = mimir_stuff.get_applicable_actions(initial_node)
    for app_act in applicable_actions:
        succ_state = mimir_stuff.get_successor_state(initial_node, app_act)
        new_path_options.append(succ_state)
        successor_dict[initial_node.get_id()][succ_state.get_id()] = app_act
        node_and_corrensponding_state[succ_state.get_id()] = succ_state

    queue.expand(new_path_options)


    node_and_corrensponding_state = dict()
    node_and_corrensponding_state[initial_node.get_id()] = initial_node

    mapped_action_to_mimir_action = dict()

    # set that contains all possible actions
    all_actions, seen, seen_path = set(), set(), set()

    init_id = initial_node.get_id()
    seen.add(init_id)
    seen_path.add(init_id)
    G.add_node(init_id)

    # while the graph is smaller than the threshold, exapan an node
    while len(G.edges) < num_edges and len(new_path_options):

        # get current state and its applicable actions
        cur_options = list(set(state.get_id() for state in new_path_options).difference(seen_path))
        if len(cur_options) == 0:
            cur_options = list(state.get_id() for state in new_path_options)
        next_path_state = node_and_corrensponding_state[random.choice(cur_options)]

        cur_id = next_path_state.get_id()
        seen_path.add(cur_id)
        applicable_actions = mimir_stuff.get_applicable_actions(next_path_state)

        successor_dict[cur_id] = dict()

        node_and_corrensponding_state[cur_id] = next_path_state

        new_path_options = []
        for app_act in applicable_actions:
            succ_state = mimir_stuff.get_successor_state(next_path_state, app_act)
            new_path_options.append(succ_state)
            successor_dict[cur_id][succ_state.get_id()] = app_act
            node_and_corrensponding_state[succ_state.get_id()] = succ_state
        queue.expand(new_path_options)

        while len(queue):
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
    all_atoms = set()
    for node in all_nodes:
        state = node_and_corrensponding_state[node]
        atoms = state.get_fluent_atoms()
        all_atoms.update(atoms)

    sample = random.sample(all_nodes, k=min(10, len(all_nodes)))
    for node in sample:
        node_atoms_dict[node] = set()
        state = node_and_corrensponding_state[node]
        atoms = state.get_fluent_atoms()
        neg_atoms = list(all_atoms.difference(atoms))
        atoms = random.sample(atoms, k=int((len(atoms)+1)/2))
        neg_atoms = random.sample(neg_atoms, k=int((len(neg_atoms)+1)/2))
        for atom in mimir_stuff.get_parser().get_factories().get_fluent_ground_atoms_from_ids(atoms):
            node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects()), True))
        for atom in mimir_stuff.get_parser().get_factories().get_fluent_ground_atoms_from_ids(neg_atoms):
            node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects()), False))

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

    return G, init_id, node_atoms_dict, mimir_stuff.get_inverse_object_mapping()

# create a rl style trace
def get_trace_rl(
    mimir_stuff: mimir_holder,
    number_edges,
    number_of_input,
    introduce_false_edge: bool,
    static_relaxation: mimir_holder,
    arg_mask : dict = dict()
):

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
    initial_node_static = static_relaxation.get_SSG().get_or_create_initial_state()
    if number_of_input != 0:
        next_state = create_random_initial_state(
            mimir_stuff,
            next_state,
            number_edges
        )
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
    all_atoms = set()
    for node in all_nodes:
        state = node_and_corrensponding_state[node]
        atoms = state.get_fluent_atoms()
        all_atoms.update(atoms)

    sample = random.sample(all_nodes, k=min(10, len(all_nodes)))
    for node in sample:
        node_atoms_dict[node] = set()
        state = node_and_corrensponding_state[node]
        atoms = state.get_fluent_atoms()
        neg_atoms = list(all_atoms.difference(atoms))
        atoms = random.sample(atoms, k=int((len(atoms)+1)/2))
        neg_atoms = random.sample(neg_atoms, k=int((len(neg_atoms)+1)/2))
        for atom in mimir_stuff.get_parser().get_factories().get_fluent_ground_atoms_from_ids(atoms):
            node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects()), True))
        for atom in mimir_stuff.get_parser().get_factories().get_fluent_ground_atoms_from_ids(neg_atoms):
            node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects()), False))

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

    return G, init_id, node_atoms_dict, mimir_stuff.get_inverse_object_mapping()

# create a simple trace in random style
def get_trace_simple(
    mimir_stuff: mimir_holder,
    length,
    number_of_input,
    introduce_false_edge: bool,
    static_relaxation: mimir_holder,
    arg_mask : dict = dict()
):

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
    initial_node_static = static_relaxation.get_SSG().get_or_create_initial_state()
    if number_of_input != 0:
        next_state = create_random_initial_state(
            mimir_stuff,
            next_state,
            length
        )
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

    #print(all_atoms)

    sample = random.sample(all_nodes, k=min(10, len(all_nodes)))
    for node in sample:
        node_atoms_dict[node] = set()
        state = node_and_corrensponding_state[node]
        atoms = state.get_fluent_atoms()
        neg_atoms = list(all_atoms.difference(atoms))
        atoms = random.sample(atoms, k=int((len(atoms)+1)/2))
        neg_atoms = random.sample(neg_atoms, k=int((len(neg_atoms)+1)/2))
        for atom in mimir_stuff.get_parser().get_factories().get_fluent_ground_atoms_from_ids(atoms):
            node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects()), True))
        for atom in mimir_stuff.get_parser().get_factories().get_fluent_ground_atoms_from_ids(neg_atoms):
            node_atoms_dict[node].add((atom.get_predicate().get_name(), tuple(object_mapping[obj.get_name()] for obj in atom.get_objects()), False))

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

    return G, init_id, node_atoms_dict, mimir_stuff.get_inverse_object_mapping()

# for a state space create the corresponding graph as directed nx graph 
# label: 'action': *grounded action*
def get_nx_graph_from_state_space(
    mimir_stuff: mimir_holder,
    introduce_false_edge: bool,
    static_relaxation: mimir_holder,
    arg_mask : dict = dict()
) -> (nx.DiGraph, int, dict, dict):

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

    sample = random.sample(all_nodes, k=min(10, len(all_nodes)))
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
    return G, init_id, node_atoms_dict, mimir_stuff.get_inverse_object_mapping()

