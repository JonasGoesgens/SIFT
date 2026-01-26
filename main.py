from py_separator_utils.sift import SIFT
from py_separator_utils.argument_recovery_sift import Argument_Recovery_Sift as ARSift
from py_separator_utils.argument_recovery_sift import StratificationError
from py_separator_utils.feature import Feature
import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
import os
import io
import sys
import time
from contextlib import redirect_stderr
import warnings
import argparse
import typing
import copy
import clingo
import itertools
from pathlib import Path
import networkx as nx
from py_separator_utils.pddl_generator import PDDLGenerator
from py_separator_utils.mimir_holder import mimir_holder
from py_separator_utils.conflict_manager import ConflictManager
from graph_generator import get_trace_rl, get_trace_simple
from graph_generator import bfs_state_space, dfs_state_space, rand_state_space
from graph_generator import get_nx_graph_from_state_space
from concurrent.futures import ProcessPoolExecutor
from itertools import permutations

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
    parser.add_argument("-ds", "--static_relaxed_domain", type=Path, default=argparse.SUPPRESS, help="specify the static relaxed domain that is in the pddl_files folder.")
    parser.add_argument("-i", "--instance", type=Path, nargs='+', required=True, help="specify list of instances that is in the pddl_files folder.")
    parser.add_argument("-v", "--verification_instance", type=str, action='append', required=False, help="specify list of instances that is in the pddl_files folder.")
    parser.add_argument("-p", "--processes", type=int, required=True, help="number of max. parallel processes, 1 means sequential algorihtm")
    parser.add_argument("-o", "--output", type=str, required=False, help='name of output file')
    parser.add_argument("-lm", "--learning_mode", type=str, required=False, default='fg', 
                        help='Defines the input to the learinig alg. \n fg = full graphs (default)\n (b,d,r)pg = partial graphs in (bfs, dfs, rand) expansion\n st= simple traces\n rl= rl style traces')
    # parser.add_argument("-vm", "--verification_mode", type=str, required=False, default='fg', 
    #                     help='Defines the input to the learinig alg. \n fg = full graphs (default)\n pg = partial graphs\n st= simple traces\n rl= rl style traces')
    parser.add_argument("-ls", "--learning_size", type=int, required=False, help="size of the input if mode is not fg")
    # parser.add_argument("-vs", "--verification_size", type=int, required=False, help="size of the input if mode is not fg")
    parser.add_argument("-ln", "--learning_number_inputs", type=int, required=False, default=1, help="number of sampled inputs if mode is not fg")
    # parser.add_argument("-vn", "--verification_number_inputs", type=int, required=False, default=1, help="number of sampled inputs if mode is not fg")
    # parser.add_argument("-vt", "--verification_termination", action=argparse.BooleanOptionalAction, required=False, help="If set the verification stops at the first wrong predicate.")
    parser.add_argument("-am", "--argument_mask", type=Path, required=False, help="hide certain implicit arguments from sift to test argument recovery.")
    parser.add_argument("-ai", "--argument_recovery_max_iterations", type=int, default=0, required=False, help="how may iterations to search for implicit arguments.")
    return parser

def parse_args_single(single_run_parser, arguments=None):
    args = single_run_parser.parse_args(arguments)
    if not hasattr(args, "static_relaxed_domain"):
        args.static_relaxed_domain = args.domain
    return args

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
                    args = parse_args_single(single_run_parser, arguments)
                except SystemExit:
                    sys.stderr.write(f"Invalid arguments in line {str(i)}.\n")
                    continue
                parsed_args.append((runs,args))
    else:

        try:
            #block argparse from writing error messages directly.
            with redirect_stderr(parse_err):
                parsed_args = parse_args_single(single_run_parser)
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
    introduce_false_edge : bool = False,
    static_relaxed_domain_path : str = None,
    static_relaxed_problem_path : str = None,
    arg_mask : dict = dict()
) -> list[tuple[nx.DiGraph, int]]:
    if static_relaxed_domain_path is None:
        static_relaxed_domain_path = domain_path
    if static_relaxed_problem_path is None:
        static_relaxed_problem_path = problem_path
    # create state space and parser
    pddl_holder = mimir_holder(domain_path, problem_path)
    static_relaxed_pddl_holder = mimir_holder(static_relaxed_domain_path, static_relaxed_problem_path)
    instance_list = list()

    for num_input in range(number_inputs):
        if mode == 'fg':
            G, init, state_atom_dict, object_names_dict = get_nx_graph_from_state_space(
                pddl_holder,
                introduce_false_edge,
                static_relaxed_pddl_holder,
                arg_mask
            )
        elif mode == 'bpg' or mode == 'pg':
            G, init, state_atom_dict, object_names_dict = bfs_state_space(
                pddl_holder,
                number_edges,
                num_input,
                introduce_false_edge,
                static_relaxed_pddl_holder,
                arg_mask
            )
        elif mode == 'dpg':
            G, init, state_atom_dict, object_names_dict = dfs_state_space(
                pddl_holder,
                number_edges,
                num_input,
                introduce_false_edge,
                static_relaxed_pddl_holder,
                arg_mask
            )
        elif mode == 'rpg':
            G, init, state_atom_dict, object_names_dict = rand_state_space(
                pddl_holder,
                number_edges,
                num_input,
                introduce_false_edge,
                static_relaxed_pddl_holder,
                arg_mask
            )
        elif mode == 'rl':
            G, init, state_atom_dict, object_names_dict = get_trace_rl(
                pddl_holder,
                number_edges,
                num_input,
                introduce_false_edge,
                static_relaxed_pddl_holder,
                arg_mask
            )
        elif mode == 'st':
            G, init, state_atom_dict, object_names_dict = get_trace_simple(
                pddl_holder,
                number_edges,
                num_input,
                introduce_false_edge,
                static_relaxed_pddl_holder,
                arg_mask
            )
        else:
            #return None
            continue

        if not nx.is_weakly_connected(G):
            warnings.warn(
                f"Created not connected state space as input, dropping it.",
                UserWarning
            )
            continue

        instance_list.append((G,init, state_atom_dict, object_names_dict))

        if mode == 'fg':
            break
    #act_map, _ = pddl_holder.get_action_mapping_and_arity()
    #print(act_map)
    return instance_list

