import time
from py_separator_utils.synth_dependencies.ActionAdds import AllActionCandidates
from py_separator_utils.synth_dependencies.trace_2 import GraphTrace

def synth(trace, stored_queries, verification_mode):

    new_Trace = GraphTrace(trace,dict(),dict(),list())
    num_initial_args = sum([ar for action, ar in new_Trace.action_arity.items()])

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

    #num_missing, num_additional = new_Trace.check_final_args()
    #new_Trace.print_action_arity()

    #num_domain_args = sum([ar for act, ar in new_Trace.hidden_action_arity.items()])
    #num_learned_args = sum([ar for action, ar in new_Trace.action_arity.items()])

    #print(num_domain_args, num_initial_args, num_learned_args, num_missing, num_additional, time_end)

    #new_Trace.print_query_output()

    # new_all_things.set_unique_patterns()
    #all_unique_queries = new_all_things.get_unique_queries()

    #print('\n %%%%%% Unique quries %%%%%%')
    #for a, q in all_unique_queries.items():
    #    for qq in q:
    #        print(a, qq)

    #print('\n-----------------------------\n')

    return new_Trace.to_graphs(), was_there_somehting_added or combi_added, new_Trace.get_queries()


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
