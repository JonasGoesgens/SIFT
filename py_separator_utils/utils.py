import typing
import itertools
import time
import sys
import py_separator_utils.py_types as pt
class UniqueIDAllocator:
    def __init__(self):
        self.next_free_id = 0

    def take_free_id(self) -> int:
        id = self.next_free_id
        self.next_free_id += 1
        return id

    def reserve_ids_upto(self, id : int):
        self.next_free_id = max(self.next_free_id, id + 1)

T = typing.TypeVar('T')
def power_set_without_empty_set(
    input_set : pt.SetLike[T]
) -> pt.FrozenPowerSet[T] :
    s = list(input_set)
    ps_list = []
    for r in range(1,len(s)+1):
        ps_list.extend(frozenset(elem_set) for elem_set in itertools.combinations(s, r))
    return frozenset(ps_list)

def pack_into_frozensets(input_set: set[T]) -> set[frozenset[T]]:
    return {frozenset([obj]) for obj in input_set}

def extract_from_double_packed_frozensets(
    input_collection: set[frozenset[frozenset[T]]]
) -> set[frozenset[T]]:
    result_set = set()

    for frozen_set in input_collection:
        res_set = set()
        for pack_set in frozen_set:
            res_set.update(pack_set)
        result_set.add(frozenset(res_set))

    return result_set

def safe_copy(value : T) -> T:
    return value.copy() if value is not None else None

def format_cur_time() -> str:
    return time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())

def tuple_get(tup, index, default=None):
    try:
        return tup[index]
    except IndexError:
        return default

class Progressbar:
    def __init__(self, total : int, max_updates : int = 100):
        self.total = total
        self.done  = 0
        self.bar_len = 30
        self.update_len = int(total/max_updates + 1)
        self.update_pos = 0

    def _render(self) -> None:
        filled = int(self.done / self.total * self.bar_len)
        empty  = self.bar_len - filled
        percent = int(self.done / self.total * 100)
        return f'\r{format_cur_time()} [{"#" * filled}{"-" * empty}] {percent:3d}% ({self.done}/{self.total})'

    def print_current(self) -> None:
        sys.stdout.write(self._render())
        sys.stdout.flush()

    def increment_count(self, amount : int = 1) -> None:
        self.done += 1
        if self.done >= self.update_pos:
            self.update_pos += self.update_len
            sys.stdout.write(self._render())
            sys.stdout.flush()

    def print_final(self) -> None:
        sys.stdout.write(self._render())
        sys.stdout.write('\n')
        sys.stdout.flush()