def get_verification_instances(
    domain_path : str,
    verification_input : list[str],
    static_relaxed_domain_path : str = None,
    arg_mask : dict = dict()
):
    if static_relaxed_domain_path is None:
        static_relaxed_domain_path = domain_path
    instances = list()
    pos_modes = ['fg', 'st', 'rl', 'pg', 'bpg', 'dpg', 'rpg']
    neg_modes = ['nfg', 'nst', 'nrl', 'npg', 'nbpg', 'ndpg', 'nrpg']
    modes = pos_modes + neg_modes
    partial_modes = [elm for elm in modes if elm not in ['fg', 'nfg']]

    for instance in verification_input:

        split_input = instance.split(',')

        if 1 >= len(split_input) or len(split_input) > 5:
            sys.stderr.write('Length {} of input {} does not fit!\n'.format(len(split_input),instance))
            continue

        instance_path = split_input[0]
        instance_mode = split_input[1]
        instance_edges = 100
        instance_samples = 1
        instance_neg_sample = False
        instance_early_term = False

        if not os.path.exists(instance_path):
            sys.stderr.write('For input {} the path {} does not exist\n'.format(instance, split_input[0]))
            continue

        if not instance_mode in modes:
            sys.stderr.write('For input {} mode {} does not exist!\n'.format(instance, split_input[1]))
            continue
        elif instance_mode in neg_modes:
            instance_neg_sample = True
            idx = neg_modes.index(instance_mode)
            if idx >= len(pos_modes):
                sys.stderr.write('No pos mode known for neg mode {}!\n'.format(instance_mode))
                continue
            instance_mode = pos_modes[idx]

        if instance_mode in partial_modes and len(split_input) < 3:
            sys.stderr.write('For input {} no specification of input size!\n'.format(instance))
            continue

        index = 2
        if len(split_input) > index:
            instance_edges = int(split_input[index])
            if instance_edges < 1:
                sys.stderr.write('No valid number of edges!\n')
                continue

        index += 1
        if len(split_input) > index:
            instance_samples = int(split_input[index])
            if instance_samples < 1:
                sys.stderr.write('No valid number of traces!\n')
                continue

        if instance_neg_sample:
            static_relaxed_domain_path_local = static_relaxed_domain_path
            index += 1
            if len(split_input) > index:
                static_relaxed_instance_path = split_input[index]
                if not os.path.exists(static_relaxed_instance_path):
                    sys.stderr.write('For input {} the path {} does not exist\n'.format(instance, static_relaxed_instance_path))
                    continue
            else:
                static_relaxed_instance_path = instance_path
        else:
            static_relaxed_domain_path_local = domain_path
            static_relaxed_instance_path = instance_path

        index += 1
        if len(split_input) > index:
            split_input_val_5 = int(split_input[index])
            if split_input_val_5 == 0:
                instance_early_term = False
            elif split_input_val_5 == 1:
                instance_early_term = True
            else:
                sys.stderr.write('No valid truth value for early termination!\n')
                continue

        instance_list = list((graph,init) for (graph,init,_,_) in create_graphs_from_input(
            domain_path,
            instance_path,
            instance_mode,
            instance_edges,
            instance_samples,
            instance_neg_sample,
            static_relaxed_domain_path_local,
            static_relaxed_instance_path,
            arg_mask
        ))

        instances.append((instance_early_term,
            instance_neg_sample,
            instance_list
        ))

    return instances

def compare_atoms_features(
    instance_atoms_dict : dict,
    features : pt.SetLike[Feature],
    graphs : dict
) -> dict:
    conflicts = dict()
    options = dict()
    predicates = dict()
    for instance, state_atom_dict in instance_atoms_dict.items():
        for state, atom_set in state_atom_dict.items():
            for predicate, grounding, _ in atom_set:
                predicates[predicate] = len(grounding)
    for feature in features:
        if not feature.has_unique_colouring():
            continue
        arity = feature.get_type_combination().size()
        if not arity in options:
            options[arity] = dict()
        if not arity in conflicts:
            conflicts[arity] = dict()
        for variant in range(feature.get_number_of_split_combinations()):
            effects = [None] * 2
            preconditions = [None] * 2
            atoms = [None] * 2
            (
                effects[0],
                effects[1],
                preconditions[0],
                preconditions[1],
                _,
                atoms[0],
                atoms[1]
            ) = feature.get_color_split_combination(variant)
            for permutation in permutations(range(arity)):
                for instance, state_atom_dict in instance_atoms_dict.items():
                    if instance not in graphs:
                        continue
                    graph, init = graphs[instance]
                    for state, atom_set in state_atom_dict.items():
                        for predicate, grounding, value in atom_set:
                            if len(grounding) != arity:
                                continue
                            grounding = tuple(
                                grounding[index]
                                for index in permutation
                            )
                            if predicate not in options[arity]:
                                options[arity][predicate] = set()
                            if predicate not in conflicts[arity]:
                                conflicts[arity][predicate] = set()
                            if (instance, grounding) not in atoms[0].union(atoms[1]):
                                continue
                            for sign in {False,True}:
                                options[arity][predicate].add((feature, variant, permutation, sign))
                            sign = (instance, grounding) in atoms[0]
                            path = nx.shortest_path(graph, source=init, target=state)
                            for i in range(len(path) - 1):
                                edge = (path[i], path[i + 1])
                                edge_label = graph.get_edge_data(*edge)['action']
                                ret, _, _, _ = feature.parse_edge_label(edge_label, grounding)
                                sign = sign ^ ret
                            conflicts[arity][predicate].add((feature, variant, permutation, value ^ sign))
    predicate_feature_dict = dict()
    for predicate, arity in predicates.items():
        if arity not in options:
            continue
        if predicate not in options[arity]:
            continue
        predicate_feature_dict[predicate] = options[arity][predicate].difference(conflicts[arity][predicate])
    return predicate_feature_dict

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
        compare_dict[feature] = temp_dict.get(feature,feature)
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

def compare_action_arguments(
    conflicts : ConflictManager[typing.Tuple[bool,pt.ActionT,int]],
    orig_graph : pt.GraphT, rec_graph : pt.GraphT, arities : pt.ArityInfoT
) -> ConflictManager[typing.Tuple[bool,pt.ActionT,int]]:
    orig_indices = dict()
    for u,v in orig_graph.edges():
        orig_labels = orig_graph[u][v].get("action")
        if orig_labels is None:
            continue
        try:
            rec_labels = rec_graph[u][v]["action"]
        except KeyError:
            #Add conflicts for all actions that should be listed.
            for label in orig_labels:
                action = label[0]
                if action not in orig_indices:
                    orig_indices[action] = set()
                arity = arities.get(action, len(label[1]))
                for index in range(len(label[1])):
                    orig_indices[action].add(index)
                    for pos in range(arity):
                        conflicts.add_conflict(
                            (True,action,index),
                            (False,action,pos)
                        )
            continue

        for label in orig_labels:
            action = label[0]
            if action not in orig_indices:
                orig_indices[action] = set()
            arity = arities.get(action, len(label[1]))
            for index, argument in enumerate(label[1]):
                orig_indices[action].add(index)
                if argument == pt.ObjectNotKnown:
                    continue
                matches = set()
                for rec_label in rec_labels:
                    if action != rec_label[0]:
                        continue
                    for pos, rec_argument in enumerate(rec_label[1]):
                        if argument == rec_argument:
                            matches.add(pos)
                for pos in range(arity):
                    if pos not in matches:
                        conflicts.add_conflict((True,action,index),(False,action,pos))
    return conflicts, orig_indices

