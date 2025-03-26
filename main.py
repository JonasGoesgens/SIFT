from py_separator_utils.sift import SIFT
from py_separator_utils.feature import Feature
import py_separator_utils.py_types as pt
import os
import argparse
import typing
import copy
from pathlib import Path
import networkx as nx
from py_separator_utils.mimir_holder import mimir_holder
from graph_generator import get_trace_rl, get_trace_simple
from graph_generator import bfs_state_space, get_nx_graph_from_state_space
from concurrent.futures import ProcessPoolExecutor


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

def create_graphs_from_input(
    domain_path : str,
    problem_path : str,
    mode : str,
    number_edges : int,
    number_inputs : int,
    introduce_false_edge : bool = False
) -> list[tuple[nx.DiGraph, int]]:
    # create state space and parser
    pddl_holder = mimir_holder(domain_path, problem_path)
    instance_list = list()

    for num_input in range(number_inputs):
        if mode == 'fg':
            G, init = get_nx_graph_from_state_space(pddl_holder, introduce_false_edge)
        elif mode == 'pg':
            G, init = bfs_state_space(pddl_holder, number_edges, num_input, introduce_false_edge)
        elif mode == 'rl':
            G, init = get_trace_rl(pddl_holder, number_edges, num_input, introduce_false_edge)
        elif mode == 'st':
            G, init = get_trace_simple(pddl_holder, number_edges, num_input, introduce_false_edge)
        else:
            #return None
            continue

        instance_list.append((G,init))

        if mode == 'fg':
            break
    act_map, _ = pddl_holder.get_action_mapping_and_arity()
    print(act_map)
    return instance_list

def get_verification_instances(domain_path : str, verification_input : list[str]):
    instances = list()
    pos_modes = ['fg', 'st', 'rl', 'pg']
    neg_modes = ['nfg', 'nst', 'nrl', 'npg']
    modes = pos_modes + neg_modes
    partial_modes = [elm for elm in modes if elm not in ['fg', 'nfg']]

    for instance in verification_input:

        split_input = instance.split(',')

        if 1 >= len(split_input) or len(split_input) > 5:
            print(len(split_input))
            print('Length of input {} does not fit!'.format(instance))
            continue

        instance_path = split_input[0]
        instance_mode = split_input[1]
        instance_edges = 100
        instance_samples = 1
        instance_neg_sample = False
        instance_early_term = True

        if not os.path.exists(instance_path):
            print('For input {} the path {} does not exist'.format(instance, split_input[0]))
            continue

        if not instance_mode in modes:
            print('For input {} mode {} does not exist!'.format(instance, split_input[1]))
            continue
        elif instance_mode in neg_modes:
            instance_neg_sample = True
            idx = neg_modes.index(instance_mode)
            if idx >= len(pos_modes):
                print('No pos mode known for neg mode {}'.format(instance_mode))
                continue
            instance_mode = pos_modes[idx]

        if instance_mode in partial_modes and len(split_input) < 3:
            print('For input {} no specification of input size!'.format(instance))
            continue

        if len(split_input) >= 3:
            instance_edges = int(split_input[2])
            if instance_edges < 1:
                print('No valid number of edges!')
                continue

        if len(split_input) >= 4:
            instance_samples = int(split_input[3])
            if instance_samples < 1:
                print('No valid number of traces!')
                continue

        if len(split_input) == 5:
            split_input_val_5 = int(split_input[4])
            if split_input_val_5 == 0:
                instance_early_term = False
            elif split_input_val_5 == 1:
                instance_early_term = True
            else:
                print('No valid truth value for early termination!')
                continue

        instances.append((instance_early_term,
            instance_neg_sample,
            create_graphs_from_input(
                domain_path,
                instance_path,
                instance_mode,
                instance_edges,
                instance_samples,
                instance_neg_sample
            )
        ))

    return instances

