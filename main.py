from py_separator_utils.sift import SIFT
from py_separator_utils.feature import Feature
import py_separator_utils.py_types as pt
import os
import io
import sys
import time
from contextlib import redirect_stderr
import argparse
import typing
import copy
from pathlib import Path
import networkx as nx
from py_separator_utils.mimir_holder import mimir_holder
from graph_generator import get_trace_rl, get_trace_simple
from graph_generator import bfs_state_space, get_nx_graph_from_state_space
from concurrent.futures import ProcessPoolExecutor

def get_batch_run_parser():
    parser = argparse.ArgumentParser(
        description='This parser parses all arguments for a batch run execution of the sift arlgorithm and followup verifications.'
    )
    parser.add_argument("-br", "--batch-run", type=Path, required=True, help="specify a txt document containing the arguments of the individual runs.")
    parser.add_argument("-p", "--processes", type=int, required=True, help="number of max. parallel processes, 1 means sequential algorihtm")
    return parser

def get_single_instance_argparser():
    parser = argparse.ArgumentParser(
        description='This parser parses all arguments for a single execution of the sift arlgorithm and a followup verification.'
    )
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
    return parser

def get_arguments():
    batch_run_parser = get_batch_run_parser()
    single_run_parser = get_single_instance_argparser()
    # parse arguments
    batch_mode = False
    parse_err = io.StringIO()
    try:
        #block argparse from writing error messages directly.
        with redirect_stderr(parse_err):
            batch_args = batch_run_parser.parse_args()
        batch_file = batch_args.batch_run
        processes = batch_args.processes
        batch_mode = True
    except SystemExit:
        pass
    if batch_mode:
        benchmark_name = os.path.splitext(os.path.basename(batch_file))[0]
        parsed_args = list()
        with open(batch_file) as file:
            for i, line in enumerate(file):
                arguments = line.strip().split()
                runs_str = arguments.pop(0)
                arguments.extend(['-p', str(processes)])
                try:
                    runs = int(runs_str)
                except ValueError:
                    sys.stderr.write(f"Invalid number of runs: {runs_str}")
                    continue
                try:
                    args = single_run_parser.parse_args(arguments)
                except SystemExit:
                    sys.stderr.write(f"Invalid arguments in line {str(i)}.")
                    continue
                parsed_args.append((runs,args))
    else:

        try:
            #block argparse from writing error messages directly.
            with redirect_stderr(parse_err):
                parsed_args = single_run_parser.parse_args()
        except SystemExit:
            parse_err.seek(0)
            sys.stderr.write("All parsing attempts failed. Errors:\n")
            sys.stderr.write(parse_err.getvalue())
            sys.exit(1)
        benchmark_name = ''
    return batch_mode, benchmark_name, parsed_args

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
        instance_early_term = False

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

def read_dict_from_file(filename):
    result = {}

    with open(filename, 'r') as file:
        for line in file:
            key, values = line.strip().split(':')
            key = key.strip()
            value_set = set(int(v.strip()) for v in values.split(','))
            result[key] = value_set

    return result

def process_instance(args: argparse.Namespace):
    # create domain paths
    domain_path = os.path.join(
        os.path.dirname(
            os.path.realpath(__file__)
        ), args.domain
    )

    instance_list = list()
    meta_info = dict()

    #print(args.instance)

    for instance in args.instance:

        # create problem path
        problem_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), instance)
        instance = create_graphs_from_input(
            domain_path, problem_path,
            args.learning_mode, args.learning_size,
            args.learning_number_inputs, False
        )
        instance_list += instance
    #print(instance_list)
    process_pool_args = {'max_workers' : args.processes}
    number_samples = args.learning_number_inputs
    if args.learning_mode == 'fg':
        number_samples = 1
    graph_size = 0
    graph_number = len(instance_list)
    for instance in instance_list:
        graph_size += instance[0].number_of_edges()
    meta_info['graph_size'] = graph_size
    meta_info['graph_number'] = graph_number
    meta_info['number_samples'] = number_samples
    sift = SIFT(instance_list)
    #print("sift initialized")
    features = sift.run(process_pool_args)
    meta_info['all_features'] = len(sift.all_features)
    meta_info['admissible_features'] = len(features)
    #print("sift main run completed")
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
                    local_features = local_verifier.run(process_pool_args)
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
                local_features = local_verifier.run(process_pool_args)
                failure_servity = compare_features(
                    features, local_features
                )
                if failure_servity > 0:
                    verification_val += 1
    return (
        sift.LOCM_types,
        features,
        verification_val,
        meta_info
    )