def read_dict_from_file(filename):
    result = {}

    with open(filename, 'r') as file:
        for line in file:
            key, values = line.strip().split(':')
            key = key.strip()
            value_set = set(int(v.strip()) for v in values.split(','))
            result[key] = value_set

    return result

def get_clingo_action_string(action : pt.ActionT) -> str:
    if isinstance(action, int):
        return str(action)
    elif isinstance(action, str):
        return f"\"{action}\""
    else:
        raise ValueError("action not of type int or str.")

def generate_clingo_for_minimization(
    minimization_constraints_sets #: Set[FrozenSet[Tuple[Feature, Optional[pt.PatternT]]]]
):
    clingo_input = ""
    feature_numbers = dict()
    pattern_numbers = dict()
    constraint_numbers = dict()
    for constraints_set in minimization_constraints_sets:
        if constraints_set not in constraint_numbers:
            constraint_numbers[constraints_set] = len(constraint_numbers)
        for feature, pattern in constraints_set:
            if feature not in feature_numbers:
                feature_numbers[feature] = len(feature_numbers)
            if pattern is not None and (feature, pattern) not in pattern_numbers:
                pattern_numbers[(feature, pattern)] = len(pattern_numbers)

    for feature, feature_number in feature_numbers.items():
        clingo_input += f"%Feature({feature_number}) {repr(feature)}\n"
        clingo_input += f"feature({feature_number}).\n"

    for (feature, pattern), pattern_number in pattern_numbers.items():
        clingo_input += f"%Feature Pattern Pair({pattern_number}) {repr(feature)}, {repr(pattern)}\n"
        clingo_input += f"feature_pattern_pair({pattern_number}).\n"
        clingo_input += f"feature_sel({feature_numbers[feature]}) :- feature_pattern_pair_sel({pattern_number}).\n"

    for constraints_set, constraint_number in constraint_numbers.items():
        clingo_input += f"constraint({constraint_number}).\n"
        for feature, pattern in constraints_set:
            if pattern is None:
                clingo_input += f"constraint_fulfilled({constraint_number}) :- feature_sel({feature_numbers[feature]}).\n"
            else:
                clingo_input += f"constraint_fulfilled({constraint_number}) :- feature_pattern_pair_sel({pattern_numbers[(feature, pattern)]}).\n"
    #print(clingo_input)
    #output_path = 'clingo/generated/test_input_min.lp'
    #with open(output_path, "w") as out_file:
    #    out_file.write(clingo_input)
    return clingo_input, feature_numbers, pattern_numbers

def extract_raw_from_clingo_value(symbol : clingo.Symbol) -> typing.Union[str,int]:
    if symbol.type == clingo.SymbolType.String:
        return symbol.string
    elif symbol.type == clingo.SymbolType.Number:
        return symbol.number
    else:
        raise ValueError("Operation only provided for type int or str.")

def extract_necessary_features(model):
    return set(
        extract_raw_from_clingo_value(atom.arguments[0])
        for atom in model.symbols(shown=True)
        if atom.name == "feature_sel"
    ), set(
        extract_raw_from_clingo_value(atom.arguments[0])
        for atom in model.symbols(shown=True)
        if atom.name == "feature_pattern_pair_sel"
    )

def run_clingo_with_rules_minimization(clingo_input):
    dir_path = os.path.dirname(os.path.realpath(__file__))
    ctl = clingo.Control()

    with open(os.path.join(dir_path, "clingo", "Domain_Minimization_rules.lp"), "r") as f:
        ctl.add("base", [], f.read())

    # Füge den dynamischen Input hinzu
    ctl.add("base", [], clingo_input)

    ctl.ground([("base", [])])

    solutions = list()

    def on_model(model):
        solutions.append((str(model),extract_necessary_features(model)))

    ctl.solve(on_model=on_model)

    return solutions

def map_back_feature_numbers(clingo_solution, feature_numbers, pattern_numbers):
    inversed_feature_numbers = {
        value : key
        for key, value in feature_numbers.items()
    }
    inversed_pattern_numbers = {
        value : key
        for key, value in pattern_numbers.items()
    }
    features_needed = dict()
    for feature_number in clingo_solution[1][0]:
        features_needed[inversed_feature_numbers[feature_number]] = set()
    for pattern_number in clingo_solution[1][1]:
        feature, pattern = inversed_pattern_numbers[pattern_number]
        features_needed[feature].add(pattern)
    return features_needed

def create_clingo_mapping_matrix(max_arity : int)->str:
    matrix=f"max_arity({max_arity}).\n"
    for arity2 in range(1,max_arity+1):
        target_vec=tuple(f"Arg{index}" for index in range(1,arity2+1))
        tail = list(f"argument({arg},Type)" for arg in target_vec)
        tail = ", ".join(tail)
        target_vec = ", ".join(target_vec)
        target_vec = f"({target_vec})"
        matrix+=f"argument_tuple(Type,{arity2},{target_vec}):-{tail}.\n"
        for arity1 in range(1,arity2+1):
            for permutation in itertools.permutations(
                list(range(1,arity2+1)), arity1
            ):
                source_vec=tuple(f"Arg{index}" for index in permutation)
                source_vec = ", ".join(source_vec)
                source_vec = f"({source_vec})"
                matrix+=f"mapping_matrix({arity1},{arity2},{permutation},{source_vec},{target_vec}):-{tail}.\n"
                matrix+=f"mapping_permutations({arity1},{arity2},{permutation}).\n"
    return matrix

def create_clingo_object_list(obj_types : dict)->str:
    object_encoding=""
    types = set()
    instances = set()
    for (inst,obj),type_obj in obj_types.items():
        types.add(type_obj)
        instances.add(inst)
        object_encoding += f"objects(({inst},{obj})).\n"
        object_encoding += f"obj_type({type_obj},({inst},{obj})).\n"

    for type_obj in types:
        object_encoding += f"types({type_obj}).\n"

    for inst in instances:
        object_encoding += f"instance({inst}).\n"

    return object_encoding

