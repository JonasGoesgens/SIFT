import time
from py_separator_utils.synth_dependencies.ActionAdds import AllActionCandidates
from py_separator_utils.synth_dependencies.trace_2 import GraphTrace

def synth(trace):
    time_start = time.time()
    new_Trace = GraphTrace(trace,dict(),dict(),list())
    num_initial_args = sum([ar for action, ar in new_Trace.action_arity.items()])

    # TODO check how to handle object types

    i = 0
    while True:
        i += 1
        print(f"This is the {i}. iteration")
        print('Actions arity',new_Trace.action_arity,"predicate arity", new_Trace.predicate_arity,'predicate types', new_Trace.get_predicate_types())
        new_all_things = AllActionCandidates(new_Trace.action_arity, new_Trace.predicate_arity, new_Trace.get_predicate_types(),
                                             dict(), None)

        for t in new_Trace:
            new_parsed_state = new_Trace.parse_state(t)
            new_all_things.parse_state(new_parsed_state, new_Trace.get_action_name(t), new_Trace.get_action_objects(t),
                                       t)

        was_there_somehting_added = new_all_things.add_arguments(new_Trace)

        '''
            for combis all arguments should be unique, else there can not be a precondtion on the combination
            this would lead to problems when defining the domain since we would need to derive predicates 
            that are not in the domain and the corresponding precondition can not be stated

            why in npuzzle every argument is found? CRISP description...
        '''
        combi_added = new_all_things.check_combis(new_Trace)

        if not was_there_somehting_added and not combi_added:
            break

    effects = new_Trace.get_effect_argument_positions()

    print_effects(effects)

    time_end = str(round(time.time() - time_start, 2)) + ' s'

    num_missing, num_additional = new_Trace.check_final_args()
    new_Trace.print_action_arity()

    num_domain_args = sum([ar for act, ar in new_Trace.hidden_action_arity.items()])
    num_learned_args = sum([ar for action, ar in new_Trace.action_arity.items()])

    print(num_domain_args, num_initial_args, num_learned_args, num_missing, num_additional, time_end)

    new_Trace.print_query_output()

    # new_all_things.set_unique_patterns()
    all_unique_queries = new_all_things.get_unique_queries()

    print('\n %%%%%% Unique quries %%%%%%')
    for a, q in all_unique_queries.items():
        for qq in q:
            print(a, qq)

    print('\n-----------------------------\n')

    return new_Trace.to_graphs()


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
