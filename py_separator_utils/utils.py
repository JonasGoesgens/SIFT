import typing
import itertools
import py_separator_utils.py_types as pt
class UniqueIDAllocator:
    def __init__(self):
        self.next_free_id = 0

    def take_free_id(self) -> int:
        id = self.next_free_id
        self.next_free_id += 1
        return id

T = typing.TypeVar('T')
def power_set_without_empty_set(input_set : pt.SetLike[T]) -> pt.FrozenPowerSet[T] :
    s = list(input_set)
    ps_list = []
    for r in range(1,len(s)+1):
        ps_list.extend(frozenset(elem_set) for elem_set in itertools.combinations(s, r))
    return frozenset(ps_list)
