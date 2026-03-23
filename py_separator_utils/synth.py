from typing import Dict, Tuple
import copy
import sys
import io
import logging
import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
import py_separator_utils.synth_dependencies.synthalg as alg
from pathlib import Path
from contextlib import redirect_stdout

def get_synth_logger() -> logging.Logger:
    """
    Logger for synth output to keep progress print statements readable
    """
    logger_name = "synth"
    logger = logging.getLogger(logger_name)

    if logger.handlers:
        return logger

    log_path = Path("output/stdout/synth_log.txt")
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

    logger.debug("Synth‑Logger initialisiert → %s", log_path.resolve())
    return logger

def synth_update_graphs(
    graphs : Dict[int, Tuple[pt.GraphT, pt.NodeT]]
) -> Dict[int, Tuple[pt.GraphT, pt.NodeT]]:
    print(f"{ut.format_cur_time()}: Running SYNTH", flush=True)
    #for instance, (Graph, initial_node_id) in graphs.items():
    #    assert(initial_node_id in Graph.nodes())
    #    print(Graph.nodes[initial_node_id].get(pt.Atom_List_key, dict()))
    #run Synth
    graphs_bak = copy.deepcopy(graphs)
    log = get_synth_logger()
    buf = io.StringIO()
    try:
        with redirect_stdout(buf):
            graphs, changed = alg.synth(graphs)
    except Exception as e:
        log.exception("Synth raised an exception – rollback to backup")
        stdout_captured = buf.getvalue()
        if stdout_captured:
            log.debug("=== stdout of alg.synth ===\n%s", stdout_captured)
        return graphs_bak, False

    stdout_captured = buf.getvalue()
    if stdout_captured:
        log.debug("=== stdout of alg.synth ===\n%s", stdout_captured)

    print(f"{ut.format_cur_time()}: Updating Graph labels", flush=True)
    #add query values to labels
    return graphs, changed
