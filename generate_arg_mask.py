from py_separator_utils.sift import SIFT
from py_separator_utils.argument_recovery_sift import Argument_Recovery_Sift as ARSift
from py_separator_utils.argument_recovery_sift import StratificationError
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
    parser.add_argument("-p", "--processes", type=int, required=True, help="number of max. parallel processes, 1 means sequential algorihtm")
    parser.add_argument("-o", "--output", type=str, required=False, help='name of output file')
    parser.add_argument("-lm", "--learning_mode", type=str, required=False, default='fg', 
                        help='Defines the input to the learinig alg. \n fg = full graphs (default)\n pg = partial graphs\n st= simple traces\n rl= rl style traces')
    parser.add_argument("-ls", "--learning_size", type=int, required=False, help="size of the input if mode is not fg")
    parser.add_argument("-ln", "--learning_number_inputs", type=int, required=False, default=1, help="number of sampled inputs if mode is not fg")
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
                    sys.stderr.write(f"Invalid number of runs: {runs_str}\n")
                    continue
                try:
                    args = single_run_parser.parse_args(arguments)
                except SystemExit:
                    sys.stderr.write(f"Invalid arguments in line {str(i)}.\n")
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

    for instance_path in args.instance:

        # create problem path
        problem_path = os.path.join(
            os.path.dirname(
                os.path.realpath(__file__)
            ), instance_path
        )
        instance_graph_list = create_graphs_from_input(
            domain_path, problem_path,
            args.learning_mode, args.learning_size,
            args.learning_number_inputs, False
        )
        instance_list += instance_graph_list

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

    ar_sift = ARSift(instance_list)
    old_arities = ar_sift.sift_iterations[0].LOCM_types.action_arities.copy()
    iteration = 0
    oi_features = ar_sift.run_iteration(iteration, process_pool_args, False)
    new_oi_features = tuple(oi_features)
    _, _, all_arg_feature_assignments = ar_sift.update_graphs(
            new_oi_features,
            iteration,
            old_arities
        )
    features = ar_sift.sift_iterations[iteration].admissible_features

    meta_info['action_argument_assignments'] = all_arg_feature_assignments
    meta_info['all_features'] = len(ar_sift.sift_iterations[iteration].all_features)
    meta_info['admissible_features'] = len(features)
    meta_info['all_oi_features'] = len(ar_sift.order_id_features)
    meta_info['admissible_oi_features'] = len(oi_features)

    oi_feature_index_list = dict()
    oi_feature_requirement_mask = dict()
    for index, oi_feature in reversed(sorted(enumerate(new_oi_features))):
        oi_feature_index_list[oi_feature] = index
        oi_feature_requirement_mask[oi_feature] = dict()
        for pattern in oi_feature.add_patterns.union(oi_feature.del_patterns):
            if pattern[0] in oi_feature_requirement_mask[oi_feature]:
                oi_feature_requirement_mask[oi_feature][pattern[0]].update(pattern[1])
            else:
                oi_feature_requirement_mask[oi_feature][pattern[0]] = set(pattern[1])

    print(oi_feature_requirement_mask)
    oi_feature_recovery_options = set()
    for action, arity in old_arities.items():
        for argument in range(arity):
            assignments = all_arg_feature_assignments[action].get(argument, set())
            for oi_feature, pattern in assignments:
                if pattern in oi_feature.add_patterns.union(oi_feature.del_patterns):
                    oi_feature_recovery_options.add((action, argument, oi_feature, frozenset()))
                else:
                    oi_feature_recovery_options.add((action, argument, oi_feature, frozenset(pattern[1])))
    
    clingo_input = ""

    for action, arity in old_arities.items():
        clingo_input += f"action_arity(\"{action}\", {arity}).\n"

    for oi_feature, mask_dict in oi_feature_requirement_mask.items():
        requirements_str = ""
        for action, requirements in mask_dict.items():
            for argument in requirements:
                if requirements_str != "":
                    requirements_str += ", "
                requirements_str += f"arg_known(\"{action}\", {argument})"
        if requirements_str != "":
            clingo_input += f"feature_usable({oi_feature_index_list[oi_feature]}) :- {requirements_str}.\n"
        else:
            clingo_input += f"feature_usable({oi_feature_index_list[oi_feature]}).\n"

    for action, argument, oi_feature, requirements in oi_feature_recovery_options:
        requirements_str = ""
        for requirement in requirements:
            requirements_str += f", arg_known(\"{action}\", {requirement})"
        clingo_input += f"arg_known(\"{action}\", {argument}) :- feature_usable({oi_feature_index_list[oi_feature]}){requirements_str}.\n"
    #action, arg, feature, additional requirements

    return clingo_input

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
                clingo_input = process_instance(args)
                end_time = time.time()
                sum_time += end_time - start_time
                output_file = '{}_{}_{:02d}'.format(benchmark_name,line_num,run)
                output_path = 'output/{}.txt'.format(output_file)
                with open(output_path, "w") as out_file:
                    out_file.write(clingo_input)
    else:
        #parse and run
        args = parsed_args
        #(
        #    LOCM_types,
        #    oi_features,
        #    features,
        #    verification_val,
        #    meta_info
        #) = process_instance(args)
        clingo_input = process_instance(args)
        print(clingo_input)
