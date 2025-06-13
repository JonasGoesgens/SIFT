import typing
import networkx as nx
import py_separator_utils.hashable_multiset as hm
ActionT = typing.Union[int, str]
#ActtionT is the identifier of an action, represented by an int or string
ArityInfoT = typing.Dict[ActionT, int]
#ArityInfoT gives the arity of all actions.
TypeT = int
#TypeT is the type of an object or action argument represented by an int
TypeCombi = hm.Multiset[TypeT]
#An ArgPos consist of the action id and the index of the argument
ArgPosT = typing.Tuple[ActionT,int]
#An Object is represented by an int as id
ObjectT = int
#ObjectNotKnown used to fill arguments for with the object is unknown.
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
#Sets of used types
T = typing.TypeVar('T')
SetLike = typing.Union[typing.Set[T], typing.FrozenSet[T]]
FrozenPowerSet = typing.FrozenSet[typing.FrozenSet[T]]
#IntSetLike = typing.Union[typing.Set[int], typing.FrozenSet[int]]
#PatternTSetLike = typing.Union[typing.Set[PatternT], typing.FrozenSet[PatternT]]
PatternTSetLike = SetLike[PatternT]