def compare_features(
    features : pt.SetLike[Feature], local_features : pt.SetLike[Feature]
) -> int:
    failure_servity = 0
    features = set(features)
    local_features = set(local_features)
    for feature in features.copy():
        if feature.is_invalid():
            features.remove(feature)

    if features.difference(local_features):
        failure_servity = max(failure_servity, 5)
        return failure_servity

    temp_dict = {feature : feature for feature in local_features}
    compare_dict = dict()
    for feature in features:
        if feature not in temp_dict:
            failure_servity = max(failure_servity, 5)
        compare_dict[feature] = temp_dict[feature]
        if not feature.is_invalid() and compare_dict[feature].is_invalid():
            failure_servity = max(failure_servity, 4)

    if failure_servity >= 4:
        #report important cases already here
        return failure_servity

    for feature, local_feature in compare_dict.items():
        if local_feature.get_number_of_split_combinations() != feature.get_number_of_split_combinations():
            failure_servity = max(failure_servity, 3)
            return failure_servity
        local_prec_dict = dict()
        for idx in range(local_feature.get_number_of_split_combinations()):
            (
                local_add_list, local_del_list, local_pos_precs, local_neg_precs, local_undefined_precs, _, _
            ) = local_feature.get_color_split_combination(idx)
            key = frozenset({frozenset(local_add_list),frozenset(local_del_list)})
            local_prec_dict[key] = (
                local_add_list, local_del_list, local_pos_precs, local_neg_precs, local_undefined_precs
            )
        for idx in range(feature.get_number_of_split_combinations()):
            (
                add_list, del_list, pos_precs, neg_precs, undefined_precs, _, _
            ) = feature.get_color_split_combination(idx)
            key = frozenset({frozenset(add_list),frozenset(del_list)})
            if key not in local_prec_dict:
                failure_servity = max(failure_servity, 3)
                return failure_servity
            (
                local_add_list, local_del_list, local_pos_precs, local_neg_precs, local_undefined_precs
            ) = local_prec_dict[key]
            if add_list.intersection(local_del_list):
                (
                    local_add_list, local_del_list, local_pos_precs, local_neg_precs, local_undefined_precs
                ) = (
                    local_del_list, local_add_list, local_neg_precs, local_pos_precs, local_undefined_precs
                )
            elif not add_list.intersection(local_add_list):
                failure_servity = max(failure_servity, 3)
                return failure_servity

            if local_add_list != add_list or local_del_list != del_list:
                failure_servity = max(failure_servity, 3)
                return failure_servity

            if pos_precs.difference(local_pos_precs) or neg_precs.difference(local_neg_precs):
                failure_servity = max(failure_servity, 2)

            if undefined_precs.difference(local_undefined_precs):
                failure_servity = max(failure_servity, 1)

    return failure_servity

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
        instance_list += create_graphs_from_input(
            domain_path, problem_path,
            args.learning_mode, args.learning_size,
            args.learning_number_inputs, False
        )
    #print(instance_list)
    process_pool = ProcessPoolExecutor(max_workers=args.processes)
    sift = SIFT(instance_list)
    print("sift initialized")
    features = sift.run(process_pool)
    print("sift main run completed")
    verification_val = 0
    if args.verification_instance is not None:
        verifier = copy.deepcopy(sift)
        #add empty list on purpose to speed up further deep copies.
        verifier.replace_graphs(list())

        verification_cases = get_verification_instances(
            domain_path,
            args.verification_instance
        )
        for (early_termination, neg_mode, graphs) in verification_cases:
            if neg_mode or not early_termination:
                for graph in graphs:
                    graph = [graph]
                    local_verifier = copy.deepcopy(verifier)
                    local_verifier.replace_graphs(graph)
                    local_features = local_verifier.run(process_pool)
                    failure_servity = compare_features(
                        features, local_features
                    )
                    if neg_mode and failure_servity < 2:
                        verification_val += 1
                    elif not neg_mode and failure_servity > 0:
                        verification_val += 1
            else:
                local_verifier = copy.deepcopy(verifier)
                local_verifier.replace_graphs(graphs)
                local_features = local_verifier.run(process_pool)
                failure_servity = compare_features(
                    features, local_features
                )
                if failure_servity > 0:
                    verification_val += 1

    if verification_val == 0:
        print("Verification successfull.")
    else:
        print(f"Verification failed on {verification_val} instances.")
    print(sift.LOCM_types)
    feature_typecombinaton_pairs = [(feature, feature.get_type_combination()) for feature in features]
    for i, (feature, _) in enumerate(
        sorted(feature_typecombinaton_pairs, key=lambda pair: pair[1])
    ):
        if feature.has_unique_colouring():
            print(f"Feature {i+1}:")
            print(feature)