def create_clingo_action_list(action_arities : dict, arg_types : dict)->str:
    action_encoding=""

    for action, arity in action_arities.items():
        action_encoding += f"action_arity({get_clingo_action_string(action)},{arity}).\n"
        head=list()
        tail=list()
        for arg in range(arity):
            head.append(f"Type{arg}")
            tail.append(f"action_arg_type(Type{arg},({get_clingo_action_string(action)},{arg}))")
        head = ", ".join(head)
        tail = ", ".join(tail)
        action_encoding += f"action_type_list({get_clingo_action_string(action)},({head})) :- {tail}.\n"

        head=list()
        tail=list()
        tail_sub=list()
        for arg in range(arity):
            head.append(f"Obj{arg}")
            tail.append(f"obj_type(Type{arg},(Obj{arg})),Obj{arg}=(Inst,_)")
            tail_sub.append(f"Type{arg}")
        head = ", ".join(head)
        tail = ", ".join(tail)
        tail_sub = ", ".join(tail_sub)
        action_encoding += f"action_candidate({get_clingo_action_string(action)},Inst,({head})):- instance(Inst),action_type_list({get_clingo_action_string(action)},({tail_sub})),{tail}.\n"

    for (action,arg), arg_type in arg_types.items():
        action_encoding += f"action_arg_type({arg_type},({get_clingo_action_string(action)},{arg})).\n"

    return action_encoding

def create_clingo_groundings_list(all_ground_edges : dict)->str:
    groundings_encoding=""

    for instance, action_groundings in all_ground_edges.items():
        for action, grounding in action_groundings:
            head=list()
            for arg in grounding:
                head.append(f"({instance},{arg})")
            head = ", ".join(head)
            groundings_encoding += f"action_possible({get_clingo_action_string(action)},{instance},({head})).\n"
    return groundings_encoding

