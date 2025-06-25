action_arity("unstack", 2).
action_arity("stack", 2).
action_arity("pick-up", 1).
action_arity("put-down", 1).
feature_usable(2) :- arg_known("stack", 0), arg_known("stack", 1), arg_known("unstack", 1).
feature_usable(1) :- arg_known("unstack", 0), arg_known("pick-up", 0).
feature_usable(0) :- arg_known("stack", 0), arg_known("stack", 1), arg_known("unstack", 0).
arg_known("unstack", 1) :- feature_usable(0).
arg_known("put-down", 0) :- feature_usable(1).
arg_known("stack", 0) :- feature_usable(1).
arg_known("unstack", 0) :- feature_usable(2).