if __name__ == '__main__':
    # get domain and instance
    batch_mode, benchmark_name, parsed_args = get_arguments()
    dir_path = os.path.dirname(os.path.realpath(__file__))
    if batch_mode:
        os.makedirs(os.path.join(dir_path, "output"          ), exist_ok=True)
        os.makedirs(os.path.join(dir_path, "output", "tables"), exist_ok=True)
        stats_table_out = ""
        max_all_features = 0
        for line_num, (runs, args) in enumerate(parsed_args):
            successful_runs = 0
            sum_admissible_features = 0
            sum_graph_size = 0
            sum_time = 0
            max_number_samples = 1
            for run in range(runs):
                start_time = time.time()
                (
                    LOCM_types,
                    features,
                    verification_val,
                    meta_info
                ) = process_instance(args)
                end_time = time.time()
                sum_time += end_time - start_time
                if verification_val == 0:
                    successful_runs += 1
                sum_admissible_features += meta_info['admissible_features']
                sum_graph_size += meta_info['graph_size']
                max_number_samples = meta_info['number_samples']
                max_all_features = max(max_all_features, meta_info['all_features'])
                output_file = '{}_{}_{:02d}'.format(benchmark_name,line_num,run)
                output_path = 'output/{}.txt'.format(output_file)
                with open(output_path, "w") as out_file:
                    out_file.write(str(LOCM_types)+"\n")

                    feature_typecombinaton_pairs = [(feature, feature.get_type_combination()) for feature in features]
                    for i, (feature, _) in enumerate(
                        sorted(feature_typecombinaton_pairs, key=lambda pair: pair[1])
                    ):
                        #if feature.has_unique_colouring():
                        out_file.write(f"Feature {i+1}:\n")
                        out_file.write(str(feature))
                    if verification_val == 0:
                        out_file.write("Verification successfull.\n")
                    else:
                        out_file.write(f"Verification failed on {verification_val} instances.\n")
                    out_file.write("Meta informations: " + str(meta_info) + "\n")
            success_rate = 100*successful_runs/runs
            avg_admissible_features = sum_admissible_features/runs
            avg_graph_size = sum_graph_size/runs
            avg_time = sum_time/runs
            if max_number_samples <= 1:
                stats_table_out += '&${:3.1f}$&${:6.0f} $&${:5.0f}\seconds$&${:3.0f}\%$'.format(
                    avg_admissible_features,
                    avg_graph_size,
                    avg_time,
                    success_rate
                )
            else:
                stats_table_out += '&${:3.1f}$&${:2} \\times {:6.0f} $&${:5.0f}\seconds$&${:3.0f}\%$'.format(
                    avg_admissible_features,
                    max_number_samples,
                    avg_graph_size/max_number_samples,
                    avg_time,
                    success_rate
                )
        stats_table_out = '&${:5}$   {}'.format(max_all_features, stats_table_out)
        stats_table_out = stats_table_out+'\n'
        output_table_path = 'output/tables/{}_table.txt'.format(benchmark_name)
        with open(output_table_path, "w") as output_table:
            output_table.write(stats_table_out)
    else:
        #parse and run
        args = parsed_args
        (
            LOCM_types,
            features,
            verification_val,
            meta_info
        ) = process_instance(args)

        #print secondary information
        if verification_val == 0:
            print("Verification successfull.")
        else:
            print(f"Verification failed on {verification_val} instances.")
        print(LOCM_types)
        print("Meta informations: " + str(meta_info))

        #print features
        feature_typecombinaton_pairs = [(feature, feature.get_type_combination()) for feature in features]
        for i, (feature, _) in enumerate(
            sorted(feature_typecombinaton_pairs, key=lambda pair: pair[1])
        ):
            #if feature.has_unique_colouring():
            print(f"Feature {i+1}:")
            print(feature)