def process_instance(args: argparse.Namespace):
    # create domain paths
    start_time = time.time()
    domain_path = os.path.join(
        os.path.dirname(
            os.path.realpath(__file__)
        ), args.domain
    )
    static_relaxed_domain_path = os.path.join(
        os.path.dirname(
            os.path.realpath(__file__)
        ), args.static_relaxed_domain
    )

    recover_args_mode = False
    argument_mask_file = args.argument_mask
    if argument_mask_file:
        recover_args_mode = True
        mask_dict = read_dict_from_file(argument_mask_file)
        max_iterations = args.argument_recovery_max_iterations
        find_oi_features_in_last_iteration = False
        if max_iterations < 0:
            max_iterations = -max_iterations
            find_oi_features_in_last_iteration = True

    instance_dict = dict()
    instance_backup_dict = dict()
    instance_atoms_dict = dict()
    instance_object_names_dict = dict()
    id_gen = ut.UniqueIDAllocator()
    meta_info = dict()

    print(f"{ut.format_cur_time()}: Input generation")
    for instance_path in args.instance:

        # create problem path
        problem_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), instance_path)
        instance_graph_list = create_graphs_from_input(
            domain_path, problem_path,
            args.learning_mode, args.learning_size,
            args.learning_number_inputs, False
        )
        backup_graphs = list()
        if recover_args_mode:
            for graph, _, _, _ in instance_graph_list:
                backup_graphs.append(copy.deepcopy(graph))
                for u, v, data in graph.edges(data=True):
                    labels = data['action']
                    new_labels = set()
                    for label in labels:
                        if label[0] in mask_dict:
                            mask = mask_dict[label[0]]
                            new_label = (label[0],tuple(x for i, x in enumerate(label[1]) if i not in mask))
                        else:
                            new_label = label
                        new_labels.add(new_label)
                    data['action'] = new_labels
        
        for index, (graph, init, state_atom_dict, object_names_dict) in enumerate(instance_graph_list):
            instance = id_gen.take_free_id()
            instance_dict[instance] = (graph,init)
            if recover_args_mode:
                instance_backup_dict[instance] = backup_graphs[index]
            #split atom data here to make transparent sift does not need or use it.
            instance_atoms_dict[instance] = state_atom_dict
            instance_object_names_dict[instance] = object_names_dict

    process_pool_args = {'max_workers' : args.processes}
    number_samples = args.learning_number_inputs
    if args.learning_mode == 'fg':
        number_samples = 1
    graph_size = 0
    graph_number = len(instance_dict)
    print(f"{ut.format_cur_time()}: Generated {len(instance_dict)} Graphs:")
    for instance in instance_dict.values():
        print(f"Graph with {instance[0].number_of_nodes()} nodes and {instance[0].number_of_edges()} edges.")
        graph_size += instance[0].number_of_edges()
    meta_info['graph_size'] = graph_size
    meta_info['graph_number'] = graph_number
    meta_info['number_samples'] = number_samples
    run_time = time.time()
    print(f"{ut.format_cur_time()}: Learning Domain")
    #recovered_graphs = dict()
    if recover_args_mode:
        ar_sift = ARSift(instance_dict)
        oi_features, features = ar_sift.run(
            process_pool_args,
            max_iterations,
            find_oi_features_in_last_iteration
        )
        iteration = max(ar_sift.sift_iterations.keys())
        recovered_graphs = {
            instance : (graphholder.base_graph, graphholder.initial_state)
            for instance, graphholder in ar_sift.sift_iterations[iteration].all_graphs.items()
        }
        meta_info['all_features'] = len(ar_sift.sift_iterations[iteration].all_features)
        meta_info['admissible_features'] = len(features)
        all_tested_oi_features = set()
        for _, tested_oi_features in reversed(sorted(ar_sift.order_id_features.items())):
            all_tested_oi_features.update(tested_oi_features)
        feature_variants = 0
        num_preconditions = [0,0,0]
        for feature in features:
            variants = feature.get_number_of_split_combinations()
            feature_variants += variants
            for variant in range(variants):
                _, _, pos_precs, neg_precs, undefined_precs, _, _ = feature.get_color_split_combination(variant)
                num_preconditions[0] += len(pos_precs)
                num_preconditions[1] += len(neg_precs)
                num_preconditions[2] += len(undefined_precs)
        meta_info['feature_variants'] = feature_variants
        meta_info['num_preconditions'] = num_preconditions
        meta_info['all_oi_features'] = len(all_tested_oi_features)
        meta_info['admissible_oi_features'] = len(oi_features)
        meta_info['action_argument_assignments'] = ar_sift.arg_feature_assignments
        meta_info['action_argument_multi_assignments'] = ar_sift.multi_arg_feature_assignment
        meta_info['all_action_argument_assignments'] = ar_sift.all_arg_feature_assignments
        meta_info['all_ground_edges'] = ar_sift.sift_iterations[iteration].all_ground_edges
        action_arities = ar_sift.sift_iterations[iteration].LOCM_types.action_arities
        meta_info['action_arities'] = action_arities

        conflicts = ConflictManager[typing.Tuple[bool,pt.ActionT,int]]()
        orig_indices = dict()
        extra_args = 0
        recovered_args = 0
        given_args = 0
        for action in action_arities:
            given_args += ar_sift.sift_iterations[0].LOCM_types.action_arities.get(action,0)
        for instance, graph in instance_backup_dict.items():
            rec_graph = recovered_graphs.get(instance)[0]
            if rec_graph is None:
                meta_info['recovered_args'] = 0
                for action, arity in action_arities.items():
                    extra_args += max(
                        0,
                        arity - ar_sift.sift_iterations[0].LOCM_types.action_arities.get(action,0)
                    )
                meta_info['recovered_args'] = 0
                meta_info['extra_args'] = extra_args
                break
            _, indices = compare_action_arguments(
                conflicts,
                graph,
                rec_graph,
                action_arities
            )
            for key, value in indices.items():
                if key in orig_indices:
                    orig_indices[key].update(value)
                else:
                    orig_indices[key] = value
        if 'recovered_args' not in meta_info:
            for action, arity in action_arities.items():
                indices = orig_indices.get(action, set())
                candidates = set((False,action,pos) for pos in range(arity))
                used_candidates = set()
                for index in indices:
                    simulators = conflicts.find_non_conflicting_elements((True,action,index),candidates)
                    if len(simulators):
                        recovered_args += 1
                        used_candidates.update(simulators)
                extra_args += len(candidates.difference(used_candidates))
            meta_info['recovered_args'] = recovered_args - given_args
            meta_info['extra_args'] = extra_args
        orig_args = 0
        for key, value in orig_indices.items():
            orig_args += len(value)
        meta_info['orig_args'] = orig_args
        meta_info['num_objects'] = len(ar_sift.sift_iterations[iteration].LOCM_types.obj_types)

        minimization_constraints_set = ar_sift.sift_iterations[iteration].calculate_minimization_constraints()
        clingo_input, feature_numbers, pattern_numbers = generate_clingo_for_minimization(
            minimization_constraints_set
        )
        solutions = run_clingo_with_rules_minimization(clingo_input)
        minimal_domain = map_back_feature_numbers(solutions[-1], feature_numbers, pattern_numbers)

        verifi_time = time.time()
        print(f"{ut.format_cur_time()}: Verification input generation")
        verification_val = 0
        graph_size = 0
        graph_number = 0
        num_objects = 0
        if recovered_args < orig_args:
            verification_val += 1
            print(f"{ut.format_cur_time()}: Verification failed to recover original arguments")
            print(recovered_args, orig_args)
            print(conflicts)
        if args.verification_instance is not None:
            verifier = copy.deepcopy(ar_sift)
            verifier.set_pre_pattern_disabling(False)
            #add empty list on purpose to speed up further deep copies.
            verifier.replace_graphs(list())

            verification_cases = get_verification_instances(
                domain_path,
                args.verification_instance,
                static_relaxed_domain_path,
                mask_dict
            )
            for early_termination, neg_mode, graph_list in verification_cases:
                for graph, _ in graph_list:
                    graph_number += 1
                    graph_size += graph.number_of_edges()
                    for u, v, data in graph.edges(data=True):
                        labels = data['action']
                        new_labels = set()
                        for label in labels:
                            if label[0] in mask_dict:
                                mask = mask_dict[label[0]]
                                new_label = (label[0],tuple(x for i, x in enumerate(label[1]) if i not in mask))
                            else:
                                new_label = label
                            new_labels.add(new_label)
                        data['action'] = new_labels

            print(f"{ut.format_cur_time()}: Verifing learned Domain")
            for (early_termination, neg_mode, graphs) in verification_cases:
                for graph in graphs:
                    graph = [graph]
                    local_verifier = copy.deepcopy(verifier)
                    local_verifier.replace_graphs(graph)
                    try:
                        local_oi_features, local_features = local_verifier.run(
                            process_pool_args,
                            max_iterations,
                            False,
                            verification_mode = True
                        )
                    except StratificationError as e:
                        num_objects += len(local_verifier.sift_iterations[0].LOCM_types.obj_types)
                        if neg_mode:
                            #Something was expected to fail so this is correct.
                            print(f"{ut.format_cur_time()}: Expected stratification Exception on negative sample")
                            continue
                        else:
                            verification_val += 1
                            print(f"{ut.format_cur_time()}: Unexpected stratification Exception on positive sample")
                            continue
                    except Exception as e:
                        num_objects += len(local_verifier.sift_iterations[0].LOCM_types.obj_types)
                        verification_val += 1
                        print(f"{ut.format_cur_time()}: Unexpected Exception happened during Verification {e}")
                        continue
                    verifier_iteration = max(local_verifier.sift_iterations.keys())
                    num_objects += len(local_verifier.sift_iterations[verifier_iteration].LOCM_types.obj_types)
                    #All arguments should be correctly recovered so check normal sift features
                    failure_servity = compare_features(
                        features, local_features
                    )
                    if neg_mode and failure_servity < 2:
                        print(f"{ut.format_cur_time()}: Verification negative Sample compatible with learned domain")
                        verification_val += 1
                    elif not neg_mode and failure_servity > 0:
                        print(f"{ut.format_cur_time()}: Verification positive Sample incompatible with learned domain")
                        verification_val += 1

        meta_info['graph_size_verifi'] = graph_size
        meta_info['graph_number_verifi'] = graph_number
        meta_info['num_objects_verifi'] = num_objects

        end_time = time.time()
        meta_info['datagen_time'] = run_time - start_time
        meta_info['run_time'] = verifi_time - run_time
        meta_info['verifi_time'] = end_time - verifi_time
        return(
            ar_sift.sift_iterations[iteration].LOCM_types,
            oi_features,
            features,
            minimal_domain,
            ar_sift.sift_iterations[iteration].all_ground_edges,
            recovered_graphs,
            instance_atoms_dict,
            instance_object_names_dict,
            verification_val,
            meta_info
        )
    else:
        sift = SIFT(instance_dict)
        oi_features = set()
        features = sift.run(process_pool_args)
        meta_info['all_features'] = len(sift.all_features)
        meta_info['admissible_features'] = len(features)
        feature_variants = 0
        num_preconditions = [0,0,0]
        for feature in features:
            variants = feature.get_number_of_split_combinations()
            feature_variants += variants
            for variant in range(variants):
                _, _, pos_precs, neg_precs, undefined_precs, _, _ = feature.get_color_split_combination(variant)
                num_preconditions[0] += len(pos_precs)
                num_preconditions[1] += len(neg_precs)
                num_preconditions[2] += len(undefined_precs)
        meta_info['feature_variants'] = feature_variants
        meta_info['num_preconditions'] = num_preconditions
        meta_info['all_ground_edges'] = sift.all_ground_edges

        minimization_constraints_set = sift.calculate_minimization_constraints()
        clingo_input, feature_numbers, pattern_numbers = generate_clingo_for_minimization(
            minimization_constraints_set
        )
        solutions = run_clingo_with_rules_minimization(clingo_input)
        minimal_domain = map_back_feature_numbers(solutions[-1], feature_numbers, pattern_numbers)

        verifi_time = time.time()
        print(f"{ut.format_cur_time()}: Verification input generation")
        verification_val = 0
        if args.verification_instance is not None:
            verifier = copy.deepcopy(sift)
            #add empty list on purpose to speed up further deep copies.
            verifier.replace_graphs(list())

            verification_cases = get_verification_instances(
                domain_path,
                args.verification_instance,
                static_relaxed_domain_path,
                dict()
            )
            print(f"{ut.format_cur_time()}: Verifing learned Domain")
            for (early_termination, neg_mode, graphs) in verification_cases:
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
        end_time = time.time()
        meta_info['datagen_time'] = run_time - start_time
        meta_info['run_time'] = verifi_time - run_time
        meta_info['verifi_time'] = end_time - verifi_time
        return (
            sift.LOCM_types,
            oi_features,
            features,
            minimal_domain,
            sift.all_ground_edges,
            instance_dict,
            instance_atoms_dict,
            instance_object_names_dict,
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
        os.makedirs(os.path.join(dir_path, "output", "pddl"), exist_ok=True)
        os.makedirs(os.path.join(dir_path, "output", "statics"), exist_ok=True)
        os.makedirs(os.path.join(dir_path, "output", "statics", "clingo"), exist_ok=True)
        stats_table_out = ""
        for line_num, (runs, args) in enumerate(parsed_args):
            print(f"{ut.format_cur_time()}: Batchmode line {line_num}")
            successful_runs = 0
            sum_admissible_features = 0
            sum_graph_size = 0
            sum_graph_size_verifi = 0
            #sum_graph_number_verifi = 0
            sum_time = 0
            sum_time_data = 0
            sum_time_learning = 0
            sum_time_verifi = 0
            max_number_samples = 1
            max_all_features = 0
            avg_objects_learning = 0
            avg_objects_verifi = 0
            orig_args = 0
            rec_args = 0
            extra_args = 0
            for run in range(runs):
                print(f"{ut.format_cur_time()}: Batchmode line {line_num} run {run}")
                start_time = time.time()
                (
                    LOCM_types,
                    oi_features,
                    features,
                    minimal_domain,
                    all_ground_edges,
                    recovered_graphs,
                    instance_atoms_dict,
                    instance_object_names_dict,
                    verification_val,
                    meta_info
                ) = process_instance(args)
                end_time = time.time()
                sum_time += end_time - start_time
                if verification_val == 0:
                    successful_runs += 1
                sum_admissible_features += meta_info.get('admissible_oi_features',0)
                sum_graph_size += meta_info['graph_size']
                max_number_samples = meta_info['number_samples']
                max_all_features = max(max_all_features, meta_info.get('all_oi_features',0))
                output_file = '{}_{}_{:02d}'.format(benchmark_name,line_num,run)
                output_path = 'output/{}.txt'.format(output_file)
                with open(output_path, "w") as out_file:
                    out_file.write(str(LOCM_types)+"\n")
                    feature_numbers = dict()
                    feature_typecombinaton_pairs = [
                        (feature, feature.get_type_combination())
                        for feature in oi_features
                    ]
                    for i, (feature, _) in enumerate(
                        sorted(feature_typecombinaton_pairs, key=lambda pair: pair[1])
                    ):
                        feature_numbers[feature] = i+1
                        out_file.write(f"OI Feature {i+1}:\n")
                        out_file.write(str(feature))

                    out_file.write("Maximal Domain:\n")
                    feature_typecombinaton_pairs = [
                        (feature, feature.get_type_combination())
                        for feature in features
                    ]
                    for i, (feature, _) in enumerate(
                        sorted(feature_typecombinaton_pairs, key=lambda pair: pair[1])
                    ):
                        #if feature.has_unique_colouring():
                        out_file.write(f"Feature {i+1}:\n")
                        out_file.write(str(feature))
                    for action, assignments in meta_info.get('action_argument_assignments',dict()).items():
                        output_line = f"Implicit agruments {action}: "
                        #as action is stated already only pattern[1] is needed
                        for index, (oi_feature, pattern) in assignments.items():
                            output_line += f"({index}: OI_Feature {feature_numbers.get(oi_feature,repr(oi_feature))} Pattern {pattern[1]}), "
                        out_file.write(output_line + "\n")

                    if verification_val == 0:
                        out_file.write("Verification successfull.\n")
                    else:
                        out_file.write(f"Verification failed on {verification_val} instances.\n")
                    out_file.write("Meta informations: " + str(meta_info) + "\n")

                    #print minimal model
                    feature_typecombinaton_filter_triplets = [
                        (feature, feature.get_type_combination(), preconditions)
                        for feature, preconditions in minimal_domain.items()
                    ]
                    out_file.write("Minimal Domain:\n")
                    for index, (feature, type_combination, preconditions) in enumerate(sorted(feature_typecombinaton_filter_triplets, key=lambda pair: pair[1])):
                        out_file.write(f"Feature {index + 1}:\n")
                        out_file.write(f"Type Combination: {type_combination}\n")
                        out_file.write(feature.get_color_split_combination_string(0, preconditions) + "\n\n")

                #print statics analysis input
                all_ground_edges = meta_info.get('all_ground_edges',dict())
                output_file = '{}_{}_{:02d}'.format(benchmark_name,line_num,run)
                output_path = 'output/statics/{}.txt'.format(output_file)
                with open(output_path, "w") as out_file:
                    out_file.write("arities: " + str(LOCM_types.action_arities)+"\n")
                    out_file.write("arg types: " + str(LOCM_types.arg_types)+"\n")
                    out_file.write("obj types: " + str(LOCM_types.obj_types)+"\n")
                    out_file.write("mutex features: " + str(oi_features)+"\n")
                    out_file.write("arg assignments: " + str(meta_info.get('all_action_argument_assignments',dict()))+"\n")
                    out_file.write("action groundings: " + str(all_ground_edges)+"\n")

                statics_clingo = ""
                max_arity = max(arity for arity in LOCM_types.action_arities.values())
                statics_clingo += create_clingo_mapping_matrix(max_arity)
                statics_clingo += create_clingo_object_list(LOCM_types.obj_types)
                statics_clingo += create_clingo_action_list(
                    LOCM_types.action_arities,
                    LOCM_types.arg_types
                )
                statics_clingo += create_clingo_groundings_list(all_ground_edges)

                output_file = '{}_{}_{:02d}'.format(benchmark_name,line_num,run)
                output_path = 'output/statics/clingo/{}.lp'.format(output_file)
                with open(output_path, "w") as out_file:
                    out_file.write(statics_clingo)

                #print pddl files
                pddl_features = list()
                feature_typecombinaton_pairs = [
                    (feature, feature.get_type_combination())
                    for feature in minimal_domain.keys()
                ]
                for i, (feature, _) in enumerate(
                    sorted(feature_typecombinaton_pairs, key=lambda pair: pair[1])
                ):
                    if not feature.has_unique_colouring():
                        continue
                    pddl_features.append(feature)
                pddl_gen = PDDLGenerator()
                pddl_gen.import_sift_result(
                    LOCM_types,
                    pddl_features,
                    all_ground_edges,
                    minimal_domain
                )

                name = os.path.splitext(os.path.basename(args.domain))[0]
                output_domain_path = 'output/pddl/{}.pddl'.format(output_file)
                with open(output_domain_path, "w") as out_file:
                    out_file.write(pddl_gen.get_domain_pddl(name) + "\n")

                for instance in LOCM_types.known_instances:
                    output_instance_path = 'output/pddl/{}_{}.pddl'.format(output_file, instance)
                    with open(output_instance_path, "w") as out_file:
                        goals = list()
                        #for feature in pddl_features:
                        #    for atom in feature.get_color_split_combination(0)[6]:
                        #        if atom[0] == instance:
                        #            goals.append((feature,0,0,atom[1]))
                        #            break
                        #    for atom in feature.get_color_split_combination(0)[5]:
                        #        if atom[0] == instance:
                        #            goals.append((feature,0,1,atom[1]))
                        #            break
                        out_file.write(pddl_gen.get_instance_pddl(name, instance, goals) + "\n")

                num_instances = max(1,meta_info.get('graph_number',0))
                num_instances_verify = max(1,meta_info.get('graph_number_verifi',0))
                orig_args = max(orig_args, meta_info.get('orig_args',0))
                rec_args = max(rec_args, meta_info.get('recovered_args',0))
                extra_args = max(extra_args, meta_info.get('extra_args',0))
                avg_objects_learning += meta_info.get('num_objects',0)/num_instances
                avg_objects_verifi += meta_info.get('num_objects_verifi',0)/num_instances_verify
                sum_time_data += meta_info.get('datagen_time',0)
                sum_time_learning += meta_info.get('run_time',0)
                sum_time_verifi += meta_info.get('verifi_time',0)
                sum_graph_size_verifi += meta_info.get('graph_size_verifi',0)/num_instances_verify
                #sum_graph_number_verifi += meta_info.get('graph_number_verifi',0)

            success_rate = 100*successful_runs/runs
            avg_admissible_features = sum_admissible_features/runs
            avg_graph_size = sum_graph_size/runs
            avg_graph_size_verifi = sum_graph_size_verifi/runs
            avg_objects_learning = avg_objects_learning/runs
            avg_objects_verifi = avg_objects_verifi/runs
            avg_time = sum_time/runs
            avg_time_data = sum_time_data/runs
            avg_time_learning = sum_time_learning/runs
            avg_time_verifi = sum_time_verifi/runs
            num_edges_learning = avg_graph_size
            num_edges_verifi = avg_graph_size_verifi
            stats_table_out += '&${:3.0f}$&${:5.0f}$&${:2.0f}$&${:2.0f}$&${:2.0f}$&${:7.0f}$&${:3.0f}$&${:5.0f}\seconds$&${:3.0f}$&${:5.0f}$&${:5.0f}\seconds$&${:3.0f}\%$\n'.format(
                avg_objects_learning,
                num_edges_learning,
                orig_args,
                rec_args,
                extra_args,
                max_all_features,
                avg_admissible_features,
                avg_time_learning,
                avg_objects_verifi,
                num_edges_verifi,
                avg_time_verifi,
                success_rate
            )
            #if max_number_samples <= 1:
            #    stats_table_out += '&${:3.1f}$&${:6.0f} $&${:5.0f}\seconds$&${:3.0f}\%$'.format(
            #        avg_admissible_features,
            #        avg_graph_size,
            #        avg_time,
            #        success_rate
            #    )
            #else:
            #    stats_table_out += '&${:3.1f}$&${:2} \\times {:6.0f} $&${:5.0f}\seconds$&${:3.0f}\%$'.format(
            #        avg_admissible_features,
            #        max_number_samples,
            #        avg_graph_size/max_number_samples,
            #        avg_time,
            #        success_rate
            #    )
        #stats_table_out = '&${:5}$   {}'.format(max_all_features, stats_table_out)
        #stats_table_out = stats_table_out+'\n'
        output_table_path = 'output/tables/{}_table.txt'.format(benchmark_name)
        with open(output_table_path, "w") as output_table:
            output_table.write(stats_table_out)
    else:
        #parse and run
        args = parsed_args
        (
            LOCM_types,
            oi_features,
            features,
            minimal_domain,
            all_ground_edges,
            recovered_graphs,
            instance_atoms_dict,
            instance_object_names_dict,
            verification_val,
            meta_info
        ) = process_instance(args)

        os.makedirs(os.path.join(dir_path, "output", "statics"), exist_ok=True)
        os.makedirs(os.path.join(dir_path, "output", "statics", "clingo"), exist_ok=True)

        #print secondary information
        if verification_val == 0:
            print("Verification successfull.")
        else:
            print(f"Verification failed on {verification_val} instances.")
        print(LOCM_types)
        print("Meta informations: " + str(meta_info))

        #print identifier features
        multi_assignment = meta_info.get('action_argument_multi_assignments',dict())
        print(multi_assignment)
        feature_numbers = dict()
        feature_typecombinaton_pairs = [
            (feature, feature.get_type_combination())
            for feature in oi_features
        ]
        for i, (feature, _) in enumerate(
            sorted(feature_typecombinaton_pairs, key=lambda pair: pair[1])
        ):
            feature_numbers[feature] = i+1
            #if feature.has_unique_colouring():
            print(f"OI Feature {i+1}:")
            print(feature)
            #print(feature.get_value_feature_extended_identifier(multi_assignment))

        #print features
        print("Maximal Domain:")
        feature_typecombinaton_pairs = [
            (feature, feature.get_type_combination())
            for feature in features
        ]
        for i, (feature, _) in enumerate(
            sorted(feature_typecombinaton_pairs, key=lambda pair: pair[1])
        ):
            #if feature.has_unique_colouring():
            print(f"Feature {i+1}:")
            print(feature)

        #print arg assignments
        for action, assignments in meta_info.get('action_argument_assignments',dict()).items():
            output_line = f"Implicit arguments {action}: "
            #as action is stated already only pattern[1] is needed
            for index, (oi_feature, pattern) in assignments.items():
                output_line += f"({index}: OI_Feature {feature_numbers.get(oi_feature, repr(oi_feature))} Pattern {pattern[1]}), "
            print(output_line)

        #print(instance_atoms_dict)

        predicate_feature_dict = compare_atoms_features(
            instance_atoms_dict,
            features,
            recovered_graphs
        )
        #print(predicate_feature_dict)
        output_lines = list()
        for predicate, feature_options in predicate_feature_dict.items():
            output_lines.append(f"{predicate}:")
            for index, (feature, variant, permutation, sign) in enumerate(feature_options):
                if len(feature_options) > 1:
                    output_lines.append(f"Option {index}:")
                inverse_permutation = tuple(pos for pos,_ in sorted(
                    enumerate(permutation), key=lambda item: item[1]
                ))
                
                a, b = (0, 1) if sign else (1, 0)
                effects = [None] * 2
                preconditions = [None] * 2
                atoms = [None] * 2
                (
                    effects[a],
                    effects[b],
                    preconditions[a],
                    preconditions[b],
                    _,
                    atoms[a],
                    atoms[b]
                ) = feature.get_color_split_combination(variant)
                for i in {0,1}:
                    effects[i] = set(
                        (pattern[0], tuple(
                            pattern[1][pos]
                            for pos in inverse_permutation
                        )) for pattern in effects[i]
                    )
                    preconditions[i] = set(
                        (pattern[0], tuple(
                            pattern[1][pos]
                            for pos in inverse_permutation
                        )) for pattern in preconditions[i]
                    )
                    atoms[i] = set(
                        (instance, tuple(
                            instance_object_names_dict[instance][grounding[pos]]
                            for pos in inverse_permutation
                        )) for instance, grounding in atoms[i]
                    )


                output_lines.append(f"  Add List: {effects[0]}")
                output_lines.append(f"  Delete List: {effects[1]}")
                output_lines.append(f"  Positive Preconditions: {preconditions[0]}")
                output_lines.append(f"  Negative Preconditions: {preconditions[1]}")
                output_lines.append(f"  True initial Atoms: {atoms[0]}")
                #output_lines.append(f"  False initial Atoms: {atoms[1]}")

        print("\n".join(output_lines))
        #print minimal model
        feature_typecombinaton_filter_triplets = [
            (feature, feature.get_type_combination(), preconditions)
            for feature, preconditions in minimal_domain.items()
        ]
        print("Minimal Domain:")
        for index, (feature, type_combination, preconditions) in enumerate(sorted(
            feature_typecombinaton_filter_triplets, key=lambda pair: pair[1]
        )):
            print(f"Feature {index + 1}:")
            print(f"Type Combination: {type_combination}")
            print(feature.get_color_split_combination_string(0, preconditions) + "\n")

        #print pddl files
        pddl_features = list()
        feature_typecombinaton_pairs = [
            (feature, feature.get_type_combination())
            for feature in minimal_domain.keys()
        ]
        for i, (feature, _) in enumerate(
            sorted(feature_typecombinaton_pairs, key=lambda pair: pair[1])
        ):
            if not feature.has_unique_colouring():
                continue
            pddl_features.append(feature)
        pddl_gen = PDDLGenerator()
        pddl_gen.import_sift_result(
            LOCM_types,
            pddl_features,
            all_ground_edges,
            minimal_domain
        )
        name = os.path.splitext(os.path.basename(args.domain))[0]
        print(pddl_gen.get_domain_pddl(name))
        for instance in LOCM_types.known_instances:
            goals = list()
            #for feature in pddl_features:
            #    for atom in feature.get_color_split_combination(0)[6]:
            #        if atom[0] == instance:
            #            goals.append((feature,0,0,atom[1]))
            #            break
            #    for atom in feature.get_color_split_combination(0)[5]:
            #        if atom[0] == instance:
            #            goals.append((feature,0,1,atom[1]))
            #            break
            print(pddl_gen.get_instance_pddl(name, instance, goals))

        #print statics analysis input
        all_ground_edges = meta_info.get('all_ground_edges',dict())
        output_file = 'statistics_test'
        output_path = 'output/statics/{}.txt'.format(output_file)
        with open(output_path, "w") as out_file:
            out_file.write("arities: " + str(LOCM_types.action_arities)+"\n")
            out_file.write("arg types: " + str(LOCM_types.arg_types)+"\n")
            out_file.write("obj types: " + str(LOCM_types.obj_types)+"\n")
            out_file.write("mutex features: " + str(oi_features)+"\n")
            out_file.write("arg assignments: " + str(meta_info.get('all_action_argument_assignments',dict()))+"\n")
            out_file.write("action groundings: " + str(all_ground_edges)+"\n")

        statics_clingo = ""
        max_arity = max(arity for arity in LOCM_types.action_arities.values())
        statics_clingo += create_clingo_mapping_matrix(max_arity)
        statics_clingo += create_clingo_object_list(LOCM_types.obj_types)
        statics_clingo += create_clingo_action_list(
            LOCM_types.action_arities,
            LOCM_types.arg_types
        )
        statics_clingo += create_clingo_groundings_list(all_ground_edges)

        output_file = 'statistics_test'
        output_path = 'output/statics/clingo/{}.lp'.format(output_file)
        with open(output_path, "w") as out_file:
            out_file.write(statics_clingo)
