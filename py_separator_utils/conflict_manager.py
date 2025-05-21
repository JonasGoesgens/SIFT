from typing import Generic, TypeVar

T = TypeVar('T')

class ConflictManager(Generic[T]):
    def __init__(self):
        self._conflicts = set()  # Set zur Speicherung von Konflikten

    def add_conflict(self, item1: T, item2: T) -> None:
        """Adds a conflict between two elements."""
        conflict_pair = frozenset({item1, item2})
        self._conflicts.add(conflict_pair)

    def has_conflict(self, item1: T, item2: T) -> bool:
        """Check for a conflict between two elements."""
        conflict_pair = frozenset({item1, item2})
        return conflict_pair in self._conflicts

    def has_conflict_between_sets(self, set1: set[T], set2: set[T]) -> bool:
        """Compare two sets for having a conflict."""
        for item1 in set1:
            for item2 in set2:
                if self.has_conflict(item1, item2):
                    return True
        return False

    def get_conflicts(self) -> set[frozenset[T]]:
        """Return all Conflicts."""
        return self._conflicts.copy()

    def __str__(self) -> str:
        """Get a printable string representation of conflicts."""
        conflicts_str = ", ".join(map(str, self._conflicts))
        return f"Conflicts: {conflicts_str if conflicts_str else 'No known Conflicts.'}"

    def find_non_conflicting_elements(self, element: T, candidates: set[T]) -> set[T]:
        """
        Returns a set of elements from 'candidates' that are non-conflicting with 'element'.

        :param element: The element to check conflicts against.
        :param candidates: A set of candidate elements to check.

        :return: A set of non-conflicting elements.
        """
        non_conflicting = {candidate for candidate in candidates if not self.has_conflict(element, candidate)}
        
        return non_conflicting
