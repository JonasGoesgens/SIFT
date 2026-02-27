from typing import Dict, Tuple
import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
def synth_update_graphs(
    graphs : Dict[int, Tuple[pt.GraphT, pt.NodeT]]
) -> Dict[int, Tuple[pt.GraphT, pt.NodeT]]:
    print(f"{ut.format_cur_time()}: Running SYNTH", flush=True)
    for instance, (Graph, initial_node_id) in graphs.items():
        assert(initial_node_id in Graph.nodes())
    #run Synth
    print(f"{ut.format_cur_time()}: Updating Graph labels", flush=True)
    #add query values to labels
    return graphs
