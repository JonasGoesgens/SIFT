
class StratificationError(Exception):
    """Execption for issues with applying a previous stratification."""
    def __init__(self, iteration: int, message: str):
        super().__init__(message)
        self.iteration = iteration
