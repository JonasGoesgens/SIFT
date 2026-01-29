%input:
%objects((instance,object))
%obj_type(type,(instance,object))
%types(type)"
%action_possible(action,instance,((instance,type),(instance,type),...))
%mapping_matrix(arity1,arity2,Mapping_vec,Source_vec,Target_vec)
%Mapping_vec=(1,2)
%Source_vec=(Arg1=(instance,object),Arg2)
%Target_vec=(Arg1=(instance,object),Arg2,Arg3)
%arity1 <= arity2
%Mapping_vet subset N^arity1
%Source_vec subset O^arity1
%Target_vec subset O^arity2
max_static_predicates(M) :- max_arity(M), {max_static_predicates(N):N!=M} = 0.
{static_pred(1..M)}M :- max_static_predicates(M).
{static_pred_arity(P,1..M)} = 1 :- static_pred(P), max_arity(M).
%symmetry breaking of guessed predicates
:- static_pred(P), P>1, not static_pred(P-1).
:- static_pred_arity(P,A), static_pred_arity(P2,A2), P<P2, A>A2.

%arguments to map with the matrix:
argument(Arg, "object"):-objects(Arg).

-action_possible(Action, Instance, Arg) :- action_candidate(Action, Instance, Arg), not action_possible(Action, Instance, Arg).

{static_prec(P,Action,Perm):mapping_permutations(ArrP,ArrA,Perm),action_arity(Action,ArrA)}:- static_pred_arity(P,ArrP).
static_atom(P,ArgP) :- static_prec(P,Action,Perm),static_pred_arity(P,ArrP),action_arity(Action,ArrA),mapping_matrix(ArrP,ArrA,Perm,ArgP,ArgA),action_possible(Action,_,ArgA).
{-static_atom(P,Arg) : argument_tuple("object",Arr,Arg)}:-static_pred_arity(P,Arr).
:- static_atom(P,Arg), -static_atom(P,Arg).
covered(Action, Inst, ArgA) :- -action_possible(Action, Inst, ArgA), -static_atom(P,ArgP), static_prec(P,Action,Perm), static_pred_arity(P,ArrP), action_arity(Action,ArrA), mapping_matrix(ArrP,ArrA,Perm,ArgP,ArgA).

#minimize{1@2,Action, Inst, ArgA : -action_possible(Action, Inst, ArgA),not covered(Action, Inst, ArgA)}.
#minimize{1@2,P,Arg : -static_atom(P,Arg)}.
#minimize{1@2,P,Arg : static_atom(P,Arg)}.
#minimize{1@1,P : static_pred(P)}.
#minimize{1@0,P,Action,Perm : static_prec(P,Action,Perm)}.
%#show -action_possible/3.
#show max_static_predicates/1.
#show static_prec/3.
#show -static_atom/2.
#show static_atom/2.
#show -action_possible(Action, Instance, Arg) : -action_possible(Action, Instance, Arg), not covered(Action, Instance, Arg).
