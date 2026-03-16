from logging import raiseExceptions

from py_separator_utils.trace import Trace

class NegatedZFeature:

    def __init__(self, action_pattern, predicate_name, name, predicate_tyes, object_types):

        self.action_pattern = action_pattern
        self.predicate_name = predicate_name
        self.name = name
        self.arity = len(action_pattern)

        '''
         mask definition
            -1 -> identified
             0 -> dont take (blank)
             1 -> taken 
        '''
        self.mask = tuple([0 if pos is None else -1 if pos == -1 else 1 for pos in self.action_pattern])

        self.identified_position = None
        self.set_identified_position()

        # get all objects of the type of the identified position
        self.possible_objects = set()
        if len(predicate_tyes[predicate_name][self.identified_position]) == 0:
            for _, objs in object_types.items():
                for obj in objs:
                    self.possible_objects.add(obj)
        else:
            for type in predicate_tyes[predicate_name][self.identified_position]:
                for obj in object_types[type]:
                    self.possible_objects.add(obj)

        # print(self.possible_objects, self.predicate_name, self.identified_position)

        # just a list of all predicates
        self.groundings_in_states = dict()
        self.unique_groundings_in_states = dict()
        self.identified_dict = None
        self.unique_identified_dict = None

        self.was_unique = False
        self.unique = True
        self.active = True

    def get_name(self):
        return 'not-' + self.predicate_name + str(self.action_pattern)

    def set_identified_position(self):
        for pos, i in enumerate(self.action_pattern):
            if i == -1:
                if self.identified_position is None:
                    self.identified_position = pos
                else:
                    raise ValueError

    def get_predicate_pattern(self):
        return tuple(["not-"+self.predicate_name, self.action_pattern])

    def is_active(self):
        return self.active

    def invalidate(self):
        self.active = False

    def is_unique(self):
        return self.unique

    def set_not_unique(self):
        self.unique = False

    def get_results(self):

        if not self.active:
            raise ValueError

        if self.is_unique():
            return [self.predicate_name, self.mask]
        else:
            raise ValueError

    def get_identified_arguments(self):
        return self.groundings_in_states

    def add_arguments(self, trace: Trace):

        if not self.is_active() or not self.is_unique():
            return False

        args = self.get_identified_arguments()

        new_args = dict()
        for key, arg in args.items():
            if len(arg) > 1:
                raise ValueError
            new_args[key] = list(arg)[0]

        was_added = trace.add_arguments(new_args, self.name, {self.get_predicate_pattern()})
        #if was_added:
        #    print("there was an NEGATED argument added", self.name, '(', self.action_pattern, '), ', self.predicate_name,
        #          self.mask)

        return was_added

    def check_candidates(self, parsed_state, action_objects, state_index):

        all_partial_groundings = {o: tuple(None if pos_val == 0
                                    else -1 if pos_val == -1
                                    else action_objects[self.action_pattern[pos]]
                                    for pos, pos_val in enumerate(self.mask))
                                  for o in self.possible_objects}

        try:
            state_with_mask = parsed_state[self.arity][self.predicate_name][self.mask]
        except KeyError:
            '''
                This should be the case where no grounding of this predicate is true in the parsed state
                Check what to do, maybe change how states are parsed.
            '''
            raise NotImplementedError

        identified_objects = set()

        for obj, partial_grounding in all_partial_groundings.items():
            if partial_grounding in state_with_mask:
                if obj in state_with_mask[partial_grounding]:
                    continue
                else:
                    identified_objects.add(obj)
            else:
                identified_objects.add(obj)

        if len(identified_objects) == 0:
            self.invalidate()
            return False
        elif len(identified_objects) > 1:
            self.set_not_unique()

        self.groundings_in_states[state_index] = identified_objects
        return True

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
