% Input:
% action_arity(Action, Arity)
% feature_usable(Feature) rules
% arg_known(Action, Arg) rules
action_argument(Action, Arg) :- Arg = 0..Arity-1, action_arity(Action, Arity).
{arg_given(Action, Arg) : action_argument(Action, Arg)} Arity :- action_arity(Action, Arity).
arg_known(Action, Arg) :- arg_given(Action, Arg).
:- action_argument(Action, Arg), not arg_known(Action, Arg).
#minimize{1@1, arg_given(Action, Arg) : arg_given(Action, Arg)}.
#show arg_given/2.
