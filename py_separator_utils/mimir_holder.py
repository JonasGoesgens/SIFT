import pymimir
from pymimir import PDDLParser, StateSpace, PDDLParser

class mimir_holder:

    def __init__(self, domain_path, problem_path):
        self.domain_path = domain_path
        self.problem_path = problem_path
        self.complete_statespace = None
        self.object_mapping = None
        self.action_mapping = None
        self.action_arity = None
        self.AAG = None
        self.SSG = None
        self.pddl_parser = PDDLParser(self.domain_path, self.problem_path)

    def get_parser(self):
        return self.pddl_parser

    def get_complete_statespace(self):
        if self.complete_statespace is None:
            self.complete_statespace = StateSpace.create(self.domain_path, self.problem_path)
        return self.complete_statespace

    def get_object_mapping(self):
        if self.object_mapping is None:
            self.object_mapping = {_obj.get_name(): _obj_num for _obj_num, _obj in enumerate(self.pddl_parser.get_problem().get_objects())}
        return self.object_mapping

    def get_action_mapping_and_arity(self):
        if self.action_mapping is None:
            self.action_mapping = {_act.get_name(): _act_num for _act_num, _act in enumerate(self.pddl_parser.get_domain().get_actions())}
            self.action_arity = {self.action_mapping[_act.get_name()]: _act.get_arity() for _act in self.pddl_parser.get_domain().get_actions()}
        return self.action_mapping, self.action_arity

    def get_domain_name(self):
        return self.pddl_parser.get_domain().get_name()

    def get_AAG(self):
        if self.AAG is None:
            self.AAG = pymimir.LiftedAAG(self.pddl_parser.get_problem(), self.pddl_parser.get_factories())
        return self.AAG

    def get_SSG(self):
        if self.SSG is None:
            self.SSG = pymimir.SuccessorStateGenerator(self.get_AAG())
        return self.SSG
    
    def print_state(self, state):
        return [[atom.get_predicate().get_name(), [obj.get_name() for obj in atom.get_objects()]] for atom in self.pddl_parser.get_factories().get_fluent_ground_atoms_from_ids(state.get_fluent_atoms())]

    def get_applicable_actions(self, state):
        return self.get_AAG().compute_applicable_actions(state)

    def get_successor_state(self, state, action):
            return self.get_SSG().get_or_create_successor_state(state, action)