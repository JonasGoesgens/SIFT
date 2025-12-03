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
import clingo
from pathlib import Path
import networkx as nx
from py_separator_utils.mimir_holder import mimir_holder
from graph_generator import get_trace_rl, get_trace_simple
from graph_generator import bfs_state_space, get_nx_graph_from_state_space
from concurrent.futures import ProcessPoolExecutor
from typing import Set, Dict, Tuple, Union

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
            G, init, _, _ = get_nx_graph_from_state_space(pddl_holder, introduce_false_edge)
        elif mode == 'pg':
            G, init, _, _ = bfs_state_space(pddl_holder, number_edges, num_input, introduce_false_edge)
        elif mode == 'rl':
            G, init, _, _ = get_trace_rl(pddl_holder, number_edges, num_input, introduce_false_edge)
        elif mode == 'st':
            G, init, _, _ = get_trace_simple(pddl_holder, number_edges, num_input, introduce_false_edge)
        else:
            #return None
            continue

        instance_list.append((G,init))

        if mode == 'fg':
            break
    act_map, _ = pddl_holder.get_action_mapping_and_arity()
    print(act_map)
    return instance_list

def read_dict_from_file(filename) -> Dict[pt.ActionT, Set[int]]:
    result = {}

    with open(filename, 'r') as file:
        for line in file:
            key, values = line.strip().split(':')
            key = key.strip()
            value_set = set(int(v.strip()) for v in values.split(','))
            result[key] = value_set

    return result

def write_dict_to_file(filename, data : Dict[pt.ActionT, Set[int]]):
    with open(filename, 'w') as file:
        for key, value_set in data.items():
            values = ', '.join(str(v) for v in sorted(value_set))
            file.write(f"{key}: {values}\n")

def get_clingo_action_string(action : pt.ActionT) -> str:
    if isinstance(action, int):
        return str(action)
    elif isinstance(action, str):
        return f"\"{action}\""
    else:
        raise ValueError("action not of type int or str.")

def generate_clingo_from_instance(args: argparse.Namespace):
    # create domain paths
    domain_path = os.path.join(
        os.path.dirname(
            os.path.realpath(__file__)
        ), args.domain
    )

    instance_list = list()

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

    ar_sift = ARSift(instance_list)
    old_arities = ar_sift.sift_iterations[0].LOCM_types.action_arities.copy()
    iteration = 0
    oi_features = ar_sift.run_iteration(iteration, process_pool_args, False)
    new_oi_features = tuple(oi_features)
    _, _, _, all_arg_feature_assignments = ar_sift.update_graphs(
            new_oi_features,
            iteration,
            old_arities
        )
    features = ar_sift.sift_iterations[iteration].admissible_features

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
        clingo_input += f"action_arity({get_clingo_action_string(action)}, {arity}).\n"

    for oi_feature, mask_dict in oi_feature_requirement_mask.items():
        requirements_list = list()
        for action, requirements in mask_dict.items():
            for argument in requirements:
                requirements_list.append(f"arg_known({get_clingo_action_string(action)}, {argument})")

        if requirements_list:
            requirements_str = ", ".join(requirements_list)
            clingo_input += f"feature_usable({oi_feature_index_list[oi_feature]}) :- {requirements_str}.\n"
        else:
            clingo_input += f"feature_usable({oi_feature_index_list[oi_feature]}).\n"

    for action, argument, oi_feature, requirements in oi_feature_recovery_options:
        requirements_list = list(
            f"arg_known({get_clingo_action_string(action)}, {requirement})"
            for requirement in requirements
        )
        if requirements_list:
            requirements_str = ", ".join(requirements_list)
            clingo_input += f"arg_known({get_clingo_action_string(action)}, {argument}) :- feature_usable({oi_feature_index_list[oi_feature]}), {requirements_str}.\n"
        else:
            clingo_input += f"arg_known({get_clingo_action_string(action)}, {argument}) :- feature_usable({oi_feature_index_list[oi_feature]}).\n"

    return clingo_input, old_arities

def extract_raw_from_clingo_value(symbol : clingo.Symbol) -> Union[str,int]:
    if symbol.type == clingo.SymbolType.String:
        return symbol.string
    elif symbol.type == clingo.SymbolType.Number:
        return symbol.number
    else:
        raise ValueError("Operation only provided for type int or str.")

def extract_necessary_arguments(model) -> Set[Tuple[pt.ActionT, int]]:
    return set(
        (
            extract_raw_from_clingo_value(atom.arguments[0]),
            extract_raw_from_clingo_value(atom.arguments[1])
        )
        for atom in model.symbols(shown=True)
        if atom.name == "arg_given"
    )

def run_clingo_with_rules(clingo_input):
    dir_path = os.path.dirname(os.path.realpath(__file__))
    os.makedirs(os.path.join(dir_path, "clingo", "generated"), exist_ok=True)
    output_path = dir_path + '/clingo/generated/test.lp'
    with open(output_path, "w") as out_file:
        out_file.write(clingo_input)

    ctl = clingo.Control()

    ctl.configuration.solve.opt_mode='optN'
    ctl.configuration.solve.models = 0

    with open(dir_path + "/clingo/Optimization_rules.lp", "r") as f:
        ctl.add("base", [], f.read())

    # Füge den dynamischen Input hinzu
    ctl.add("base", [], clingo_input)

    ctl.ground([("base", [])])

    solutions = list()

    def on_model(model):
        if model.optimality_proven:
            solutions.append((str(model),extract_necessary_arguments(model)))

    ctl.solve(on_model=on_model)

    return solutions

def get_unnecessary_argument_mask(necessary_arguments, arities):
    argument_mask = dict()
    for action, arity in arities.items():
        argument_mask[action] = set(
            argument
            for argument in range(arity)
            if (action, argument) not in necessary_arguments
        )
    return argument_mask

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
                clingo_input, arities = generate_clingo_from_instance(args)
                models = run_clingo_with_rules(clingo_input)
                end_time = time.time()
                sum_time += end_time - start_time
                output_file = '{}_{}_{:02d}'.format(benchmark_name,line_num,run)
                output_path = 'output/{}.txt'.format(output_file)
                with open(output_path, "w") as out_file:
                    out_file.write(clingo_input)
                    out_file.write(f"Found{len(models)} models\n")
                    for index, (model_str, necessary_arguments) in enumerate(models):
                        out_file.write(f"Model quality {len(necessary_arguments)}\n")
                        for action, arg in necessary_arguments:
                            out_file.write(f"{action}, {arg}\n")
                        argument_mask = get_unnecessary_argument_mask(necessary_arguments, arities)
                        out_file.write(argument_mask + "\n")
                        write_dict_to_file(dir_path + f"/output/test_{index}.txt", argument_mask)
    else:
        #parse and run
        args = parsed_args
        clingo_input, arities = generate_clingo_from_instance(args)
        models = run_clingo_with_rules(clingo_input)
        print(clingo_input)
        print(f"Found {len(models)} models")
        for index, (model_str, necessary_arguments) in enumerate(models):
            print("Model quality ", len(necessary_arguments))
            for action, arg in necessary_arguments:
                print(action, arg)
            argument_mask = get_unnecessary_argument_mask(necessary_arguments, arities)
            print(argument_mask)
            write_dict_to_file(dir_path + f"/output/test_{index}.txt", argument_mask)
