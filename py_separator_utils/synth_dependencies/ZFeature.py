import copy
from py_separator_utils.synth_dependencies.trace_2 import Trace

class z_feature:
    def __init__(self, action_pattern, predicate_name, name, predicate_arity):

        self.action_pattern = action_pattern
        self.arity = len(action_pattern)
        self.name = name
        self.predicate_name = predicate_name

        '''
         mask definition
            -1 -> identified
             0 -> dont take (blank)
             1 -> taken 
        '''
        self.mask_new = tuple([0 if pos is None else -1 if pos == -1 else 1 for pos in self.action_pattern])
        #self.mask = tuple([1 if action_pattern[i] is not None else 0 for i in range(len(action_pattern))])

        self.identified_position = None
        self.set_identified_position()

        # just a list of all predicates
        self.groundings_in_states = dict()
        self.unique_groundings_in_states = dict()
        self.identified_dict = None
        self.unique_identified_dict = None

        self.was_unique = False
        self.unique = True
        self.active = True


    def check_candidates(self, parsed_state, object_tuple, state_index):

        partial_grounding = tuple([None if self.mask_new[obj_num] == 0
                            else -1 if self.mask_new[obj_num] == -1
                            else object_tuple[self.action_pattern[obj_num]] for obj_num, obj in enumerate(self.mask_new)])


        try:
            true_groundings = parsed_state[self.arity][self.predicate_name][self.mask_new][partial_grounding]
            identified_objects = {atom for atom in true_groundings}

            if len(identified_objects) == 0:
                self.invalidate()
                return False
            elif len(identified_objects) > 1:
                self.set_not_unique()
            elif len(identified_objects) == 1:
                self.was_unique = True

            self.groundings_in_states[state_index] = identified_objects
            self.unique_groundings_in_states[state_index] = {obj for obj, num in true_groundings.items()
                                                             if num == 1}

        except KeyError:
            self.invalidate()
            return False

        return True

    def get_name(self):
        return self.predicate_name + str(self.action_pattern)

    def is_active(self):
        return self.active

    def invalidate(self):
        self.active = False

    def is_unique(self):
        return self.unique

    def set_not_unique(self):
        self.unique = False

    def set_identified_position(self):

        for pos, i in enumerate(self.action_pattern):
            if i == -1:
                if self.identified_position is None:
                    self.identified_position = pos
                else:
                    raise ValueError


    def get_results(self):

        if not self.active:
            raise ValueError

        if self.is_unique():
            # BUG this should probably not be done...

            print('This is a result!:', self.name, self.action_pattern, self.predicate_name, self.mask_new)
            return [self.predicate_name, self.mask_new]
        return None


    #def get_z_dict(self):
    #    return self.groundings_in_states

    #def get_u_identified_arguments(self):
    #    return self.unique_groundings_in_states

    def get_predicate_pattern(self):
        return tuple([self.predicate_name, self.action_pattern])

    def get_identified_arguments(self):
        return self.groundings_in_states

    '''
    if self.identified_dict is None:

        out_dict = dict()
        for key, groundings in self.groundings_in_states.items():
            out_dict[key] = set()
            for g in groundings:
                out_dict[key].add(g)
        self.identified_dict = out_dict

    return self.identified_dict
    '''

    '''
    def get_unique_identified_arguments(self):

        if not self.unique:
            raise ValueError

        if self.unique_identified_dict is None:

            out_dict = dict()
            for key, groundings in self.groundings_in_states.items():

                if len(groundings) > 1:
                    raise ValueError

                out_dict[key] = list(groundings)[0]

            self.unique_identified_dict = out_dict

        return self.unique_identified_dict
    '''
    def add_arguments(self, trace: Trace):

        if not self.is_unique() or not self.is_active():
            return False

        #args = self.get_unique_identified_arguments()
        args = self.get_identified_arguments()

        new_args = dict()
        for key, arg in args.items():
            if len(arg) > 1:
                raise ValueError
            new_args[key] = list(arg)[0]


        was_added = trace.add_arguments(new_args, self.name, {self.get_predicate_pattern()})
        #if was_added:
        #    print("there was an argument added", self.name, '(', self.action_pattern,'), ', self.predicate_name, self.mask_new)

        return was_added

    def contained_positions(self, trace: Trace):

        if not self.is_unique() or not self.is_active():
            return set()

        args = self.get_identified_arguments()

        new_args = dict()
        for key, arg in args.items():
            if len(arg) > 1:
                raise ValueError
            new_args[key] = list(arg)[0]

        return trace.is_contained_in_positions(new_args, self.name)
