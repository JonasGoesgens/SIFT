action_arity("stack", 2).
action_arity("move", 3).
action_arity("newtower", 2).
feature_usable(1) :- arg_known("stack", 0), arg_known("stack", 1), arg_known("newtower", 0), arg_known("move", 0), arg_known("move", 2).
feature_usable(0) :- arg_known("move", 0), arg_known("move", 1), arg_known("move", 2), arg_known("stack", 0), arg_known("stack", 1), arg_known("newtower", 1).
arg_known("newtower", 0) :- feature_usable(0).
arg_known("move", 1) :- feature_usable(1).
arg_known("newtower", 1) :- feature_usable(1).
arg_known("move", 0) :- feature_usable(0).
