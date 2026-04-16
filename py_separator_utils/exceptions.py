
class StratificationError(Exception):
    """Execption for logical issues with applying a previous stratification."""
    def __init__(self, iteration: int, message: str):
        super().__init__(message)
        self.iteration = iteration

class ExecutionError(Exception):
    """Execption for technical issues with applying a previous stratification."""
    def __init__(self, iteration: int, message: str):
        super().__init__(message)
        self.iteration = iteration
