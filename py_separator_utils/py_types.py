import typing
import networkx as nx
import py_separator_utils.hashable_multiset as hm
ActionT = typing.Union[int, str]
#ActionT is the identifier of an action, represented by an int or string
ArityInfoT = typing.Dict[ActionT, int]
#ArityInfoT gives the arity of all actions.
TypeT = int
#TypeT is the type of an object or action argument represented by an int
TypeCombi = hm.Multiset[TypeT]
#An ArgPos consist of the action id and the index of the argument
ArgPosT = typing.Tuple[ActionT,int]
#An Object is represented by an int as id
ObjectT = int
#ObjectNotExisting is the valeu used to indicate that there exists no object
#that could be identified.
ObjectNotExisting = -1
#ObjectNotKnown used to fill arguments for with the object is unknown.
#ObjectNotKnown the relation is working but there is no known value which
#object was identified
ObjectNotKnown = -2
#ObjectInstT combines an object id with its instance id as a tuple (inst,obj)
ObjectInstT = typing.Tuple[int,ObjectT]
#Grounding is a tuple of objects represented by int identifiers
GroundingT = typing.Tuple[ObjectT]
#GroundingKey is a frozenset of objects represented by int identifiers
GroundingKeyT = typing.FrozenSet[ObjectT]
#pattern is a tuple holding an int and a tuple of ints
#the first in represents the action
#the other int represent the ordered objects that are relevant arguments
PatternT = typing.Tuple[ActionT,typing.Tuple[int]]
#Ground_Edge_Info is a tupel holding an int for the action 
#and a tuple of ints for the grounded objects that were used as arguments
#It has different usecases as PatterT
Ground_Edge_Info = typing.Tuple[ActionT,typing.Tuple[int]]
#Edge_Label is a set of Ground_Edge_Info holding all actions that caused this edge
Edge_LabelT = set[Ground_Edge_Info]
#Graph is a nx.digraph
GraphT = nx.DiGraph
#Graph edges are annotated with the key action
#Nodes are represented as int
NodeT = int
#A Node or State label gives all states merged into this state for merged graphs.
State_LabelT = typing.Set[NodeT]
#an edge is a 3 tuple [start, end, Edge_LabelT]
EdgeT = typing.Tuple[NodeT,NodeT,Edge_LabelT]
#ColorSplitT a color split is a list of 6 sets.
#The sets come in pairs, objects in the same set have the same sign.
#The first two state effects.
#The next two sets state preconditions.
#The last two sets state initial atoms by instance and grounding.
ColorSplitT = typing.Tuple[
    typing.Set[PatternT],
    typing.Set[PatternT],
    typing.Set[PatternT],
    typing.Set[PatternT],
    typing.Set[typing.Tuple[int,GroundingT]],
    typing.Set[typing.Tuple[int,GroundingT]]
]
#PreconditionSplitT is structured like the ColorSplit type yet
#the content of the sets holding the preconditions [2-3] differs.
PreconditionSplitT = ColorSplitT
#argument feature assigment stores output information, not used for calculation.
#with argument of which action was recovered by which oi feature with which pattern.
Arg_Feature_AssignmentT = typing.Dict[ActionT, typing.Dict[
    int, typing.Tuple['Ordered_Identifier_Feature', PatternT]
]]
#Sets of used types
T = typing.TypeVar('T')
SetLike = typing.Union[typing.Set[T], typing.FrozenSet[T]]
FrozenPowerSet = typing.FrozenSet[typing.FrozenSet[T]]
#IntSetLike = typing.Union[typing.Set[int], typing.FrozenSet[int]]
#PatternTSetLike = typing.Union[typing.Set[PatternT], typing.FrozenSet[PatternT]]
PatternTSetLike = SetLike[PatternT]