from typing import Dict, Tuple
import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
import py_separator_utils.synth_dependencies.synthalg as alg

def synth_update_graphs(
    graphs : Dict[int, Tuple[pt.GraphT, pt.NodeT]]
) -> Dict[int, Tuple[pt.GraphT, pt.NodeT]]:
    print(f"{ut.format_cur_time()}: Running SYNTH", flush=True)
    for instance, (Graph, initial_node_id) in graphs.items():
        assert(initial_node_id in Graph.nodes())
        print(Graph.nodes[initial_node_id].get(pt.Atom_List_key, dict()))
    #run Synth
    graphs, changed = alg.synth(graphs)


    print(f"{ut.format_cur_time()}: Updating Graph labels", flush=True)
    #add query values to labels
    return graphs, changed
