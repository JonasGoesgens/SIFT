from py_separator_utils.feature import Feature
from py_separator_utils.object_types import LOCM_Types
import py_separator_utils.py_types as pt
from typing import Iterable, List, Dict, Set, Tuple
class PDDLGenerator:
    def __init__(self, display_chunk_size : int = 4):
        self.type_mapping = dict()
        self.predicate_base_names = dict()
        self.static_predicates = dict()
        self.static_atoms = dict()
        self.predicates = dict()
        self.predicate_name_mapping = dict()
        self.action_arg_names = dict()
        self.action_add_effects = dict()
        self.action_del_effects = dict()
        self.action_preconditions = dict()
        self.object_names_dict = dict()
        self.initial_states = dict()
        self.locm_types = None
        self.display_chunk_size = display_chunk_size

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
                for precondition in preconditions[sign].union(effects[1-sign]):
                    #Also include all delete effects as preconditions
                    #as the domain has to be well-formed
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
        admissible_features : Iterable[Feature],
        all_ground_edges : Dict[int,Set[pt.Ground_Edge_Info]]
    ):
        self.locm_types = locm_types
        for number, type_id in enumerate(locm_types.type_args.keys()):
            self.type_mapping[type_id] = f"Type{number}"
        for action, arity in locm_types.action_arities.items():
            self.action_add_effects[action] = set()
            self.action_del_effects[action] = set()
            self.action_preconditions[action] = set()
            self.static_predicates[action] = f"Static_{action}"
            for arg in range(arity):
                self.action_arg_names[(action, arg)] = f"?Arg{arg}"
        for instance in locm_types.known_instances:
            self.initial_states[instance] = set()
            self.object_names_dict[instance] = dict()
        all_atoms_dict = dict()
        for arity, type_combinations in locm_types.get_all_type_combinations().items():
            for type_combination in type_combinations:
                all_atoms_dict[type_combination] = set()
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
        for type_obj, inst_objects in locm_types.type_objs.items():
            for instance in locm_types.known_instances:
                self.object_names_dict[instance][type_obj] = dict()
            for instance, obj in inst_objects:
                self.object_names_dict[instance][type_obj][obj] = f"{self.type_mapping[type_obj]}_I{instance}_Obj{obj}"
        for instance, type_obj_names_dict in self.object_names_dict.items():
            for type_obj, names_dict in type_obj_names_dict.copy().items():
                if not len(names_dict):
                    del self.object_names_dict[instance][type_obj]
        for instance, all_edge_labels in all_ground_edges.items():
            self.static_atoms[instance] = set()
            for action, obj_grounding in all_edge_labels:
                self.static_atoms[instance].add((
                    self.static_predicates[action],obj_grounding
                ))

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
        for action, name in self.static_predicates.items():
            predicate_str = f"({name}"
            for arg in range(self.locm_types.action_arities[action]):
                type_id = self.locm_types.get_arg_type((action,arg))
                predicate_str += f" ?Arg{arg} - {self.type_mapping[type_id]}"
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
                precondition_str_list.append(precondition_str)
                if len(precondition_str_list) >= self.display_chunk_size:
                    precondition_str_chunks.append(" ".join(precondition_str_list))
                    precondition_str_list = list()
            predicate_name = self.static_predicates[action]
            precondition_str = f"({predicate_name}"
            for arg in range(self.locm_types.action_arities[action]):
                precondition_str += f" {self.action_arg_names[(action, arg)]}"
            precondition_str += ")"
            precondition_str_list.append(precondition_str)
            if precondition_str_list:
                precondition_str_chunks.append(" ".join(precondition_str_list))
            if precondition_str_chunks:
                pddl_str +=  "    :precondition (and\n"
                pddl_str +=  "      " + "\n      ".join(precondition_str_chunks) + "\n"
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
                effect_str_list.append(effect_str)
                if len(effect_str_list) >= self.display_chunk_size:
                    effect_str_chunks.append(" ".join(effect_str_list))
                    effect_str_list = list()
            if effect_str_list:
                effect_str_chunks.append(" ".join(effect_str_list))
            if effect_str_chunks:
                pddl_str +=  "    :effect (and\n"
                pddl_str +=  "      " + "\n      ".join(effect_str_chunks) + "\n"
                close_effects = True
            effect_str_list = list()
            effect_str_chunks = list()
            for predicate_name, arg_grounding in self.action_del_effects[action]:
                effect_str = f"(not ({predicate_name}"
                for arg in arg_grounding:
                    effect_str += f" {self.action_arg_names[(action, arg)]}"
                effect_str += "))"
                effect_str_list.append(effect_str)
                if len(effect_str_list) >= self.display_chunk_size:
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

    def get_instance_pddl(
        self,
        name : str,
        instance : int,
        goal : List[Tuple[Feature, int, int, pt.GroundingT]] = list()
    ) -> str:
        if instance not in self.locm_types.known_instances:
            return ""
        pddl_str =         f"(define (problem {name}-{instance})\n"
        pddl_str +=        f"  (:domain {name})\n"
        #objects
        if len(self.object_names_dict[instance]):
            pddl_str +=     "  (:objects\n"
            for type_obj, names_dict in self.object_names_dict[instance].items():
                pddl_str += "    "
                for name in names_dict.values():
                    pddl_str += f"{name} "
                pddl_str += f"- {self.type_mapping[type_obj]}\n"
            pddl_str +=     "  )\n"
        #initial state
        atom_str_list = list()
        atom_str_chunks = list()
        for atom_predicate, atom_grounding in self.initial_states[instance].union(
            self.static_atoms[instance]
        ):
            atom_str = f"({atom_predicate}"
            for obj in atom_grounding:
                type_obj = self.locm_types.get_obj_type((instance, obj))
                atom_str += f" {self.object_names_dict[instance][type_obj][obj]}"
            atom_str += ")"
            atom_str_list.append(atom_str)
            if len(atom_str_list) >= self.display_chunk_size:
                atom_str_chunks.append(" ".join(atom_str_list))
                atom_str_list = list()
        if atom_str_list:
            atom_str_chunks.append(" ".join(atom_str_list))
        if atom_str_chunks:
            pddl_str +=  "  (:init\n"
            pddl_str +=  "    " + "\n    ".join(atom_str_chunks) + "\n"
            pddl_str +=  "  )\n"
        #goal condition
        atom_str_list = list()
        atom_str_chunks = list()
        for feature, variant, sign, atom_grounding in goal:
            atom_str = f"({self.predicates[(feature, variant, sign)]}"
            for obj in atom_grounding:
                type_obj = self.locm_types.get_obj_type((instance, obj))
                atom_str += f" {self.object_names_dict[instance][type_obj][obj]}"
            atom_str += ")"
            atom_str_list.append(atom_str)
            if len(atom_str_list) >= self.display_chunk_size:
                atom_str_chunks.append(" ".join(atom_str_list))
                atom_str_list = list()
        if atom_str_list:
            atom_str_chunks.append(" ".join(atom_str_list))
        if atom_str_chunks:
            pddl_str +=  "  (:goal\n"
            pddl_str +=  "    (and\n"
            pddl_str +=  "      " + "\n      ".join(atom_str_chunks) + "\n"
            pddl_str +=  "    )\n"
            pddl_str +=  "  )\n"

        #closing problem
        pddl_str += ")\n"
        return pddl_str
