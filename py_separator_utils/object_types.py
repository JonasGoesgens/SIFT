import itertools
import py_separator_utils.py_types as pt
import py_separator_utils.utils as ut
class LOCM_Types:
    def __init__(self):
        self.action_arities = dict()
        self.arg_types = dict()
        self.obj_types = dict()
        self.updated_types = dict()
        self.type_args = dict()
        self.type_objs = dict()
        self.type_updates = dict()
        self.known_instances = set()
        self.type_id_generator = ut.UniqueIDAllocator()
        self.type_combinations = None
        self.all_patterns_per_type_combination = dict()
        self.all_groundings_per_type_combination = dict()

    def clear_instance_information(self):
        #deletes all information about instances and their objects
        #but preserves info over arguments
        self.obj_types = dict()
        for key in self.type_objs.keys():
            self.type_objs[key] = set()
        self.known_instances = set()
        self.all_groundings_per_type_combination = dict()

    def add_obj_to_type(self, arg : pt.ArgPosT, obj : pt.ObjectInstT):
        changed_arg_type = False
        type_arg = self.arg_types.get(arg)
        type_obj = self.obj_types.get(obj)
        if type_obj is None:
            if type_arg is None:
                type_obj = self.type_id_generator.take_free_id()
                type_arg = type_obj
                changed_arg_type = True
                self.arg_types[arg] = type_arg
                self.obj_types[obj] = type_obj
                #both values were None so we took a fresh number that cant be in the dict
                self.type_args[type_arg] = {arg}
                self.type_objs[type_obj] = {obj}
            else:
                type_obj = type_arg
                #obj is completly new so no type merge needed, type_arg not updated
                self.obj_types[obj] = type_obj
                self.type_objs[type_obj].add(obj)
        elif type_arg is None:
            type_arg = type_obj
            changed_arg_type = True
            #arg is completly new so no type merge needed, type_obj not updated
            self.arg_types[arg] = type_arg
            self.type_args[type_arg].add(arg)
        elif type_arg != type_obj:
            if type_arg > type_obj:
                type_keep, type_drop = type_obj, type_arg
            else:
                type_keep, type_drop = type_arg, type_obj
            #merge type obj into type arg
            changed_arg_type = True
            for up_obj in self.type_objs[type_drop]:
                self.obj_types[up_obj] = type_keep
            for up_arg in self.type_args[type_drop]:
                self.arg_types[up_arg] = type_keep
            self.type_args[type_keep].update(self.type_args[type_drop])
            self.type_objs[type_keep].update(self.type_objs[type_drop])
            del self.type_args[type_drop]
            del self.type_objs[type_drop]
            #store where to find the old type
            if not type_keep in self.type_updates:
                self.type_updates[type_keep] = set()
            if type_drop in self.type_updates:
                for up_type in self.type_updates[type_drop]:
                    self.updated_types[up_type] = type_keep
                self.type_updates[type_keep].update(self.type_updates[type_drop])
                del self.type_updates[type_drop]
            self.type_updates[type_keep].add(type_drop)
            self.updated_types[type_drop] = type_keep
        #else arg and obj have same type nothing to do here

        return changed_arg_type

    def update_LOCM_types_from_groundings(self,
        ground_edges : set[pt.Ground_Edge_Info], instance : int
    ):
        self.known_instances.add(instance)
        #We need to store objects as instance id + object id to tell apart the same object id in diff instances
        changed_arg_type = False
        for ground_edge in ground_edges:
            action = ground_edge[0]
            for arg_pos, obj_id in enumerate(ground_edge[1]):
                change = self.add_obj_to_type((action,arg_pos),(instance,obj_id))
                if change:
                    changed_arg_type = True
            self.action_arities[action] = len(ground_edge[1])
        self.type_combinations = None
        self.all_patterns_per_type_combination = dict()
        return changed_arg_type

    def get_action_arities(self) -> pt.ArityInfoT:
        return self.action_arities.copy()

    def update_type_combination(
        self, type_combination : pt.TypeCombi
    ) -> pt.TypeCombi:
        new_type_combination = pt.TypeCombi()
        for types, uses in type_combination.items():
            new_type_combination.add(
                self.get_current_id_of_type(types), uses
            )
        return pt.TypeCombi(new_type_combination)

    def get_arg_type(self, arg : pt.ArgPosT):
        if arg in self.arg_types:
            return self.arg_types[arg]
        else:
            raise ValueError("please add all possible groundings to database before requesting types.")

    def get_obj_type(self, obj : pt.ObjectInstT):
        if obj in self.obj_types:
            return self.obj_types[obj]
        else:
            raise ValueError("please add all possible groundings to database before requesting types.")

    def get_current_id_of_type(self, type_var):
        if type_var in self.updated_types:
            return self.updated_types[type_var]
        else:
            return type_var

    def __str__(self):
        return f"LOCM_Types args: ({self.type_args}) objs: ({self.type_objs})"

    def get_all_type_combinations(self):
        if not self.type_combinations is None:
            return self.type_combinations
        self.type_combinations = dict()
        self.type_combinations[0] = {pt.TypeCombi()}
        for action, arity in self.action_arities.items():
            for arr in set(range(1, arity + 1)):
                if not arr in self.type_combinations:
                    self.type_combinations[arr] = set()
            arg_set = set(range(arity))
            for arg_combi in ut.power_set_without_empty_set(arg_set):
                type_combi = pt.TypeCombi()
                for arg in arg_combi:
                    type_combi.add(self.get_arg_type((action,arg)))
                self.type_combinations[len(arg_combi)].add(type_combi)
        return self.type_combinations

    def get_all_patterns_for_typecombination(self, type_combination) -> set[pt.PatternT]:
        type_combination = self.update_type_combination(type_combination)
        if type_combination in self.all_patterns_per_type_combination:
            return self.all_patterns_per_type_combination[type_combination]
        else:
            res = set()
            for action, arity in self.action_arities.items():
                options = list()
                for types, uses in sorted(type_combination.items()):
                    opt = list()
                    for (act,arg) in self.type_args[types]:
                        if act == action:
                            opt.append(arg)
                    if len(opt) < uses:
                        #break inner loop as this action does not match the type_combination
                        options = None
                        break
                    options.append(list(itertools.permutations(opt, uses)))
                if options is not None:
                    #options is a list of lists of tuples of arguments(ints)
                    for option in itertools.product(*options):
                        #option is a list of tuples of arguments, the tuples need to be merged
                        pattern = (action, tuple(arg for args in option for arg in args))
                        res.add(pattern)
            #the content of res is deterministic so no issue in safely overwriting the same key
            self.all_patterns_per_type_combination[type_combination] = res
            return self.all_patterns_per_type_combination[type_combination]

    def get_all_groundings_for_typecombination(self, type_combination):
        type_combination = self.update_type_combination(type_combination)
        if type_combination in self.all_groundings_per_type_combination:
            return self.all_groundings_per_type_combination[type_combination]
        else:
            #dict instance : list
            self.all_groundings_per_type_combination[type_combination] = dict()
            options = dict()
            summed_uses = 0
            for types, uses in sorted(type_combination.items()):
                summed_uses += uses
                opt = dict()
                for (inst, obj) in self.type_objs[types]:
                    if inst in opt:
                        opt[inst].append(obj)
                    else:
                        opt[inst] = [obj]
                for inst in opt.keys():
                    for _ in range(uses):
                        if inst in options:
                            options[inst].append(opt[inst])
                        else:
                            options[inst] = [opt[inst]]
            if summed_uses == 0:
                for inst in self.known_instances:
                    options[inst] = list()
            #Remove instances that dont have enough objects
            #to build the type_combination
            for inst, option in list(options.items()):
                if len(option) < summed_uses:
                    del options[inst]
            #options is a dict instance : list of lists of objects
            for inst, option in options.items():
                for opt in itertools.product(*option):
                    if inst in self.all_groundings_per_type_combination[type_combination]:
                        self.all_groundings_per_type_combination[type_combination][inst].add(opt)
                    else:
                        self.all_groundings_per_type_combination[type_combination][inst] = {opt}
            return self.all_groundings_per_type_combination[type_combination]
