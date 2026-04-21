from typing import Dict, Tuple, Optional
import copy
import io
import logging
import itertools
import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
import py_separator_utils.synth_dependencies.synthalg as alg
from pathlib import Path
from contextlib import redirect_stdout
from py_separator_utils.exceptions import StratificationError, ExecutionError

def get_synth_logger(output_file_name: str | None = None,) -> logging.Logger:
    """
    Logger for synth output to keep progress print statements readable.
    """
    logger_name = f"synth_{output_file_name}" if output_file_name else "synth"
    logger = logging.getLogger(logger_name)

    if logger.handlers:
        return logger

    if output_file_name:
        log_path = Path(f"output/logs/{output_file_name}_synth_log.txt")
    else:
        log_path = Path("output/logs/synth_log.txt")

    log_path.parent.mkdir(parents=True, exist_ok=True)

    from logging.handlers import RotatingFileHandler
    file_handler = RotatingFileHandler(
        log_path,
        mode="a",
        maxBytes=5 * 1024 * 1024,
        backupCount=3,
        encoding="utf-8"
    )
    file_handler.setLevel(logging.DEBUG)

    formatter = logging.Formatter(
        fmt="%(asctime)s %(levelname)-8s %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S"
    )
    file_handler.setFormatter(formatter)

    logger.setLevel(logging.DEBUG)
    logger.addHandler(file_handler)

    logger.propagate = False

    logger.debug("Synth-Logger initialized → %s", log_path.resolve())
    return logger

def find_equivalent_predicates(
    graphs : Dict[int, Tuple[pt.GraphT, pt.NodeT]],
) -> Dict[int, Dict[pt.Predicate_IdentifierT, Dict[
    pt.Predicate_IdentifierT, Set[Tuple[int, ...]]
]]]:
    permutations_dict = dict()
    permutations_sets = dict()
    def get_permutation_dict(arity : int) -> Dict[Tuple[int, ...], Tuple[int, ...]]:
        if arity in permutations_dict:
            return permutations_dict[arity]
        def _inverse(p: Tuple[int, ...]) -> Tuple[int, ...]:
            inv = [0] * len(p)
            for i, pi in enumerate(p):
                inv[pi] = i
            return tuple(inv)
        result : Dict[Tuple[int, ...], Tuple[int, ...]] = dict()
        for p in itertools.permutations(range(arity)):
            result[p] = _inverse(p)
        return result
    def get_permutation_set(arity : int) -> Dict[Tuple[int, ...], Tuple[int, ...]]:
        if arity in permutations_sets:
            return permutations_sets[arity]
        permutations_set = set(get_permutation_dict(arity).keys())
        permutations_sets[arity] = permutations_set
        return permutations_set
    def apply_permutation_forward(
        grounding : pt.GroundingT,
        permutation : Tuple[int, ...]
    ) -> pt.GroundingT:
        return tuple(grounding[i] for i in permutation)
    def apply_permutation_backward(
        grounding : pt.GroundingT,
        arity : int,
        permutation : Tuple[int, ...]
    ) -> pt.GroundingT:
        backward_permutation = get_permutation_dict(arity)[permutation]
        return apply_permutation_forward(grounding, backward_permutation)
    #Atom_ListT = typing.Dict[Arity,typing.Dict[
    #    Predicate_IdentifierT,typing.Tuple[
    #        typing.Set[GroundingT],
    #        typing.Set[GroundingT]
    #    ]
    #]]
    predicate_conflict_adjacency_dict = dict()
    for instance_id, graph in graphs.items():
        for node, atoms in graph.nodes(data=pt.Atom_List_key):
            for arity, arity_atoms_dict in atoms.items():
                if arity not in predicate_conflict_adjacency_dict:
                    predicate_conflict_adjacency_dict[arity] = dict()
                for predicate_1, (true_atoms_1, false_atoms_1) in arity_atoms_dict.items():
                    if predicate_1 not in predicate_conflict_adjacency_dict[arity]:
                        predicate_conflict_adjacency_dict[arity][predicate_1] = dict()
                    for predicate_2, (true_atoms_2, false_atoms_2) in arity_atoms_dict.items():
                        if predicate_2 not in predicate_conflict_adjacency_dict[arity][predicate_1]:
                            predicate_conflict_adjacency_dict[arity][predicate_1][predicate_2] = set(get_permutation_set(arity))
                        for permutation in predicate_conflict_adjacency_dict[arity][predicate_1][predicate_2].copy():
                            permuted_atoms = set(
                                apply_permutation_forward(atom, permutation)
                                for atom in true_atoms_1
                            )
                            if permuted_atoms != true_atoms_2:
                                predicate_conflict_adjacency_dict[arity][predicate_1][predicate_2].remove(permutation)
                                continue
                            permuted_atoms = set(
                                apply_permutation_forward(atom, permutation)
                                for atom in false_atoms_1
                            )
                            if permuted_atoms != false_atoms_2:
                                predicate_conflict_adjacency_dict[arity][predicate_1][predicate_2].remove(permutation)
                                continue

    #TODO postprocess predicate_conflict_adjacency_dict
    #Cases p1 p2 point at  empty set -> different predicates
    #Cases p1 p2 point at filled set -> p1 less or equal informative than p2
    #Cases p1 p2 not a key           -> p1 and p2 do not interact, different predicates
    return predicate_conflict_adjacency_dict

