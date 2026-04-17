import copy
from py_separator_utils.synth_dependencies.ActionAdds import AllActionCandidates
from py_separator_utils.synth_dependencies.trace_2 import GraphTrace
from py_separator_utils.exceptions import StratificationError

def synth(trace, stored_queries, verification_mode, iteration):

    new_Trace = GraphTrace(trace,dict(),dict(),list(),copy.deepcopy(stored_queries), verification_mode)
    # num_initial_args = sum([ar for action, ar in new_Trace.action_arity.items()])

    if not verification_mode:
        # TODO check how to handle object types
        new_all_things = AllActionCandidates(new_Trace.action_arity, new_Trace.predicate_arity, new_Trace.get_predicate_types(),
                                            dict(), None)

        for t in new_Trace:
            new_parsed_state = new_Trace.parse_state(t)
            new_all_things.parse_state(new_parsed_state, new_Trace.get_action_name(t), new_Trace.get_action_objects(t),
                                    t)

        was_there_somehting_added = new_all_things.add_arguments(new_Trace)
        combi_added = new_all_things.check_combis(new_Trace)

        print("NEW ARGUMENTS ADDED: ", combi_added or was_there_somehting_added)

        effects = new_Trace.get_effect_argument_positions()
        print_effects(effects)
        new_Trace.print_query_output()

        current_queries = new_Trace.get_queries()
        new_stored_queries = get_new_stored_queries(stored_queries, current_queries, iteration)

        return new_Trace.to_graphs(), was_there_somehting_added or combi_added, new_stored_queries

    else:
        precondition = dict()
        # get all patterns from the stored queries
        for _act in stored_queries:
            for _pos, _query in stored_queries[_act][iteration].items():
                if _query is None:
                    continue
                if _act not in precondition:
                    precondition[_act] = set()
                for _pattern in _query:
                    print(_pattern)
                    precondition[_act].add(_pattern)

        # create new all things only based on these queries
        new_all_things = AllActionCandidates(new_Trace.action_arity, new_Trace.predicate_arity, new_Trace.get_predicate_types(),
                                            dict(), precondition)

        # parse all things
        for t in new_Trace:
            new_parsed_state = new_Trace.parse_state(t)
            new_all_things.parse_state(new_parsed_state, new_Trace.get_action_name(t), new_Trace.get_action_objects(t),t)

        for action in stored_queries:
            if action not in new_Trace.action_arity:
                continue
            queries = stored_queries[action][iteration]
            positions = list(queries.keys())
            positions.sort()
            for position in positions:
                if queries[position] is None:
                    continue
                was_added = new_all_things.add_query_arguments(action, queries[position], new_Trace)
                if not was_added:
                    raise StratificationError(iteration, "Synth was not able to readd a query")
        return new_Trace.to_graphs(), None, None


def unpack_stored_queries(storred_q):

    if len(storred_q) == 0:
        return storred_q
    else:
        out = dict()
        for act in storred_q:
            out[act] = dict()
            for it in storred_q[act]:
                for pos, query in storred_q[act][it].items():
                    out[act][pos] = query
        return out


def get_new_stored_queries(storredq, currentq, ci):
    out = copy.deepcopy(storredq)
    covered = get_already_covered_positions(storredq)

    if covered is None:
        out = dict()
        for act in currentq:
            out[act] = dict()
            out[act][ci] = currentq[act]
        return out

    for act in currentq:
        out[act][ci] = dict()
        for pos, query in currentq[act].items():
            if pos > covered[act]:
                out[act][ci][pos] = query
    return out


def get_already_covered_positions(stored):
    covered_positions = dict()
    if len(stored) == 0:
        return None

    for _act in stored:
        try:
            max_it = max([pos for iteration in stored[_act] for pos in stored[_act][iteration]], default=-1)
            covered_positions[_act] = max_it
        except TypeError:
            covered_positions[_act] = -1
    return covered_positions


def print_effects(effects):
    for sign in effects:
        if sign == 0:
            print("Positive Effects: \n")
        else:
            print('\n Negative Effects: \n')
        for action in effects[sign]:
            for predicate in effects[sign][action]:
                for pattern in effects[sign][action][predicate]:
                    print('{}{} on {}'.format(action, pattern, predicate))
