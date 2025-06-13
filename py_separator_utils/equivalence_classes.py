from typing import Generic, TypeVar, Iterator, Optional
import py_separator_utils.py_types as pt
T = TypeVar('T')
class EquivalenceClasses(Generic[T]):
    def __init__(self):
        self._equivalences = list()
        self._invalid_items = set()
    
    def add_relation(self, relation : tuple[pt.SetLike[T],pt.SetLike[T]]) -> None:
        #make a copy to block exernal manipulation and unfreeze if needed
        new_relation = (set(relation[0]),set(relation[1]))

        for i in range(len(self._equivalences) - 1, -1, -1):
            relation = self._equivalences[i]
            if (
                new_relation[0].intersection(relation[0]) or 
                new_relation[1].intersection(relation[1])
            ):
                new_relation[0].update(relation[0])
                new_relation[1].update(relation[1])
                del self._equivalences[i]
            elif (
                new_relation[0].intersection(relation[1]) or 
                new_relation[1].intersection(relation[0])
            ):
                new_relation[0].update(relation[1])
                new_relation[1].update(relation[0])
                del self._equivalences[i]

        if new_relation[0].intersection(new_relation[1]):
            #invalid equivalence/inverse relation
            #update both sets with eachother to faster detect further invalid situations
            new_relation[1].update(new_relation[0])
            new_relation[0].update(new_relation[1])
            self._invalid_items.update(new_relation[0])

        if new_relation[0] or new_relation[1]:
            #freeze the sets for later use in sets, they will never be change from here again.
            new_relation = (frozenset(new_relation[0]), frozenset(new_relation[1]))
            self._equivalences.append(new_relation)


    def __str__(self) -> str:
        equivalence_str = ", ".join([f"{rel[0]} <-> {rel[1]}" for rel in self._equivalences])
        invalid_str = ", ".join(map(str, self._invalid_items))
        
        return f"EquivalenceClasses:\n{equivalence_str}\Invalid Elements: {invalid_str}"

    def filter_relations(self, filter_set : pt.SetLike[T]) -> set[tuple[frozenset[T],frozenset[T]]]:
        output = set()
        for relation in self._equivalences:
            rel = (frozenset(relation[0].intersection(filter_set)),frozenset(relation[1].intersection(filter_set)))
            if rel[0] or rel[1]:
                output.add(rel)
        return output

    def update(self, other : 'EquivalenceClasses[T]'):
        for relation in other._equivalences:
            self.add_relation(relation)
        self._invalid_items.update(other._invalid_items)

    def get_invalid_elements(self) -> set[T]:
        return set(self._invalid_items)

    def get_listed_elements(self) -> set[T]:
        output = set()
        for relation in self._equivalences:
            output.update(relation[0])
            output.update(relation[1])
        return output

    def get_valid_related_groups(self,
        invalid_items : Optional[pt.SetLike[T]] = None
    ) -> set[frozenset[T]]:
        if invalid_items is None:
            invalid_items = self._invalid_items
        output = set()
        for relation in self._equivalences:
            group = frozenset(relation[0].union(relation[1]))
            if not group.intersection(invalid_items):
                output.add(group)
        return output

    def filter_valid_related_groups(self,
        filter_set : pt.SetLike[T],
        invalid_items : Optional[pt.SetLike[T]] = None
    ) -> set[frozenset[T]]:
        output = set()
        for group in self.get_valid_related_groups(invalid_items):
            rel = frozenset(group.intersection(filter_set))
            if rel:
                output.add(rel)
        return output

    def is_equivalent(self, elem1, elem2):
        if elem1 in self._invalid_items or elem2 in self._invalid_items:
            return False
        
        for equivalence_set_group in self._equivalences:
            for equivalence_set in equivalence_set_group:
                if elem1 in equivalence_set and elem2 in equivalence_set:
                    return True

        return False