def synth_update_graphs(
    process_pool_args : dict,
    graphs : Dict[int, Tuple[pt.GraphT, pt.NodeT]],
    iteration : int,
    stored_queries : Optional[dict] = None,
    verification_mode : bool = False,
    output_file_name : Optional[str] = None,
) -> Tuple[Dict[int, Tuple[pt.GraphT, pt.NodeT]], bool, dict]:
    print(f"{ut.format_cur_time()}: Running SYNTH", flush=True)
    if stored_queries == None:
        stored_queries = dict()
    #for instance, (Graph, initial_node_id) in graphs.items():
    #    assert(initial_node_id in Graph.nodes())
    #    print(Graph.nodes[initial_node_id].get(pt.Atom_List_key, dict()))
    #run Synth
    #stored_queries: action_name -> {arg -> query}
    #alternative storage tuple(query1, query2...)
    #   only store queries that add new args.
    #if stored_queries not applicable raise StratificationError
    #if verification_mode do not generate new queries just apply the old ones
    #   and keep the added arguments even is they seem to be duplicates
    #   as they were not during learning.
    graphs_bak = copy.deepcopy(graphs)
    log = get_synth_logger(output_file_name)
    buf = io.StringIO()

    try:
        with redirect_stdout(buf):
            graphs, changed, argument_queries = alg.synth(graphs, stored_queries, verification_mode, iteration)
    except StratificationError:
        # It is not possible to reapply the stored queries.
        # Thus a quantified precondition got violated.
        # Forward exception to the learning algorithm.
        raise
    except Exception as e:
        # Technical failure in Synth implementation, try to recover.
        log.exception("Synth raised an exception – rollback to backup")
        stdout_captured = buf.getvalue()
        if stdout_captured:
            log.debug("=== stdout of alg.synth ===\n%s", stdout_captured)
        if verification_mode and any(
            assign is not None
            for action, assigns in stored_queries.items()
            for arg, assign in assigns.items()
        ):
            raise ExecutionError(iteration,
                "Unexpected exception happened during reapplying Synth during verification."
            )
        return graphs_bak, False, stored_queries

    stdout_captured = buf.getvalue()
    if stdout_captured:
        log.debug("=== stdout of alg.synth ===\n%s", stdout_captured)

    #print(f"{ut.format_cur_time()}: Updating Graph labels", flush=True)
    #add query values to labels
    return graphs, changed, argument_queries
