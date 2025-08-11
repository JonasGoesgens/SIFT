from py_separator_utils.feature import Feature
from py_separator_utils.object_types import LOCM_Types
import py_separator_utils.py_types as pt
from typing import List
class PDDLGenerator:
    def __init__(self):
        self.type_mapping = dict()
        self.predicate_base_names = dict()
        self.predicates = dict()
        self.predicate_name_mapping = dict()
        self.action_arg_names = dict()
        self.action_add_effects = dict()
        self.action_del_effects = dict()
        self.action_preconditions = dict()
        self.initial_states = dict()
        self.locm_types = None

    def import_feature(self,
        feature : Feature,
        all_atoms : pt.SetLike[pt.GroundingInstT] = set()
    ) -> None:
        if feature.is_invalid():
            return
        for split_number in range(feature.get_number_of_split_combinations()):
            effects = [None] * 2
            preconditions = [None] * 2
            atoms = [None] * 2
            (
                effects[0],
                effects[1],
                preconditions[0],
                preconditions[1],
                _,
                atoms[0],
                atoms[1]
            ) = feature.get_color_split_combination(split_number)
            for sign in {0,1}:
                if feature not in self.predicate_base_names:
                    self.predicate_base_names[feature] = f"Feature_{len(self.predicate_base_names)}"
                if (feature, split_number, sign) not in self.predicates:
                    self.predicates[(feature, split_number, sign)] = f"{self.predicate_base_names[feature]}_v{split_number}_s{sign}"
                    self.predicate_name_mapping[
                        self.predicates[(feature, split_number, sign)]
                    ] = (feature, split_number, sign)
                for effect in effects[sign]:
                    action = effect[0]
                    arg_grounding = effect[1]
                    self.action_add_effects[action].add((
                        self.predicates[(feature, split_number, sign)],
                        arg_grounding
                    ))
                for effect in effects[1-sign]:
                    action = effect[0]
                    arg_grounding = effect[1]
                    self.action_del_effects[action].add((
                        self.predicates[(feature, split_number, sign)],
                        arg_grounding
                    ))
                for precondition in preconditions[sign]:
                    action = precondition[0]
                    arg_grounding = precondition[1]
                    self.action_preconditions[action].add((
                        self.predicates[(feature, split_number, sign)],
                        arg_grounding
                    ))
                for atom in atoms[sign].union(
                    #Also include unknown atoms to the true atoms
                    all_atoms.difference(atoms[1-sign])
                ):
                    instance = atom[0]
                    obj_grounding = atom[1]
                    self.initial_states[instance].add((
                        self.predicates[(feature, split_number, sign)],
                        obj_grounding
                    ))

    def import_sift_result(self,
        locm_types : LOCM_Types,
        admissible_features : List[Feature]
    ):
        self.locm_types = locm_types
        for number, type_id in enumerate(locm_types.type_args.keys()):
            self.type_mapping[type_id] = f"Type{number}"
        for action, arity in locm_types.action_arities.items():
            self.action_add_effects[action] = set()
            self.action_del_effects[action] = set()
            self.action_preconditions[action] = set()
            for arg in range(arity):
                self.action_arg_names[(action, arg)] = f"?Arg{arg}"
        for instance in locm_types.known_instances:
            self.initial_states[instance] = set()
        all_atoms_dict = dict()
        for arity, type_combinations in locm_types.get_all_type_combinations().items():
            for type_combination in type_combinations:
                all_atoms_dict[type_combination] = set()
                print(type_combination)
                for instance, groundings in locm_types.get_all_groundings_for_typecombination(
                    type_combination
                ).items():
                    for grounding in groundings:
                        all_atoms_dict[type_combination].add((
                            instance, grounding
                        ))
        for feature in admissible_features:
            if feature.is_invalid():
                continue
            #if not feature.has_unique_colouring():
            #    continue
            self.import_feature(
                feature,
                all_atoms_dict.get(
                    locm_types.update_type_combination(
                        feature.get_type_combination()
                    ), set()
                )
            )

    def get_domain_pddl(self, name : str) -> str:
        pddl_str =          f"(define (domain {name})\n"
        #requirements
        pddl_str +=          "  (:requirements :typing :strips)\n"
        #types
        pddl_str +=          "  (:types\n"
        for type_name in self.type_mapping.values():
            pddl_str +=     f"    {type_name} - object\n"
        pddl_str +=          "  )\n"
        #predicates
        pddl_str +=          "  (:predicates\n"
        predicate_str_list = list()
        for name, (feature, _, _) in self.predicate_name_mapping.items():
            predicate_str = f"({name}"
            pos = 0
            for type_id, count in sorted(feature.get_type_combination().items()):
                type_id = self.locm_types.get_current_id_of_type(type_id)
                for _ in range(count):
                    predicate_str += f" ?Arg{pos} - {self.type_mapping[type_id]}"
                    pos += 1
            predicate_str += ")"
            predicate_str_list.append(predicate_str)
        pddl_str +=          "    " + "\n    ".join(predicate_str_list) + "\n"
        pddl_str +=          "  )\n"
        #actions
        for action, arity in self.locm_types.action_arities.items():
            pddl_str +=     f"  (:action {action}\n"
            #arguments
            if arity:
                params = [
                    f"?Arg{i} - {self.type_mapping[self.locm_types.get_arg_type((action, i))]}"
                    for i in range(arity)
                ]
                pddl_str += f"    :parameters ({' '.join(params)})\n"
            #preconditions
            precondition_str_list = list()
            precondition_str_chunks = list()
            for predicate_name, arg_grounding in self.action_preconditions[action]:
                precondition_str = f"({predicate_name}"
                for arg in arg_grounding:
                    precondition_str += f" {self.action_arg_names[(action, arg)]}"
                precondition_str += ")"
                if len(precondition_str_list) < 4:
                    precondition_str_list.append(precondition_str)
                else:
                    precondition_str_chunks.append(" ".join(precondition_str_list))
                    precondition_str_list = list()
            if precondition_str_list:
                precondition_str_chunks.append(" ".join(precondition_str_list))
            if precondition_str_chunks:
                pddl_str +=  "    :precondition (and\n"
                pddl_str +=  "      " + "\n       ".join(precondition_str_chunks) + "\n"
                pddl_str +=  "    )\n"
            #effects
            effect_str_list = list()
            effect_str_chunks = list()
            close_effects = False
            for predicate_name, arg_grounding in self.action_add_effects[action]:
                effect_str = f"({predicate_name}"
                for arg in arg_grounding:
                    effect_str += f" {self.action_arg_names[(action, arg)]}"
                effect_str += ")"
                if len(effect_str_list) < 4:
                    effect_str_list.append(effect_str)
                else:
                    effect_str_chunks.append(" ".join(effect_str_list))
                    effect_str_list = list()
            if effect_str_list:
                effect_str_chunks.append(" ".join(effect_str_list))
            if effect_str_chunks:
                pddl_str +=  "    :effect (and\n"
                pddl_str +=  "      " + "\n       ".join(effect_str_chunks) + "\n"
                close_effects = True
            effect_str_list = list()
            effect_str_chunks = list()
            for predicate_name, arg_grounding in self.action_del_effects[action]:
                effect_str = f"(not ({predicate_name}"
                for arg in arg_grounding:
                    effect_str += f" {self.action_arg_names[(action, arg)]}"
                effect_str += "))"
                if len(effect_str_list) < 4:
                    effect_str_list.append(effect_str)
                else:
                    effect_str_chunks.append(" ".join(effect_str_list))
                    effect_str_list = list()
            if effect_str_list:
                effect_str_chunks.append(" ".join(effect_str_list))
            if effect_str_chunks:
                pddl_str +=  "      " + "\n      ".join(effect_str_chunks) + "\n"
                close_effects = True
            if close_effects:
                pddl_str +=  "    )\n"
            pddl_str +=      "  )\n"
            #closing domain
            pddl_str +=      ")\n"
        return pddl_str

    def get_instance_pddl(self, name : str, instance : int, goal) -> str:
        pddl_str =  f"(define (problem {name}-{instance})\n"
        pddl_str += f"(:domain {name})\n"
        #objects

        #initial state

        #goal condition

        #closing problem
        pddl_str += ")\n"
        return pddl_str
