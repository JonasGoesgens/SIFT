from typing import Generic, TypeVar, Iterator
T = TypeVar('T')
class Multiset(Generic[T]):
    def __init__(self, elements = None):
        self.elements = dict()
        self.is_frozen = False

        if elements is not None:
            if isinstance(elements, (list, set, tuple)):
                for element in elements:
                    self.add(element)

    def add(self, element):
        if self.is_frozen:
            raise RuntimeError("Cannot modify a frozen multiset.")
        if element in self.elements:
            self.elements[element] += 1
        else:
            self.elements[element] = 1

    def remove(self, element):
        if self.is_frozen:
            raise RuntimeError("Cannot modify a frozen multiset.")
        if element in self.elements:
            if self.elements[element] > 1:
                self.elements[element] -= 1
            else:
                del self.elements[element]

    def count(self, element):
        return self.elements.get(element, 0)

    def items(self) -> Iterator[T]:
        for element, count in self.elements.items():
            yield (element, count)

    def __iter__(self) -> Iterator[T]:
        return iter(self.elements.keys())

    def __hash__(self):
        self.is_frozen = True
        return hash(tuple(sorted(self.elements.items())))

    def __eq__(self, other):
        if isinstance(other, Multiset):
            return self.elements == other.elements
        return False

    def __lt__(self, other):
        if isinstance(other, Multiset):
            #sort first by multisetsize
            sum_self = sum(self.elements.values())
            sum_other = sum(other.elements.values())
            
            if sum_self != sum_other:
                return sum_self < sum_other

            items_self = sorted(self.items())
            items_other = sorted(other.items())

            for (element_self, count_self), (element_other, count_other) in zip(items_self, items_other):
                if element_self != element_other:
                    #one side has a smaller next element
                    return element_self < element_other
                if count_self != count_other:
                    #one side has more of the smallest differing element,
                    #thus less of larger ones
                    return count_self > count_other

            #multisets equall
            return False
        
        return NotImplemented

    def __repr__(self):
        return f"Multiset({self.elements})"
