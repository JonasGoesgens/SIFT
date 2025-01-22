from py_separator_utils.sift import SIFT
import py_separator_utils.py_types as pt
import os
import argparse
from pathlib import Path
import networkx as nx
from py_separator_utils.mimir_holder import mimir_holder
from graph_generator import get_trace_rl, get_trace_simple
from graph_generator import bfs_state_space, get_nx_graph_from_state_space


def get_arguments(): 
    parser = argparse.ArgumentParser('graph_generator.py')  
    parser.add_argument("-d", "--domain", type=Path, required=True, help="specify domain that is in the pddl_files folder.")
    parser.add_argument("-i", "--instance", type=Path, nargs='+', required=True, help="specify list of instances that is in the pddl_files folder.")
    parser.add_argument("-v", "--verification_instance", type=str, action='append', required=False, help="specify list of instances that is in the pddl_files folder.")
    parser.add_argument("-p", "--processes", type=int, required=True, help="number of max. parallel processes, 1 means sequential algorihtm")
    parser.add_argument("-o", "--output", type=str, required=False, help='name of output file')
    parser.add_argument("-lm", "--learning_mode", type=str, required=False, default='fg', 
                        help='Defines the input to the learinig alg. \n fg = full graphs (default)\n pg = partial graphs\n st= simple traces\n rl= rl style traces')
    # parser.add_argument("-vm", "--verification_mode", type=str, required=False, default='fg', 
    #                     help='Defines the input to the learinig alg. \n fg = full graphs (default)\n pg = partial graphs\n st= simple traces\n rl= rl style traces')
    parser.add_argument("-ls", "--learning_size", type=int, required=False, help="size of the input if mode is not fg")
    # parser.add_argument("-vs", "--verification_size", type=int, required=False, help="size of the input if mode is not fg")
    parser.add_argument("-ln", "--learning_number_inputs", type=int, required=False, default=1, help="number of sampled inputs if mode is not fg")
    # parser.add_argument("-vn", "--verification_number_inputs", type=int, required=False, default=1, help="number of sampled inputs if mode is not fg")
    # parser.add_argument("-vt", "--verification_termination", action=argparse.BooleanOptionalAction, required=False, help="If set the verification stops at the first wrong predicate.")

    # parse arguments
    args = parser.parse_args()
    return args

if __name__ == '__main__':
    # get domain and instance 
    args = get_arguments()
    
    # create domain paths 
    domain_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), args.domain)
    
    instance_list = list()

    #print(args.instance)

    for instance in args.instance:

        # create problem path
        problem_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), instance)

        # create state space and parser
        pddl_holder = mimir_holder(domain_path, problem_path)

        # get state space as nx graph, edges are labeled with 'action' where this is the action that corresponds to the transition

        mode = args.learning_mode
        number_inputs = args.learning_number_inputs
        number_edges = args.learning_size

        for num_input in range(number_inputs):
            if mode == 'fg':
                G, init = get_nx_graph_from_state_space(pddl_holder, False)
            elif mode == 'pg':
                G, init = bfs_state_space(pddl_holder, number_edges, num_input, False)
            elif mode == 'rl':
                G, init = get_trace_rl(pddl_holder, number_edges, num_input, False)
            elif mode == 'st':
                G, init = get_trace_simple(pddl_holder, number_edges, num_input, False)
            else:
                #return None
                continue

            instance_list.append((G,init))

            if mode == 'fg':
                break

        act_map, _ = pddl_holder.get_action_mapping_and_arity()
        print(act_map)
    
    #print(instance_list)

    sift = SIFT(instance_list, args.processes)
    features = sift.run()
    print(sift.LOCM_types)
    feature_typecombinaton_pairs = [(feature, feature.get_type_combination()) for feature in features]
    for i, (feature, _) in enumerate(
        sorted(feature_typecombinaton_pairs, key=lambda pair: pair[1])
    ):
        if feature.has_unique_colouring():
            print(f"Feature {i+1}:")
            print(feature)