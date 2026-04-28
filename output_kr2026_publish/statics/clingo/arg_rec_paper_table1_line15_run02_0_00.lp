max_arity(5).
argument_tuple(Type,1,(Arg1)):-argument(Arg1,Type).
mapping_matrix(1,1,(1,),(Arg1),(Arg1)):-argument(Arg1,Type).
mapping_permutations(1,1,(1,)).
argument_tuple(Type,2,(Arg1, Arg2)):-argument(Arg1,Type), argument(Arg2,Type).
mapping_matrix(1,2,(1,),(Arg1),(Arg1, Arg2)):-argument(Arg1,Type), argument(Arg2,Type).
mapping_permutations(1,2,(1,)).
mapping_matrix(1,2,(2,),(Arg2),(Arg1, Arg2)):-argument(Arg1,Type), argument(Arg2,Type).
mapping_permutations(1,2,(2,)).
mapping_matrix(2,2,(1, 2),(Arg1, Arg2),(Arg1, Arg2)):-argument(Arg1,Type), argument(Arg2,Type).
mapping_permutations(2,2,(1, 2)).
mapping_matrix(2,2,(2, 1),(Arg2, Arg1),(Arg1, Arg2)):-argument(Arg1,Type), argument(Arg2,Type).
mapping_permutations(2,2,(2, 1)).
argument_tuple(Type,3,(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_matrix(1,3,(1,),(Arg1),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(1,3,(1,)).
mapping_matrix(1,3,(2,),(Arg2),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(1,3,(2,)).
mapping_matrix(1,3,(3,),(Arg3),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(1,3,(3,)).
mapping_matrix(2,3,(1, 2),(Arg1, Arg2),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(2,3,(1, 2)).
mapping_matrix(2,3,(1, 3),(Arg1, Arg3),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(2,3,(1, 3)).
mapping_matrix(2,3,(2, 1),(Arg2, Arg1),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(2,3,(2, 1)).
mapping_matrix(2,3,(2, 3),(Arg2, Arg3),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(2,3,(2, 3)).
mapping_matrix(2,3,(3, 1),(Arg3, Arg1),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(2,3,(3, 1)).
mapping_matrix(2,3,(3, 2),(Arg3, Arg2),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(2,3,(3, 2)).
mapping_matrix(3,3,(1, 2, 3),(Arg1, Arg2, Arg3),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(3,3,(1, 2, 3)).
mapping_matrix(3,3,(1, 3, 2),(Arg1, Arg3, Arg2),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(3,3,(1, 3, 2)).
mapping_matrix(3,3,(2, 1, 3),(Arg2, Arg1, Arg3),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(3,3,(2, 1, 3)).
mapping_matrix(3,3,(2, 3, 1),(Arg2, Arg3, Arg1),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(3,3,(2, 3, 1)).
mapping_matrix(3,3,(3, 1, 2),(Arg3, Arg1, Arg2),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(3,3,(3, 1, 2)).
mapping_matrix(3,3,(3, 2, 1),(Arg3, Arg2, Arg1),(Arg1, Arg2, Arg3)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type).
mapping_permutations(3,3,(3, 2, 1)).
argument_tuple(Type,4,(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_matrix(1,4,(1,),(Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(1,4,(1,)).
mapping_matrix(1,4,(2,),(Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(1,4,(2,)).
mapping_matrix(1,4,(3,),(Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(1,4,(3,)).
mapping_matrix(1,4,(4,),(Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(1,4,(4,)).
mapping_matrix(2,4,(1, 2),(Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(1, 2)).
mapping_matrix(2,4,(1, 3),(Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(1, 3)).
mapping_matrix(2,4,(1, 4),(Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(1, 4)).
mapping_matrix(2,4,(2, 1),(Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(2, 1)).
mapping_matrix(2,4,(2, 3),(Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(2, 3)).
mapping_matrix(2,4,(2, 4),(Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(2, 4)).
mapping_matrix(2,4,(3, 1),(Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(3, 1)).
mapping_matrix(2,4,(3, 2),(Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(3, 2)).
mapping_matrix(2,4,(3, 4),(Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(3, 4)).
mapping_matrix(2,4,(4, 1),(Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(4, 1)).
mapping_matrix(2,4,(4, 2),(Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(4, 2)).
mapping_matrix(2,4,(4, 3),(Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(2,4,(4, 3)).
mapping_matrix(3,4,(1, 2, 3),(Arg1, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(1, 2, 3)).
mapping_matrix(3,4,(1, 2, 4),(Arg1, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(1, 2, 4)).
mapping_matrix(3,4,(1, 3, 2),(Arg1, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(1, 3, 2)).
mapping_matrix(3,4,(1, 3, 4),(Arg1, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(1, 3, 4)).
mapping_matrix(3,4,(1, 4, 2),(Arg1, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(1, 4, 2)).
mapping_matrix(3,4,(1, 4, 3),(Arg1, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(1, 4, 3)).
mapping_matrix(3,4,(2, 1, 3),(Arg2, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(2, 1, 3)).
mapping_matrix(3,4,(2, 1, 4),(Arg2, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(2, 1, 4)).
mapping_matrix(3,4,(2, 3, 1),(Arg2, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(2, 3, 1)).
mapping_matrix(3,4,(2, 3, 4),(Arg2, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(2, 3, 4)).
mapping_matrix(3,4,(2, 4, 1),(Arg2, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(2, 4, 1)).
mapping_matrix(3,4,(2, 4, 3),(Arg2, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(2, 4, 3)).
mapping_matrix(3,4,(3, 1, 2),(Arg3, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(3, 1, 2)).
mapping_matrix(3,4,(3, 1, 4),(Arg3, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(3, 1, 4)).
mapping_matrix(3,4,(3, 2, 1),(Arg3, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(3, 2, 1)).
mapping_matrix(3,4,(3, 2, 4),(Arg3, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(3, 2, 4)).
mapping_matrix(3,4,(3, 4, 1),(Arg3, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(3, 4, 1)).
mapping_matrix(3,4,(3, 4, 2),(Arg3, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(3, 4, 2)).
mapping_matrix(3,4,(4, 1, 2),(Arg4, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(4, 1, 2)).
mapping_matrix(3,4,(4, 1, 3),(Arg4, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(4, 1, 3)).
mapping_matrix(3,4,(4, 2, 1),(Arg4, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(4, 2, 1)).
mapping_matrix(3,4,(4, 2, 3),(Arg4, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(4, 2, 3)).
mapping_matrix(3,4,(4, 3, 1),(Arg4, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(4, 3, 1)).
mapping_matrix(3,4,(4, 3, 2),(Arg4, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(3,4,(4, 3, 2)).
mapping_matrix(4,4,(1, 2, 3, 4),(Arg1, Arg2, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(1, 2, 3, 4)).
mapping_matrix(4,4,(1, 2, 4, 3),(Arg1, Arg2, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(1, 2, 4, 3)).
mapping_matrix(4,4,(1, 3, 2, 4),(Arg1, Arg3, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(1, 3, 2, 4)).
mapping_matrix(4,4,(1, 3, 4, 2),(Arg1, Arg3, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(1, 3, 4, 2)).
mapping_matrix(4,4,(1, 4, 2, 3),(Arg1, Arg4, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(1, 4, 2, 3)).
mapping_matrix(4,4,(1, 4, 3, 2),(Arg1, Arg4, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(1, 4, 3, 2)).
mapping_matrix(4,4,(2, 1, 3, 4),(Arg2, Arg1, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(2, 1, 3, 4)).
mapping_matrix(4,4,(2, 1, 4, 3),(Arg2, Arg1, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(2, 1, 4, 3)).
mapping_matrix(4,4,(2, 3, 1, 4),(Arg2, Arg3, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(2, 3, 1, 4)).
mapping_matrix(4,4,(2, 3, 4, 1),(Arg2, Arg3, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(2, 3, 4, 1)).
mapping_matrix(4,4,(2, 4, 1, 3),(Arg2, Arg4, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(2, 4, 1, 3)).
mapping_matrix(4,4,(2, 4, 3, 1),(Arg2, Arg4, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(2, 4, 3, 1)).
mapping_matrix(4,4,(3, 1, 2, 4),(Arg3, Arg1, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(3, 1, 2, 4)).
mapping_matrix(4,4,(3, 1, 4, 2),(Arg3, Arg1, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(3, 1, 4, 2)).
mapping_matrix(4,4,(3, 2, 1, 4),(Arg3, Arg2, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(3, 2, 1, 4)).
mapping_matrix(4,4,(3, 2, 4, 1),(Arg3, Arg2, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(3, 2, 4, 1)).
mapping_matrix(4,4,(3, 4, 1, 2),(Arg3, Arg4, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(3, 4, 1, 2)).
mapping_matrix(4,4,(3, 4, 2, 1),(Arg3, Arg4, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(3, 4, 2, 1)).
mapping_matrix(4,4,(4, 1, 2, 3),(Arg4, Arg1, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(4, 1, 2, 3)).
mapping_matrix(4,4,(4, 1, 3, 2),(Arg4, Arg1, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(4, 1, 3, 2)).
mapping_matrix(4,4,(4, 2, 1, 3),(Arg4, Arg2, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(4, 2, 1, 3)).
mapping_matrix(4,4,(4, 2, 3, 1),(Arg4, Arg2, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(4, 2, 3, 1)).
mapping_matrix(4,4,(4, 3, 1, 2),(Arg4, Arg3, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(4, 3, 1, 2)).
mapping_matrix(4,4,(4, 3, 2, 1),(Arg4, Arg3, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type).
mapping_permutations(4,4,(4, 3, 2, 1)).
argument_tuple(Type,5,(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_matrix(1,5,(1,),(Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(1,5,(1,)).
mapping_matrix(1,5,(2,),(Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(1,5,(2,)).
mapping_matrix(1,5,(3,),(Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(1,5,(3,)).
mapping_matrix(1,5,(4,),(Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(1,5,(4,)).
mapping_matrix(1,5,(5,),(Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(1,5,(5,)).
mapping_matrix(2,5,(1, 2),(Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(1, 2)).
mapping_matrix(2,5,(1, 3),(Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(1, 3)).
mapping_matrix(2,5,(1, 4),(Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(1, 4)).
mapping_matrix(2,5,(1, 5),(Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(1, 5)).
mapping_matrix(2,5,(2, 1),(Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(2, 1)).
mapping_matrix(2,5,(2, 3),(Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(2, 3)).
mapping_matrix(2,5,(2, 4),(Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(2, 4)).
mapping_matrix(2,5,(2, 5),(Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(2, 5)).
mapping_matrix(2,5,(3, 1),(Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(3, 1)).
mapping_matrix(2,5,(3, 2),(Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(3, 2)).
mapping_matrix(2,5,(3, 4),(Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(3, 4)).
mapping_matrix(2,5,(3, 5),(Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(3, 5)).
mapping_matrix(2,5,(4, 1),(Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(4, 1)).
mapping_matrix(2,5,(4, 2),(Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(4, 2)).
mapping_matrix(2,5,(4, 3),(Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(4, 3)).
mapping_matrix(2,5,(4, 5),(Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(4, 5)).
mapping_matrix(2,5,(5, 1),(Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(5, 1)).
mapping_matrix(2,5,(5, 2),(Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(5, 2)).
mapping_matrix(2,5,(5, 3),(Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(5, 3)).
mapping_matrix(2,5,(5, 4),(Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(2,5,(5, 4)).
mapping_matrix(3,5,(1, 2, 3),(Arg1, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 2, 3)).
mapping_matrix(3,5,(1, 2, 4),(Arg1, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 2, 4)).
mapping_matrix(3,5,(1, 2, 5),(Arg1, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 2, 5)).
mapping_matrix(3,5,(1, 3, 2),(Arg1, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 3, 2)).
mapping_matrix(3,5,(1, 3, 4),(Arg1, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 3, 4)).
mapping_matrix(3,5,(1, 3, 5),(Arg1, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 3, 5)).
mapping_matrix(3,5,(1, 4, 2),(Arg1, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 4, 2)).
mapping_matrix(3,5,(1, 4, 3),(Arg1, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 4, 3)).
mapping_matrix(3,5,(1, 4, 5),(Arg1, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 4, 5)).
mapping_matrix(3,5,(1, 5, 2),(Arg1, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 5, 2)).
mapping_matrix(3,5,(1, 5, 3),(Arg1, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 5, 3)).
mapping_matrix(3,5,(1, 5, 4),(Arg1, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(1, 5, 4)).
mapping_matrix(3,5,(2, 1, 3),(Arg2, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 1, 3)).
mapping_matrix(3,5,(2, 1, 4),(Arg2, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 1, 4)).
mapping_matrix(3,5,(2, 1, 5),(Arg2, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 1, 5)).
mapping_matrix(3,5,(2, 3, 1),(Arg2, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 3, 1)).
mapping_matrix(3,5,(2, 3, 4),(Arg2, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 3, 4)).
mapping_matrix(3,5,(2, 3, 5),(Arg2, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 3, 5)).
mapping_matrix(3,5,(2, 4, 1),(Arg2, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 4, 1)).
mapping_matrix(3,5,(2, 4, 3),(Arg2, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 4, 3)).
mapping_matrix(3,5,(2, 4, 5),(Arg2, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 4, 5)).
mapping_matrix(3,5,(2, 5, 1),(Arg2, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 5, 1)).
mapping_matrix(3,5,(2, 5, 3),(Arg2, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 5, 3)).
mapping_matrix(3,5,(2, 5, 4),(Arg2, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(2, 5, 4)).
mapping_matrix(3,5,(3, 1, 2),(Arg3, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 1, 2)).
mapping_matrix(3,5,(3, 1, 4),(Arg3, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 1, 4)).
mapping_matrix(3,5,(3, 1, 5),(Arg3, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 1, 5)).
mapping_matrix(3,5,(3, 2, 1),(Arg3, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 2, 1)).
mapping_matrix(3,5,(3, 2, 4),(Arg3, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 2, 4)).
mapping_matrix(3,5,(3, 2, 5),(Arg3, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 2, 5)).
mapping_matrix(3,5,(3, 4, 1),(Arg3, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 4, 1)).
mapping_matrix(3,5,(3, 4, 2),(Arg3, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 4, 2)).
mapping_matrix(3,5,(3, 4, 5),(Arg3, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 4, 5)).
mapping_matrix(3,5,(3, 5, 1),(Arg3, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 5, 1)).
mapping_matrix(3,5,(3, 5, 2),(Arg3, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 5, 2)).
mapping_matrix(3,5,(3, 5, 4),(Arg3, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(3, 5, 4)).
mapping_matrix(3,5,(4, 1, 2),(Arg4, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 1, 2)).
mapping_matrix(3,5,(4, 1, 3),(Arg4, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 1, 3)).
mapping_matrix(3,5,(4, 1, 5),(Arg4, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 1, 5)).
mapping_matrix(3,5,(4, 2, 1),(Arg4, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 2, 1)).
mapping_matrix(3,5,(4, 2, 3),(Arg4, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 2, 3)).
mapping_matrix(3,5,(4, 2, 5),(Arg4, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 2, 5)).
mapping_matrix(3,5,(4, 3, 1),(Arg4, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 3, 1)).
mapping_matrix(3,5,(4, 3, 2),(Arg4, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 3, 2)).
mapping_matrix(3,5,(4, 3, 5),(Arg4, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 3, 5)).
mapping_matrix(3,5,(4, 5, 1),(Arg4, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 5, 1)).
mapping_matrix(3,5,(4, 5, 2),(Arg4, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 5, 2)).
mapping_matrix(3,5,(4, 5, 3),(Arg4, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(4, 5, 3)).
mapping_matrix(3,5,(5, 1, 2),(Arg5, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 1, 2)).
mapping_matrix(3,5,(5, 1, 3),(Arg5, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 1, 3)).
mapping_matrix(3,5,(5, 1, 4),(Arg5, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 1, 4)).
mapping_matrix(3,5,(5, 2, 1),(Arg5, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 2, 1)).
mapping_matrix(3,5,(5, 2, 3),(Arg5, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 2, 3)).
mapping_matrix(3,5,(5, 2, 4),(Arg5, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 2, 4)).
mapping_matrix(3,5,(5, 3, 1),(Arg5, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 3, 1)).
mapping_matrix(3,5,(5, 3, 2),(Arg5, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 3, 2)).
mapping_matrix(3,5,(5, 3, 4),(Arg5, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 3, 4)).
mapping_matrix(3,5,(5, 4, 1),(Arg5, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 4, 1)).
mapping_matrix(3,5,(5, 4, 2),(Arg5, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 4, 2)).
mapping_matrix(3,5,(5, 4, 3),(Arg5, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(3,5,(5, 4, 3)).
mapping_matrix(4,5,(1, 2, 3, 4),(Arg1, Arg2, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 2, 3, 4)).
mapping_matrix(4,5,(1, 2, 3, 5),(Arg1, Arg2, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 2, 3, 5)).
mapping_matrix(4,5,(1, 2, 4, 3),(Arg1, Arg2, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 2, 4, 3)).
mapping_matrix(4,5,(1, 2, 4, 5),(Arg1, Arg2, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 2, 4, 5)).
mapping_matrix(4,5,(1, 2, 5, 3),(Arg1, Arg2, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 2, 5, 3)).
mapping_matrix(4,5,(1, 2, 5, 4),(Arg1, Arg2, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 2, 5, 4)).
mapping_matrix(4,5,(1, 3, 2, 4),(Arg1, Arg3, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 3, 2, 4)).
mapping_matrix(4,5,(1, 3, 2, 5),(Arg1, Arg3, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 3, 2, 5)).
mapping_matrix(4,5,(1, 3, 4, 2),(Arg1, Arg3, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 3, 4, 2)).
mapping_matrix(4,5,(1, 3, 4, 5),(Arg1, Arg3, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 3, 4, 5)).
mapping_matrix(4,5,(1, 3, 5, 2),(Arg1, Arg3, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 3, 5, 2)).
mapping_matrix(4,5,(1, 3, 5, 4),(Arg1, Arg3, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 3, 5, 4)).
mapping_matrix(4,5,(1, 4, 2, 3),(Arg1, Arg4, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 4, 2, 3)).
mapping_matrix(4,5,(1, 4, 2, 5),(Arg1, Arg4, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 4, 2, 5)).
mapping_matrix(4,5,(1, 4, 3, 2),(Arg1, Arg4, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 4, 3, 2)).
mapping_matrix(4,5,(1, 4, 3, 5),(Arg1, Arg4, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 4, 3, 5)).
mapping_matrix(4,5,(1, 4, 5, 2),(Arg1, Arg4, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 4, 5, 2)).
mapping_matrix(4,5,(1, 4, 5, 3),(Arg1, Arg4, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 4, 5, 3)).
mapping_matrix(4,5,(1, 5, 2, 3),(Arg1, Arg5, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 5, 2, 3)).
mapping_matrix(4,5,(1, 5, 2, 4),(Arg1, Arg5, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 5, 2, 4)).
mapping_matrix(4,5,(1, 5, 3, 2),(Arg1, Arg5, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 5, 3, 2)).
mapping_matrix(4,5,(1, 5, 3, 4),(Arg1, Arg5, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 5, 3, 4)).
mapping_matrix(4,5,(1, 5, 4, 2),(Arg1, Arg5, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 5, 4, 2)).
mapping_matrix(4,5,(1, 5, 4, 3),(Arg1, Arg5, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(1, 5, 4, 3)).
mapping_matrix(4,5,(2, 1, 3, 4),(Arg2, Arg1, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 1, 3, 4)).
mapping_matrix(4,5,(2, 1, 3, 5),(Arg2, Arg1, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 1, 3, 5)).
mapping_matrix(4,5,(2, 1, 4, 3),(Arg2, Arg1, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 1, 4, 3)).
mapping_matrix(4,5,(2, 1, 4, 5),(Arg2, Arg1, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 1, 4, 5)).
mapping_matrix(4,5,(2, 1, 5, 3),(Arg2, Arg1, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 1, 5, 3)).
mapping_matrix(4,5,(2, 1, 5, 4),(Arg2, Arg1, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 1, 5, 4)).
mapping_matrix(4,5,(2, 3, 1, 4),(Arg2, Arg3, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 3, 1, 4)).
mapping_matrix(4,5,(2, 3, 1, 5),(Arg2, Arg3, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 3, 1, 5)).
mapping_matrix(4,5,(2, 3, 4, 1),(Arg2, Arg3, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 3, 4, 1)).
mapping_matrix(4,5,(2, 3, 4, 5),(Arg2, Arg3, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 3, 4, 5)).
mapping_matrix(4,5,(2, 3, 5, 1),(Arg2, Arg3, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 3, 5, 1)).
mapping_matrix(4,5,(2, 3, 5, 4),(Arg2, Arg3, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 3, 5, 4)).
mapping_matrix(4,5,(2, 4, 1, 3),(Arg2, Arg4, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 4, 1, 3)).
mapping_matrix(4,5,(2, 4, 1, 5),(Arg2, Arg4, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 4, 1, 5)).
mapping_matrix(4,5,(2, 4, 3, 1),(Arg2, Arg4, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 4, 3, 1)).
mapping_matrix(4,5,(2, 4, 3, 5),(Arg2, Arg4, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 4, 3, 5)).
mapping_matrix(4,5,(2, 4, 5, 1),(Arg2, Arg4, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 4, 5, 1)).
mapping_matrix(4,5,(2, 4, 5, 3),(Arg2, Arg4, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 4, 5, 3)).
mapping_matrix(4,5,(2, 5, 1, 3),(Arg2, Arg5, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 5, 1, 3)).
mapping_matrix(4,5,(2, 5, 1, 4),(Arg2, Arg5, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 5, 1, 4)).
mapping_matrix(4,5,(2, 5, 3, 1),(Arg2, Arg5, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 5, 3, 1)).
mapping_matrix(4,5,(2, 5, 3, 4),(Arg2, Arg5, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 5, 3, 4)).
mapping_matrix(4,5,(2, 5, 4, 1),(Arg2, Arg5, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 5, 4, 1)).
mapping_matrix(4,5,(2, 5, 4, 3),(Arg2, Arg5, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(2, 5, 4, 3)).
mapping_matrix(4,5,(3, 1, 2, 4),(Arg3, Arg1, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 1, 2, 4)).
mapping_matrix(4,5,(3, 1, 2, 5),(Arg3, Arg1, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 1, 2, 5)).
mapping_matrix(4,5,(3, 1, 4, 2),(Arg3, Arg1, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 1, 4, 2)).
mapping_matrix(4,5,(3, 1, 4, 5),(Arg3, Arg1, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 1, 4, 5)).
mapping_matrix(4,5,(3, 1, 5, 2),(Arg3, Arg1, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 1, 5, 2)).
mapping_matrix(4,5,(3, 1, 5, 4),(Arg3, Arg1, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 1, 5, 4)).
mapping_matrix(4,5,(3, 2, 1, 4),(Arg3, Arg2, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 2, 1, 4)).
mapping_matrix(4,5,(3, 2, 1, 5),(Arg3, Arg2, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 2, 1, 5)).
mapping_matrix(4,5,(3, 2, 4, 1),(Arg3, Arg2, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 2, 4, 1)).
mapping_matrix(4,5,(3, 2, 4, 5),(Arg3, Arg2, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 2, 4, 5)).
mapping_matrix(4,5,(3, 2, 5, 1),(Arg3, Arg2, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 2, 5, 1)).
mapping_matrix(4,5,(3, 2, 5, 4),(Arg3, Arg2, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 2, 5, 4)).
mapping_matrix(4,5,(3, 4, 1, 2),(Arg3, Arg4, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 4, 1, 2)).
mapping_matrix(4,5,(3, 4, 1, 5),(Arg3, Arg4, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 4, 1, 5)).
mapping_matrix(4,5,(3, 4, 2, 1),(Arg3, Arg4, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 4, 2, 1)).
mapping_matrix(4,5,(3, 4, 2, 5),(Arg3, Arg4, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 4, 2, 5)).
mapping_matrix(4,5,(3, 4, 5, 1),(Arg3, Arg4, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 4, 5, 1)).
mapping_matrix(4,5,(3, 4, 5, 2),(Arg3, Arg4, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 4, 5, 2)).
mapping_matrix(4,5,(3, 5, 1, 2),(Arg3, Arg5, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 5, 1, 2)).
mapping_matrix(4,5,(3, 5, 1, 4),(Arg3, Arg5, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 5, 1, 4)).
mapping_matrix(4,5,(3, 5, 2, 1),(Arg3, Arg5, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 5, 2, 1)).
mapping_matrix(4,5,(3, 5, 2, 4),(Arg3, Arg5, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 5, 2, 4)).
mapping_matrix(4,5,(3, 5, 4, 1),(Arg3, Arg5, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 5, 4, 1)).
mapping_matrix(4,5,(3, 5, 4, 2),(Arg3, Arg5, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(3, 5, 4, 2)).
mapping_matrix(4,5,(4, 1, 2, 3),(Arg4, Arg1, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 1, 2, 3)).
mapping_matrix(4,5,(4, 1, 2, 5),(Arg4, Arg1, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 1, 2, 5)).
mapping_matrix(4,5,(4, 1, 3, 2),(Arg4, Arg1, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 1, 3, 2)).
mapping_matrix(4,5,(4, 1, 3, 5),(Arg4, Arg1, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 1, 3, 5)).
mapping_matrix(4,5,(4, 1, 5, 2),(Arg4, Arg1, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 1, 5, 2)).
mapping_matrix(4,5,(4, 1, 5, 3),(Arg4, Arg1, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 1, 5, 3)).
mapping_matrix(4,5,(4, 2, 1, 3),(Arg4, Arg2, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 2, 1, 3)).
mapping_matrix(4,5,(4, 2, 1, 5),(Arg4, Arg2, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 2, 1, 5)).
mapping_matrix(4,5,(4, 2, 3, 1),(Arg4, Arg2, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 2, 3, 1)).
mapping_matrix(4,5,(4, 2, 3, 5),(Arg4, Arg2, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 2, 3, 5)).
mapping_matrix(4,5,(4, 2, 5, 1),(Arg4, Arg2, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 2, 5, 1)).
mapping_matrix(4,5,(4, 2, 5, 3),(Arg4, Arg2, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 2, 5, 3)).
mapping_matrix(4,5,(4, 3, 1, 2),(Arg4, Arg3, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 3, 1, 2)).
mapping_matrix(4,5,(4, 3, 1, 5),(Arg4, Arg3, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 3, 1, 5)).
mapping_matrix(4,5,(4, 3, 2, 1),(Arg4, Arg3, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 3, 2, 1)).
mapping_matrix(4,5,(4, 3, 2, 5),(Arg4, Arg3, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 3, 2, 5)).
mapping_matrix(4,5,(4, 3, 5, 1),(Arg4, Arg3, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 3, 5, 1)).
mapping_matrix(4,5,(4, 3, 5, 2),(Arg4, Arg3, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 3, 5, 2)).
mapping_matrix(4,5,(4, 5, 1, 2),(Arg4, Arg5, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 5, 1, 2)).
mapping_matrix(4,5,(4, 5, 1, 3),(Arg4, Arg5, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 5, 1, 3)).
mapping_matrix(4,5,(4, 5, 2, 1),(Arg4, Arg5, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 5, 2, 1)).
mapping_matrix(4,5,(4, 5, 2, 3),(Arg4, Arg5, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 5, 2, 3)).
mapping_matrix(4,5,(4, 5, 3, 1),(Arg4, Arg5, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 5, 3, 1)).
mapping_matrix(4,5,(4, 5, 3, 2),(Arg4, Arg5, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(4, 5, 3, 2)).
mapping_matrix(4,5,(5, 1, 2, 3),(Arg5, Arg1, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 1, 2, 3)).
mapping_matrix(4,5,(5, 1, 2, 4),(Arg5, Arg1, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 1, 2, 4)).
mapping_matrix(4,5,(5, 1, 3, 2),(Arg5, Arg1, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 1, 3, 2)).
mapping_matrix(4,5,(5, 1, 3, 4),(Arg5, Arg1, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 1, 3, 4)).
mapping_matrix(4,5,(5, 1, 4, 2),(Arg5, Arg1, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 1, 4, 2)).
mapping_matrix(4,5,(5, 1, 4, 3),(Arg5, Arg1, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 1, 4, 3)).
mapping_matrix(4,5,(5, 2, 1, 3),(Arg5, Arg2, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 2, 1, 3)).
mapping_matrix(4,5,(5, 2, 1, 4),(Arg5, Arg2, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 2, 1, 4)).
mapping_matrix(4,5,(5, 2, 3, 1),(Arg5, Arg2, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 2, 3, 1)).
mapping_matrix(4,5,(5, 2, 3, 4),(Arg5, Arg2, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 2, 3, 4)).
mapping_matrix(4,5,(5, 2, 4, 1),(Arg5, Arg2, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 2, 4, 1)).
mapping_matrix(4,5,(5, 2, 4, 3),(Arg5, Arg2, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 2, 4, 3)).
mapping_matrix(4,5,(5, 3, 1, 2),(Arg5, Arg3, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 3, 1, 2)).
mapping_matrix(4,5,(5, 3, 1, 4),(Arg5, Arg3, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 3, 1, 4)).
mapping_matrix(4,5,(5, 3, 2, 1),(Arg5, Arg3, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 3, 2, 1)).
mapping_matrix(4,5,(5, 3, 2, 4),(Arg5, Arg3, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 3, 2, 4)).
mapping_matrix(4,5,(5, 3, 4, 1),(Arg5, Arg3, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 3, 4, 1)).
mapping_matrix(4,5,(5, 3, 4, 2),(Arg5, Arg3, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 3, 4, 2)).
mapping_matrix(4,5,(5, 4, 1, 2),(Arg5, Arg4, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 4, 1, 2)).
mapping_matrix(4,5,(5, 4, 1, 3),(Arg5, Arg4, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 4, 1, 3)).
mapping_matrix(4,5,(5, 4, 2, 1),(Arg5, Arg4, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 4, 2, 1)).
mapping_matrix(4,5,(5, 4, 2, 3),(Arg5, Arg4, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 4, 2, 3)).
mapping_matrix(4,5,(5, 4, 3, 1),(Arg5, Arg4, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 4, 3, 1)).
mapping_matrix(4,5,(5, 4, 3, 2),(Arg5, Arg4, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(4,5,(5, 4, 3, 2)).
mapping_matrix(5,5,(1, 2, 3, 4, 5),(Arg1, Arg2, Arg3, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 2, 3, 4, 5)).
mapping_matrix(5,5,(1, 2, 3, 5, 4),(Arg1, Arg2, Arg3, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 2, 3, 5, 4)).
mapping_matrix(5,5,(1, 2, 4, 3, 5),(Arg1, Arg2, Arg4, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 2, 4, 3, 5)).
mapping_matrix(5,5,(1, 2, 4, 5, 3),(Arg1, Arg2, Arg4, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 2, 4, 5, 3)).
mapping_matrix(5,5,(1, 2, 5, 3, 4),(Arg1, Arg2, Arg5, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 2, 5, 3, 4)).
mapping_matrix(5,5,(1, 2, 5, 4, 3),(Arg1, Arg2, Arg5, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 2, 5, 4, 3)).
mapping_matrix(5,5,(1, 3, 2, 4, 5),(Arg1, Arg3, Arg2, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 3, 2, 4, 5)).
mapping_matrix(5,5,(1, 3, 2, 5, 4),(Arg1, Arg3, Arg2, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 3, 2, 5, 4)).
mapping_matrix(5,5,(1, 3, 4, 2, 5),(Arg1, Arg3, Arg4, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 3, 4, 2, 5)).
mapping_matrix(5,5,(1, 3, 4, 5, 2),(Arg1, Arg3, Arg4, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 3, 4, 5, 2)).
mapping_matrix(5,5,(1, 3, 5, 2, 4),(Arg1, Arg3, Arg5, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 3, 5, 2, 4)).
mapping_matrix(5,5,(1, 3, 5, 4, 2),(Arg1, Arg3, Arg5, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 3, 5, 4, 2)).
mapping_matrix(5,5,(1, 4, 2, 3, 5),(Arg1, Arg4, Arg2, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 4, 2, 3, 5)).
mapping_matrix(5,5,(1, 4, 2, 5, 3),(Arg1, Arg4, Arg2, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 4, 2, 5, 3)).
mapping_matrix(5,5,(1, 4, 3, 2, 5),(Arg1, Arg4, Arg3, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 4, 3, 2, 5)).
mapping_matrix(5,5,(1, 4, 3, 5, 2),(Arg1, Arg4, Arg3, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 4, 3, 5, 2)).
mapping_matrix(5,5,(1, 4, 5, 2, 3),(Arg1, Arg4, Arg5, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 4, 5, 2, 3)).
mapping_matrix(5,5,(1, 4, 5, 3, 2),(Arg1, Arg4, Arg5, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 4, 5, 3, 2)).
mapping_matrix(5,5,(1, 5, 2, 3, 4),(Arg1, Arg5, Arg2, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 5, 2, 3, 4)).
mapping_matrix(5,5,(1, 5, 2, 4, 3),(Arg1, Arg5, Arg2, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 5, 2, 4, 3)).
mapping_matrix(5,5,(1, 5, 3, 2, 4),(Arg1, Arg5, Arg3, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 5, 3, 2, 4)).
mapping_matrix(5,5,(1, 5, 3, 4, 2),(Arg1, Arg5, Arg3, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 5, 3, 4, 2)).
mapping_matrix(5,5,(1, 5, 4, 2, 3),(Arg1, Arg5, Arg4, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 5, 4, 2, 3)).
mapping_matrix(5,5,(1, 5, 4, 3, 2),(Arg1, Arg5, Arg4, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(1, 5, 4, 3, 2)).
mapping_matrix(5,5,(2, 1, 3, 4, 5),(Arg2, Arg1, Arg3, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 1, 3, 4, 5)).
mapping_matrix(5,5,(2, 1, 3, 5, 4),(Arg2, Arg1, Arg3, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 1, 3, 5, 4)).
mapping_matrix(5,5,(2, 1, 4, 3, 5),(Arg2, Arg1, Arg4, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 1, 4, 3, 5)).
mapping_matrix(5,5,(2, 1, 4, 5, 3),(Arg2, Arg1, Arg4, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 1, 4, 5, 3)).
mapping_matrix(5,5,(2, 1, 5, 3, 4),(Arg2, Arg1, Arg5, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 1, 5, 3, 4)).
mapping_matrix(5,5,(2, 1, 5, 4, 3),(Arg2, Arg1, Arg5, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 1, 5, 4, 3)).
mapping_matrix(5,5,(2, 3, 1, 4, 5),(Arg2, Arg3, Arg1, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 3, 1, 4, 5)).
mapping_matrix(5,5,(2, 3, 1, 5, 4),(Arg2, Arg3, Arg1, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 3, 1, 5, 4)).
mapping_matrix(5,5,(2, 3, 4, 1, 5),(Arg2, Arg3, Arg4, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 3, 4, 1, 5)).
mapping_matrix(5,5,(2, 3, 4, 5, 1),(Arg2, Arg3, Arg4, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 3, 4, 5, 1)).
mapping_matrix(5,5,(2, 3, 5, 1, 4),(Arg2, Arg3, Arg5, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 3, 5, 1, 4)).
mapping_matrix(5,5,(2, 3, 5, 4, 1),(Arg2, Arg3, Arg5, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 3, 5, 4, 1)).
mapping_matrix(5,5,(2, 4, 1, 3, 5),(Arg2, Arg4, Arg1, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 4, 1, 3, 5)).
mapping_matrix(5,5,(2, 4, 1, 5, 3),(Arg2, Arg4, Arg1, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 4, 1, 5, 3)).
mapping_matrix(5,5,(2, 4, 3, 1, 5),(Arg2, Arg4, Arg3, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 4, 3, 1, 5)).
mapping_matrix(5,5,(2, 4, 3, 5, 1),(Arg2, Arg4, Arg3, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 4, 3, 5, 1)).
mapping_matrix(5,5,(2, 4, 5, 1, 3),(Arg2, Arg4, Arg5, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 4, 5, 1, 3)).
mapping_matrix(5,5,(2, 4, 5, 3, 1),(Arg2, Arg4, Arg5, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 4, 5, 3, 1)).
mapping_matrix(5,5,(2, 5, 1, 3, 4),(Arg2, Arg5, Arg1, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 5, 1, 3, 4)).
mapping_matrix(5,5,(2, 5, 1, 4, 3),(Arg2, Arg5, Arg1, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 5, 1, 4, 3)).
mapping_matrix(5,5,(2, 5, 3, 1, 4),(Arg2, Arg5, Arg3, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 5, 3, 1, 4)).
mapping_matrix(5,5,(2, 5, 3, 4, 1),(Arg2, Arg5, Arg3, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 5, 3, 4, 1)).
mapping_matrix(5,5,(2, 5, 4, 1, 3),(Arg2, Arg5, Arg4, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 5, 4, 1, 3)).
mapping_matrix(5,5,(2, 5, 4, 3, 1),(Arg2, Arg5, Arg4, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(2, 5, 4, 3, 1)).
mapping_matrix(5,5,(3, 1, 2, 4, 5),(Arg3, Arg1, Arg2, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 1, 2, 4, 5)).
mapping_matrix(5,5,(3, 1, 2, 5, 4),(Arg3, Arg1, Arg2, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 1, 2, 5, 4)).
mapping_matrix(5,5,(3, 1, 4, 2, 5),(Arg3, Arg1, Arg4, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 1, 4, 2, 5)).
mapping_matrix(5,5,(3, 1, 4, 5, 2),(Arg3, Arg1, Arg4, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 1, 4, 5, 2)).
mapping_matrix(5,5,(3, 1, 5, 2, 4),(Arg3, Arg1, Arg5, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 1, 5, 2, 4)).
mapping_matrix(5,5,(3, 1, 5, 4, 2),(Arg3, Arg1, Arg5, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 1, 5, 4, 2)).
mapping_matrix(5,5,(3, 2, 1, 4, 5),(Arg3, Arg2, Arg1, Arg4, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 2, 1, 4, 5)).
mapping_matrix(5,5,(3, 2, 1, 5, 4),(Arg3, Arg2, Arg1, Arg5, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 2, 1, 5, 4)).
mapping_matrix(5,5,(3, 2, 4, 1, 5),(Arg3, Arg2, Arg4, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 2, 4, 1, 5)).
mapping_matrix(5,5,(3, 2, 4, 5, 1),(Arg3, Arg2, Arg4, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 2, 4, 5, 1)).
mapping_matrix(5,5,(3, 2, 5, 1, 4),(Arg3, Arg2, Arg5, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 2, 5, 1, 4)).
mapping_matrix(5,5,(3, 2, 5, 4, 1),(Arg3, Arg2, Arg5, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 2, 5, 4, 1)).
mapping_matrix(5,5,(3, 4, 1, 2, 5),(Arg3, Arg4, Arg1, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 4, 1, 2, 5)).
mapping_matrix(5,5,(3, 4, 1, 5, 2),(Arg3, Arg4, Arg1, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 4, 1, 5, 2)).
mapping_matrix(5,5,(3, 4, 2, 1, 5),(Arg3, Arg4, Arg2, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 4, 2, 1, 5)).
mapping_matrix(5,5,(3, 4, 2, 5, 1),(Arg3, Arg4, Arg2, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 4, 2, 5, 1)).
mapping_matrix(5,5,(3, 4, 5, 1, 2),(Arg3, Arg4, Arg5, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 4, 5, 1, 2)).
mapping_matrix(5,5,(3, 4, 5, 2, 1),(Arg3, Arg4, Arg5, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 4, 5, 2, 1)).
mapping_matrix(5,5,(3, 5, 1, 2, 4),(Arg3, Arg5, Arg1, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 5, 1, 2, 4)).
mapping_matrix(5,5,(3, 5, 1, 4, 2),(Arg3, Arg5, Arg1, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 5, 1, 4, 2)).
mapping_matrix(5,5,(3, 5, 2, 1, 4),(Arg3, Arg5, Arg2, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 5, 2, 1, 4)).
mapping_matrix(5,5,(3, 5, 2, 4, 1),(Arg3, Arg5, Arg2, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 5, 2, 4, 1)).
mapping_matrix(5,5,(3, 5, 4, 1, 2),(Arg3, Arg5, Arg4, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 5, 4, 1, 2)).
mapping_matrix(5,5,(3, 5, 4, 2, 1),(Arg3, Arg5, Arg4, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(3, 5, 4, 2, 1)).
mapping_matrix(5,5,(4, 1, 2, 3, 5),(Arg4, Arg1, Arg2, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 1, 2, 3, 5)).
mapping_matrix(5,5,(4, 1, 2, 5, 3),(Arg4, Arg1, Arg2, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 1, 2, 5, 3)).
mapping_matrix(5,5,(4, 1, 3, 2, 5),(Arg4, Arg1, Arg3, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 1, 3, 2, 5)).
mapping_matrix(5,5,(4, 1, 3, 5, 2),(Arg4, Arg1, Arg3, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 1, 3, 5, 2)).
mapping_matrix(5,5,(4, 1, 5, 2, 3),(Arg4, Arg1, Arg5, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 1, 5, 2, 3)).
mapping_matrix(5,5,(4, 1, 5, 3, 2),(Arg4, Arg1, Arg5, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 1, 5, 3, 2)).
mapping_matrix(5,5,(4, 2, 1, 3, 5),(Arg4, Arg2, Arg1, Arg3, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 2, 1, 3, 5)).
mapping_matrix(5,5,(4, 2, 1, 5, 3),(Arg4, Arg2, Arg1, Arg5, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 2, 1, 5, 3)).
mapping_matrix(5,5,(4, 2, 3, 1, 5),(Arg4, Arg2, Arg3, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 2, 3, 1, 5)).
mapping_matrix(5,5,(4, 2, 3, 5, 1),(Arg4, Arg2, Arg3, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 2, 3, 5, 1)).
mapping_matrix(5,5,(4, 2, 5, 1, 3),(Arg4, Arg2, Arg5, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 2, 5, 1, 3)).
mapping_matrix(5,5,(4, 2, 5, 3, 1),(Arg4, Arg2, Arg5, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 2, 5, 3, 1)).
mapping_matrix(5,5,(4, 3, 1, 2, 5),(Arg4, Arg3, Arg1, Arg2, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 3, 1, 2, 5)).
mapping_matrix(5,5,(4, 3, 1, 5, 2),(Arg4, Arg3, Arg1, Arg5, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 3, 1, 5, 2)).
mapping_matrix(5,5,(4, 3, 2, 1, 5),(Arg4, Arg3, Arg2, Arg1, Arg5),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 3, 2, 1, 5)).
mapping_matrix(5,5,(4, 3, 2, 5, 1),(Arg4, Arg3, Arg2, Arg5, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 3, 2, 5, 1)).
mapping_matrix(5,5,(4, 3, 5, 1, 2),(Arg4, Arg3, Arg5, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 3, 5, 1, 2)).
mapping_matrix(5,5,(4, 3, 5, 2, 1),(Arg4, Arg3, Arg5, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 3, 5, 2, 1)).
mapping_matrix(5,5,(4, 5, 1, 2, 3),(Arg4, Arg5, Arg1, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 5, 1, 2, 3)).
mapping_matrix(5,5,(4, 5, 1, 3, 2),(Arg4, Arg5, Arg1, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 5, 1, 3, 2)).
mapping_matrix(5,5,(4, 5, 2, 1, 3),(Arg4, Arg5, Arg2, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 5, 2, 1, 3)).
mapping_matrix(5,5,(4, 5, 2, 3, 1),(Arg4, Arg5, Arg2, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 5, 2, 3, 1)).
mapping_matrix(5,5,(4, 5, 3, 1, 2),(Arg4, Arg5, Arg3, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 5, 3, 1, 2)).
mapping_matrix(5,5,(4, 5, 3, 2, 1),(Arg4, Arg5, Arg3, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(4, 5, 3, 2, 1)).
mapping_matrix(5,5,(5, 1, 2, 3, 4),(Arg5, Arg1, Arg2, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 1, 2, 3, 4)).
mapping_matrix(5,5,(5, 1, 2, 4, 3),(Arg5, Arg1, Arg2, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 1, 2, 4, 3)).
mapping_matrix(5,5,(5, 1, 3, 2, 4),(Arg5, Arg1, Arg3, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 1, 3, 2, 4)).
mapping_matrix(5,5,(5, 1, 3, 4, 2),(Arg5, Arg1, Arg3, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 1, 3, 4, 2)).
mapping_matrix(5,5,(5, 1, 4, 2, 3),(Arg5, Arg1, Arg4, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 1, 4, 2, 3)).
mapping_matrix(5,5,(5, 1, 4, 3, 2),(Arg5, Arg1, Arg4, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 1, 4, 3, 2)).
mapping_matrix(5,5,(5, 2, 1, 3, 4),(Arg5, Arg2, Arg1, Arg3, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 2, 1, 3, 4)).
mapping_matrix(5,5,(5, 2, 1, 4, 3),(Arg5, Arg2, Arg1, Arg4, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 2, 1, 4, 3)).
mapping_matrix(5,5,(5, 2, 3, 1, 4),(Arg5, Arg2, Arg3, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 2, 3, 1, 4)).
mapping_matrix(5,5,(5, 2, 3, 4, 1),(Arg5, Arg2, Arg3, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 2, 3, 4, 1)).
mapping_matrix(5,5,(5, 2, 4, 1, 3),(Arg5, Arg2, Arg4, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 2, 4, 1, 3)).
mapping_matrix(5,5,(5, 2, 4, 3, 1),(Arg5, Arg2, Arg4, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 2, 4, 3, 1)).
mapping_matrix(5,5,(5, 3, 1, 2, 4),(Arg5, Arg3, Arg1, Arg2, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 3, 1, 2, 4)).
mapping_matrix(5,5,(5, 3, 1, 4, 2),(Arg5, Arg3, Arg1, Arg4, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 3, 1, 4, 2)).
mapping_matrix(5,5,(5, 3, 2, 1, 4),(Arg5, Arg3, Arg2, Arg1, Arg4),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 3, 2, 1, 4)).
mapping_matrix(5,5,(5, 3, 2, 4, 1),(Arg5, Arg3, Arg2, Arg4, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 3, 2, 4, 1)).
mapping_matrix(5,5,(5, 3, 4, 1, 2),(Arg5, Arg3, Arg4, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 3, 4, 1, 2)).
mapping_matrix(5,5,(5, 3, 4, 2, 1),(Arg5, Arg3, Arg4, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 3, 4, 2, 1)).
mapping_matrix(5,5,(5, 4, 1, 2, 3),(Arg5, Arg4, Arg1, Arg2, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 4, 1, 2, 3)).
mapping_matrix(5,5,(5, 4, 1, 3, 2),(Arg5, Arg4, Arg1, Arg3, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 4, 1, 3, 2)).
mapping_matrix(5,5,(5, 4, 2, 1, 3),(Arg5, Arg4, Arg2, Arg1, Arg3),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 4, 2, 1, 3)).
mapping_matrix(5,5,(5, 4, 2, 3, 1),(Arg5, Arg4, Arg2, Arg3, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 4, 2, 3, 1)).
mapping_matrix(5,5,(5, 4, 3, 1, 2),(Arg5, Arg4, Arg3, Arg1, Arg2),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 4, 3, 1, 2)).
mapping_matrix(5,5,(5, 4, 3, 2, 1),(Arg5, Arg4, Arg3, Arg2, Arg1),(Arg1, Arg2, Arg3, Arg4, Arg5)):-argument(Arg1,Type), argument(Arg2,Type), argument(Arg3,Type), argument(Arg4,Type), argument(Arg5,Type).
mapping_permutations(5,5,(5, 4, 3, 2, 1)).
objects((0,p0)).
obj_type(4,(0,p0)).
objects((0,a0)).
obj_type(0,(0,a0)).
objects((0,l0-0)).
obj_type(1,(0,l0-0)).
objects((0,c0)).
obj_type(6,(0,c0)).
objects((0,t1)).
obj_type(0,(0,t1)).
objects((0,l1-1)).
obj_type(1,(0,l1-1)).
objects((0,l1-0)).
obj_type(1,(0,l1-0)).
objects((0,c1)).
obj_type(6,(0,c1)).
objects((0,l2-0)).
obj_type(1,(0,l2-0)).
objects((0,c2)).
obj_type(6,(0,c2)).
objects((0,t0)).
obj_type(0,(0,t0)).
objects((0,l0-1)).
obj_type(1,(0,l0-1)).
objects((0,l2-1)).
obj_type(1,(0,l2-1)).
objects((0,t2)).
obj_type(0,(0,t2)).
objects((1,p0)).
obj_type(4,(1,p0)).
objects((1,a0)).
obj_type(0,(1,a0)).
objects((1,l0-0)).
obj_type(1,(1,l0-0)).
objects((1,c0)).
obj_type(6,(1,c0)).
objects((1,t1)).
obj_type(0,(1,t1)).
objects((1,l1-1)).
obj_type(1,(1,l1-1)).
objects((1,l1-0)).
obj_type(1,(1,l1-0)).
objects((1,c1)).
obj_type(6,(1,c1)).
objects((1,l2-0)).
obj_type(1,(1,l2-0)).
objects((1,c2)).
obj_type(6,(1,c2)).
objects((1,t0)).
obj_type(0,(1,t0)).
objects((1,l0-1)).
obj_type(1,(1,l0-1)).
objects((1,l2-1)).
obj_type(1,(1,l2-1)).
objects((1,t2)).
obj_type(0,(1,t2)).
objects((2,p0)).
obj_type(4,(2,p0)).
objects((2,a0)).
obj_type(0,(2,a0)).
objects((2,l0-0)).
obj_type(1,(2,l0-0)).
objects((2,c0)).
obj_type(6,(2,c0)).
objects((2,t1)).
obj_type(0,(2,t1)).
objects((2,l1-1)).
obj_type(1,(2,l1-1)).
objects((2,l1-0)).
obj_type(1,(2,l1-0)).
objects((2,c1)).
obj_type(6,(2,c1)).
objects((2,p2)).
obj_type(4,(2,p2)).
objects((2,a1)).
obj_type(0,(2,a1)).
objects((2,t0)).
obj_type(0,(2,t0)).
objects((2,l0-1)).
obj_type(1,(2,l0-1)).
objects((2,p1)).
obj_type(4,(2,p1)).
objects((3,p0)).
obj_type(4,(3,p0)).
objects((3,a0)).
obj_type(0,(3,a0)).
objects((3,l0-0)).
obj_type(1,(3,l0-0)).
objects((3,c0)).
obj_type(6,(3,c0)).
objects((3,t1)).
obj_type(0,(3,t1)).
objects((3,l1-1)).
obj_type(1,(3,l1-1)).
objects((3,l1-0)).
obj_type(1,(3,l1-0)).
objects((3,c1)).
obj_type(6,(3,c1)).
objects((3,p2)).
obj_type(4,(3,p2)).
objects((3,a1)).
obj_type(0,(3,a1)).
objects((3,p1)).
obj_type(4,(3,p1)).
objects((3,t0)).
obj_type(0,(3,t0)).
objects((3,l0-1)).
obj_type(1,(3,l0-1)).
objects((4,p0)).
obj_type(4,(4,p0)).
objects((4,a0)).
obj_type(0,(4,a0)).
objects((4,l0-0)).
obj_type(1,(4,l0-0)).
objects((4,c0)).
obj_type(6,(4,c0)).
objects((4,t1)).
obj_type(0,(4,t1)).
objects((4,l1-1)).
obj_type(1,(4,l1-1)).
objects((4,l1-0)).
obj_type(1,(4,l1-0)).
objects((4,c1)).
obj_type(6,(4,c1)).
objects((4,t2)).
obj_type(0,(4,t2)).
objects((4,l0-2)).
obj_type(1,(4,l0-2)).
objects((4,t0)).
obj_type(0,(4,t0)).
objects((4,l0-1)).
obj_type(1,(4,l0-1)).
objects((4,l1-2)).
obj_type(1,(4,l1-2)).
objects((4,p1)).
obj_type(4,(4,p1)).
objects((5,p0)).
obj_type(4,(5,p0)).
objects((5,a0)).
obj_type(0,(5,a0)).
objects((5,l0-0)).
obj_type(1,(5,l0-0)).
objects((5,c0)).
obj_type(6,(5,c0)).
objects((5,t1)).
obj_type(0,(5,t1)).
objects((5,l1-1)).
obj_type(1,(5,l1-1)).
objects((5,l1-0)).
obj_type(1,(5,l1-0)).
objects((5,c1)).
obj_type(6,(5,c1)).
objects((5,t0)).
obj_type(0,(5,t0)).
objects((5,l0-2)).
obj_type(1,(5,l0-2)).
objects((5,l0-1)).
obj_type(1,(5,l0-1)).
objects((5,t2)).
obj_type(0,(5,t2)).
objects((5,l1-2)).
obj_type(1,(5,l1-2)).
objects((5,p1)).
obj_type(4,(5,p1)).
types(0).
types(1).
types(4).
types(6).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
action_arity("fly",5).
action_type_list("fly",(Type0, Type1, Type2, Type3, Type4)) :- action_arg_type(Type0,("fly",0)), action_arg_type(Type1,("fly",1)), action_arg_type(Type2,("fly",2)), action_arg_type(Type3,("fly",3)), action_arg_type(Type4,("fly",4)).
action_candidate("fly",Inst,(Obj0, Obj1, Obj2, Obj3, Obj4)):- instance(Inst),action_type_list("fly",(Type0, Type1, Type2, Type3, Type4)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_), obj_type(Type4,(Obj4)),Obj4=(Inst,_).
action_arity("drive",4).
action_type_list("drive",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("drive",0)), action_arg_type(Type1,("drive",1)), action_arg_type(Type2,("drive",2)), action_arg_type(Type3,("drive",3)).
action_candidate("drive",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("drive",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arity("load",4).
action_type_list("load",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("load",0)), action_arg_type(Type1,("load",1)), action_arg_type(Type2,("load",2)), action_arg_type(Type3,("load",3)).
action_candidate("load",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("load",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arity("unload",4).
action_type_list("unload",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("unload",0)), action_arg_type(Type1,("unload",1)), action_arg_type(Type2,("unload",2)), action_arg_type(Type3,("unload",3)).
action_candidate("unload",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("unload",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arg_type(0,("fly",0)).
action_arg_type(1,("fly",1)).
action_arg_type(0,("drive",0)).
action_arg_type(1,("drive",1)).
action_arg_type(4,("load",0)).
action_arg_type(0,("load",1)).
action_arg_type(4,("unload",0)).
action_arg_type(1,("drive",2)).
action_arg_type(6,("drive",3)).
action_arg_type(1,("fly",2)).
action_arg_type(6,("fly",3)).
action_arg_type(6,("fly",4)).
action_arg_type(1,("load",2)).
action_arg_type(6,("load",3)).
action_arg_type(0,("unload",1)).
action_arg_type(1,("unload",2)).
action_arg_type(6,("unload",3)).
action_possible("unload",0,((0,p0), (0,a0), (0,l0-0), (0,c0))).
action_possible("drive",0,((0,t1), (0,l1-1), (0,l1-0), (0,c1))).
action_possible("unload",0,((0,p0), (0,a0), (0,l2-0), (0,c2))).
action_possible("unload",0,((0,p0), (0,t0), (0,l0-1), (0,c0))).
action_possible("fly",0,((0,a0), (0,l2-0), (0,l0-0), (0,c0), (0,c2))).
action_possible("fly",0,((0,a0), (0,l1-0), (0,l2-1), (0,c2), (0,c1))).
action_possible("load",0,((0,p0), (0,t2), (0,l2-1), (0,c2))).
action_possible("fly",0,((0,a0), (0,l2-0), (0,l1-0), (0,c1), (0,c2))).
action_possible("load",0,((0,p0), (0,a0), (0,l1-0), (0,c1))).
action_possible("unload",0,((0,p0), (0,t1), (0,l1-1), (0,c1))).
action_possible("unload",0,((0,p0), (0,a0), (0,l2-1), (0,c2))).
action_possible("unload",0,((0,p0), (0,t0), (0,l0-0), (0,c0))).
action_possible("fly",0,((0,a0), (0,l1-0), (0,l2-0), (0,c2), (0,c1))).
action_possible("unload",0,((0,p0), (0,t2), (0,l2-0), (0,c2))).
action_possible("drive",0,((0,t2), (0,l2-1), (0,l2-0), (0,c2))).
action_possible("unload",0,((0,p0), (0,t2), (0,l2-1), (0,c2))).
action_possible("load",0,((0,p0), (0,t1), (0,l1-0), (0,c1))).
action_possible("fly",0,((0,a0), (0,l2-1), (0,l0-0), (0,c0), (0,c2))).
action_possible("drive",0,((0,t0), (0,l0-0), (0,l0-1), (0,c0))).
action_possible("unload",0,((0,p0), (0,a0), (0,l1-0), (0,c1))).
action_possible("fly",0,((0,a0), (0,l0-0), (0,l2-1), (0,c2), (0,c0))).
action_possible("drive",0,((0,t1), (0,l1-0), (0,l1-1), (0,c1))).
action_possible("fly",0,((0,a0), (0,l2-1), (0,l2-0), (0,c2), (0,c2))).
action_possible("drive",0,((0,t0), (0,l0-1), (0,l0-0), (0,c0))).
action_possible("fly",0,((0,a0), (0,l1-0), (0,l0-0), (0,c0), (0,c1))).
action_possible("load",0,((0,p0), (0,a0), (0,l0-0), (0,c0))).
action_possible("fly",0,((0,a0), (0,l0-0), (0,l2-0), (0,c2), (0,c0))).
action_possible("load",0,((0,p0), (0,a0), (0,l2-0), (0,c2))).
action_possible("load",0,((0,p0), (0,t0), (0,l0-1), (0,c0))).
action_possible("unload",0,((0,p0), (0,t1), (0,l1-0), (0,c1))).
action_possible("fly",0,((0,a0), (0,l0-0), (0,l1-0), (0,c1), (0,c0))).
action_possible("fly",0,((0,a0), (0,l2-0), (0,l2-1), (0,c2), (0,c2))).
action_possible("fly",0,((0,a0), (0,l2-1), (0,l1-0), (0,c1), (0,c2))).
action_possible("load",0,((0,p0), (0,t1), (0,l1-1), (0,c1))).
action_possible("load",0,((0,p0), (0,t0), (0,l0-0), (0,c0))).
action_possible("drive",0,((0,t2), (0,l2-0), (0,l2-1), (0,c2))).
action_possible("load",0,((0,p0), (0,t2), (0,l2-0), (0,c2))).
action_possible("load",0,((0,p0), (0,a0), (0,l2-1), (0,c2))).
action_possible("unload",1,((1,p0), (1,a0), (1,l0-0), (1,c0))).
action_possible("drive",1,((1,t1), (1,l1-1), (1,l1-0), (1,c1))).
action_possible("unload",1,((1,p0), (1,a0), (1,l2-0), (1,c2))).
action_possible("unload",1,((1,p0), (1,t0), (1,l0-1), (1,c0))).
action_possible("fly",1,((1,a0), (1,l2-0), (1,l0-0), (1,c0), (1,c2))).
action_possible("fly",1,((1,a0), (1,l1-0), (1,l2-1), (1,c2), (1,c1))).
action_possible("load",1,((1,p0), (1,t2), (1,l2-1), (1,c2))).
action_possible("fly",1,((1,a0), (1,l2-0), (1,l1-0), (1,c1), (1,c2))).
action_possible("load",1,((1,p0), (1,a0), (1,l1-0), (1,c1))).
action_possible("unload",1,((1,p0), (1,t1), (1,l1-1), (1,c1))).
action_possible("unload",1,((1,p0), (1,a0), (1,l2-1), (1,c2))).
action_possible("unload",1,((1,p0), (1,t0), (1,l0-0), (1,c0))).
action_possible("fly",1,((1,a0), (1,l1-0), (1,l2-0), (1,c2), (1,c1))).
action_possible("unload",1,((1,p0), (1,t2), (1,l2-0), (1,c2))).
action_possible("drive",1,((1,t2), (1,l2-1), (1,l2-0), (1,c2))).
action_possible("unload",1,((1,p0), (1,t2), (1,l2-1), (1,c2))).
action_possible("load",1,((1,p0), (1,t1), (1,l1-0), (1,c1))).
action_possible("fly",1,((1,a0), (1,l2-1), (1,l0-0), (1,c0), (1,c2))).
action_possible("drive",1,((1,t0), (1,l0-0), (1,l0-1), (1,c0))).
action_possible("unload",1,((1,p0), (1,a0), (1,l1-0), (1,c1))).
action_possible("fly",1,((1,a0), (1,l0-0), (1,l2-1), (1,c2), (1,c0))).
action_possible("drive",1,((1,t1), (1,l1-0), (1,l1-1), (1,c1))).
action_possible("fly",1,((1,a0), (1,l2-1), (1,l2-0), (1,c2), (1,c2))).
action_possible("fly",1,((1,a0), (1,l1-0), (1,l0-0), (1,c0), (1,c1))).
action_possible("drive",1,((1,t0), (1,l0-1), (1,l0-0), (1,c0))).
action_possible("load",1,((1,p0), (1,a0), (1,l0-0), (1,c0))).
action_possible("fly",1,((1,a0), (1,l0-0), (1,l2-0), (1,c2), (1,c0))).
action_possible("load",1,((1,p0), (1,a0), (1,l2-0), (1,c2))).
action_possible("load",1,((1,p0), (1,t0), (1,l0-1), (1,c0))).
action_possible("unload",1,((1,p0), (1,t1), (1,l1-0), (1,c1))).
action_possible("fly",1,((1,a0), (1,l0-0), (1,l1-0), (1,c1), (1,c0))).
action_possible("fly",1,((1,a0), (1,l2-0), (1,l2-1), (1,c2), (1,c2))).
action_possible("fly",1,((1,a0), (1,l2-1), (1,l1-0), (1,c1), (1,c2))).
action_possible("load",1,((1,p0), (1,t1), (1,l1-1), (1,c1))).
action_possible("load",1,((1,p0), (1,t0), (1,l0-0), (1,c0))).
action_possible("drive",1,((1,t2), (1,l2-0), (1,l2-1), (1,c2))).
action_possible("load",1,((1,p0), (1,t2), (1,l2-0), (1,c2))).
action_possible("load",1,((1,p0), (1,a0), (1,l2-1), (1,c2))).
action_possible("unload",2,((2,p0), (2,a0), (2,l0-0), (2,c0))).
action_possible("drive",2,((2,t1), (2,l1-1), (2,l1-0), (2,c1))).
action_possible("load",2,((2,p2), (2,t1), (2,l1-1), (2,c1))).
action_possible("load",2,((2,p2), (2,a1), (2,l1-0), (2,c1))).
action_possible("load",2,((2,p0), (2,a1), (2,l1-0), (2,c1))).
action_possible("load",2,((2,p2), (2,a0), (2,l0-0), (2,c0))).
action_possible("unload",2,((2,p0), (2,t0), (2,l0-1), (2,c0))).
action_possible("load",2,((2,p1), (2,a0), (2,l0-0), (2,c0))).
action_possible("load",2,((2,p0), (2,a0), (2,l1-0), (2,c1))).
action_possible("load",2,((2,p1), (2,t0), (2,l0-1), (2,c0))).
action_possible("unload",2,((2,p0), (2,t0), (2,l0-0), (2,c0))).
action_possible("unload",2,((2,p1), (2,a1), (2,l0-0), (2,c0))).
action_possible("load",2,((2,p1), (2,t0), (2,l0-0), (2,c0))).
action_possible("unload",2,((2,p1), (2,a0), (2,l0-0), (2,c0))).
action_possible("unload",2,((2,p2), (2,t1), (2,l1-1), (2,c1))).
action_possible("load",2,((2,p2), (2,t0), (2,l0-0), (2,c0))).
action_possible("unload",2,((2,p2), (2,a1), (2,l1-0), (2,c1))).
action_possible("unload",2,((2,p0), (2,a1), (2,l1-0), (2,c1))).
action_possible("unload",2,((2,p2), (2,a0), (2,l0-0), (2,c0))).
action_possible("load",2,((2,p1), (2,a1), (2,l1-0), (2,c1))).
action_possible("load",2,((2,p2), (2,t1), (2,l1-0), (2,c1))).
action_possible("unload",2,((2,p1), (2,t0), (2,l0-1), (2,c0))).
action_possible("load",2,((2,p0), (2,t1), (2,l1-0), (2,c1))).
action_possible("drive",2,((2,t0), (2,l0-0), (2,l0-1), (2,c0))).
action_possible("unload",2,((2,p0), (2,a0), (2,l1-0), (2,c1))).
action_possible("drive",2,((2,t0), (2,l0-1), (2,l0-0), (2,c0))).
action_possible("fly",2,((2,a0), (2,l1-0), (2,l0-0), (2,c0), (2,c1))).
action_possible("load",2,((2,p0), (2,a1), (2,l0-0), (2,c0))).
action_possible("load",2,((2,p1), (2,a0), (2,l1-0), (2,c1))).
action_possible("fly",2,((2,a1), (2,l1-0), (2,l0-0), (2,c0), (2,c1))).
action_possible("load",2,((2,p2), (2,a1), (2,l0-0), (2,c0))).
action_possible("load",2,((2,p2), (2,a0), (2,l1-0), (2,c1))).
action_possible("unload",2,((2,p1), (2,t0), (2,l0-0), (2,c0))).
action_possible("unload",2,((2,p2), (2,t0), (2,l0-0), (2,c0))).
action_possible("load",2,((2,p0), (2,a0), (2,l0-0), (2,c0))).
action_possible("fly",2,((2,a1), (2,l0-0), (2,l1-0), (2,c1), (2,c0))).
action_possible("unload",2,((2,p1), (2,a1), (2,l1-0), (2,c1))).
action_possible("unload",2,((2,p2), (2,t1), (2,l1-0), (2,c1))).
action_possible("load",2,((2,p0), (2,t0), (2,l0-1), (2,c0))).
action_possible("unload",2,((2,p0), (2,t1), (2,l1-0), (2,c1))).
action_possible("fly",2,((2,a0), (2,l0-0), (2,l1-0), (2,c1), (2,c0))).
action_possible("unload",2,((2,p0), (2,a1), (2,l0-0), (2,c0))).
action_possible("unload",2,((2,p1), (2,a0), (2,l1-0), (2,c1))).
action_possible("unload",2,((2,p2), (2,a1), (2,l0-0), (2,c0))).
action_possible("unload",2,((2,p2), (2,a0), (2,l1-0), (2,c1))).
action_possible("load",2,((2,p0), (2,t0), (2,l0-0), (2,c0))).
action_possible("drive",2,((2,t1), (2,l1-0), (2,l1-1), (2,c1))).
action_possible("load",2,((2,p1), (2,a1), (2,l0-0), (2,c0))).
action_possible("unload",3,((3,p0), (3,a0), (3,l0-0), (3,c0))).
action_possible("drive",3,((3,t1), (3,l1-1), (3,l1-0), (3,c1))).
action_possible("load",3,((3,p2), (3,a1), (3,l1-0), (3,c1))).
action_possible("load",3,((3,p0), (3,a1), (3,l1-0), (3,c1))).
action_possible("load",3,((3,p2), (3,a0), (3,l0-0), (3,c0))).
action_possible("load",3,((3,p1), (3,a0), (3,l0-0), (3,c0))).
action_possible("unload",3,((3,p0), (3,t0), (3,l0-1), (3,c0))).
action_possible("unload",3,((3,p1), (3,t1), (3,l1-0), (3,c1))).
action_possible("load",3,((3,p0), (3,a0), (3,l1-0), (3,c1))).
action_possible("load",3,((3,p2), (3,t0), (3,l0-1), (3,c0))).
action_possible("unload",3,((3,p0), (3,t1), (3,l1-1), (3,c1))).
action_possible("load",3,((3,p1), (3,t0), (3,l0-1), (3,c0))).
action_possible("unload",3,((3,p0), (3,t0), (3,l0-0), (3,c0))).
action_possible("unload",3,((3,p1), (3,a1), (3,l0-0), (3,c0))).
action_possible("load",3,((3,p1), (3,t0), (3,l0-0), (3,c0))).
action_possible("unload",3,((3,p1), (3,a0), (3,l0-0), (3,c0))).
action_possible("load",3,((3,p2), (3,t0), (3,l0-0), (3,c0))).
action_possible("unload",3,((3,p2), (3,a1), (3,l1-0), (3,c1))).
action_possible("unload",3,((3,p0), (3,a1), (3,l1-0), (3,c1))).
action_possible("unload",3,((3,p2), (3,a0), (3,l0-0), (3,c0))).
action_possible("load",3,((3,p1), (3,a1), (3,l1-0), (3,c1))).
action_possible("unload",3,((3,p1), (3,t0), (3,l0-1), (3,c0))).
action_possible("load",3,((3,p0), (3,t1), (3,l1-0), (3,c1))).
action_possible("drive",3,((3,t0), (3,l0-0), (3,l0-1), (3,c0))).
action_possible("unload",3,((3,p2), (3,t0), (3,l0-1), (3,c0))).
action_possible("unload",3,((3,p0), (3,a0), (3,l1-0), (3,c1))).
action_possible("fly",3,((3,a0), (3,l1-0), (3,l0-0), (3,c0), (3,c1))).
action_possible("drive",3,((3,t0), (3,l0-1), (3,l0-0), (3,c0))).
action_possible("load",3,((3,p1), (3,t1), (3,l1-1), (3,c1))).
action_possible("load",3,((3,p0), (3,a1), (3,l0-0), (3,c0))).
action_possible("load",3,((3,p1), (3,a0), (3,l1-0), (3,c1))).
action_possible("fly",3,((3,a1), (3,l1-0), (3,l0-0), (3,c0), (3,c1))).
action_possible("load",3,((3,p2), (3,a1), (3,l0-0), (3,c0))).
action_possible("unload",3,((3,p2), (3,t0), (3,l0-0), (3,c0))).
action_possible("unload",3,((3,p1), (3,t0), (3,l0-0), (3,c0))).
action_possible("load",3,((3,p2), (3,a0), (3,l1-0), (3,c1))).
action_possible("load",3,((3,p0), (3,a0), (3,l0-0), (3,c0))).
action_possible("fly",3,((3,a1), (3,l0-0), (3,l1-0), (3,c1), (3,c0))).
action_possible("unload",3,((3,p1), (3,a1), (3,l1-0), (3,c1))).
action_possible("load",3,((3,p0), (3,t0), (3,l0-1), (3,c0))).
action_possible("unload",3,((3,p0), (3,t1), (3,l1-0), (3,c1))).
action_possible("fly",3,((3,a0), (3,l0-0), (3,l1-0), (3,c1), (3,c0))).
action_possible("unload",3,((3,p0), (3,a1), (3,l0-0), (3,c0))).
action_possible("unload",3,((3,p1), (3,a0), (3,l1-0), (3,c1))).
action_possible("load",3,((3,p0), (3,t1), (3,l1-1), (3,c1))).
action_possible("load",3,((3,p1), (3,t1), (3,l1-0), (3,c1))).
action_possible("unload",3,((3,p2), (3,a1), (3,l0-0), (3,c0))).
action_possible("unload",3,((3,p2), (3,a0), (3,l1-0), (3,c1))).
action_possible("load",3,((3,p0), (3,t0), (3,l0-0), (3,c0))).
action_possible("unload",3,((3,p1), (3,t1), (3,l1-1), (3,c1))).
action_possible("drive",3,((3,t1), (3,l1-0), (3,l1-1), (3,c1))).
action_possible("load",3,((3,p1), (3,a1), (3,l0-0), (3,c0))).
action_possible("unload",4,((4,p0), (4,a0), (4,l0-0), (4,c0))).
action_possible("drive",4,((4,t1), (4,l1-1), (4,l1-0), (4,c1))).
action_possible("unload",4,((4,p0), (4,t2), (4,l0-2), (4,c0))).
action_possible("drive",4,((4,t0), (4,l0-2), (4,l0-1), (4,c0))).
action_possible("unload",4,((4,p0), (4,t0), (4,l0-2), (4,c0))).
action_possible("unload",4,((4,p0), (4,t0), (4,l0-1), (4,c0))).
action_possible("drive",4,((4,t1), (4,l1-0), (4,l1-2), (4,c1))).
action_possible("load",4,((4,p1), (4,a0), (4,l0-0), (4,c0))).
action_possible("load",4,((4,p1), (4,t2), (4,l0-2), (4,c0))).
action_possible("load",4,((4,p0), (4,a0), (4,l1-0), (4,c1))).
action_possible("load",4,((4,p1), (4,t0), (4,l0-2), (4,c0))).
action_possible("load",4,((4,p1), (4,t0), (4,l0-1), (4,c0))).
action_possible("unload",4,((4,p0), (4,t2), (4,l0-1), (4,c0))).
action_possible("drive",4,((4,t2), (4,l0-1), (4,l0-0), (4,c0))).
action_possible("drive",4,((4,t0), (4,l0-2), (4,l0-0), (4,c0))).
action_possible("unload",4,((4,p0), (4,t0), (4,l0-0), (4,c0))).
action_possible("load",4,((4,p1), (4,t2), (4,l0-1), (4,c0))).
action_possible("drive",4,((4,t2), (4,l0-2), (4,l0-1), (4,c0))).
action_possible("load",4,((4,p1), (4,t2), (4,l0-0), (4,c0))).
action_possible("load",4,((4,p1), (4,t0), (4,l0-0), (4,c0))).
action_possible("unload",4,((4,p1), (4,a0), (4,l0-0), (4,c0))).
action_possible("drive",4,((4,t2), (4,l0-1), (4,l0-2), (4,c0))).
action_possible("unload",4,((4,p1), (4,t2), (4,l0-2), (4,c0))).
action_possible("drive",4,((4,t0), (4,l0-1), (4,l0-2), (4,c0))).
action_possible("unload",4,((4,p1), (4,t0), (4,l0-2), (4,c0))).
action_possible("unload",4,((4,p1), (4,t0), (4,l0-1), (4,c0))).
action_possible("drive",4,((4,t0), (4,l0-0), (4,l0-2), (4,c0))).
action_possible("drive",4,((4,t0), (4,l0-0), (4,l0-1), (4,c0))).
action_possible("drive",4,((4,t2), (4,l0-2), (4,l0-0), (4,c0))).
action_possible("unload",4,((4,p0), (4,a0), (4,l1-0), (4,c1))).
action_possible("drive",4,((4,t2), (4,l0-0), (4,l0-2), (4,c0))).
action_possible("unload",4,((4,p1), (4,t2), (4,l0-1), (4,c0))).
action_possible("drive",4,((4,t0), (4,l0-1), (4,l0-0), (4,c0))).
action_possible("fly",4,((4,a0), (4,l1-0), (4,l0-0), (4,c0), (4,c1))).
action_possible("drive",4,((4,t2), (4,l0-0), (4,l0-1), (4,c0))).
action_possible("drive",4,((4,t1), (4,l1-2), (4,l1-0), (4,c1))).
action_possible("unload",4,((4,p1), (4,t2), (4,l0-0), (4,c0))).
action_possible("unload",4,((4,p1), (4,t0), (4,l0-0), (4,c0))).
action_possible("load",4,((4,p0), (4,a0), (4,l0-0), (4,c0))).
action_possible("load",4,((4,p0), (4,t2), (4,l0-0), (4,c0))).
action_possible("load",4,((4,p0), (4,t0), (4,l0-2), (4,c0))).
action_possible("drive",4,((4,t1), (4,l1-1), (4,l1-2), (4,c1))).
action_possible("load",4,((4,p0), (4,t2), (4,l0-2), (4,c0))).
action_possible("load",4,((4,p0), (4,t0), (4,l0-1), (4,c0))).
action_possible("fly",4,((4,a0), (4,l0-0), (4,l1-0), (4,c1), (4,c0))).
action_possible("load",4,((4,p0), (4,t0), (4,l0-0), (4,c0))).
action_possible("drive",4,((4,t1), (4,l1-0), (4,l1-1), (4,c1))).
action_possible("load",4,((4,p0), (4,t2), (4,l0-1), (4,c0))).
action_possible("unload",4,((4,p0), (4,t2), (4,l0-0), (4,c0))).
action_possible("drive",4,((4,t1), (4,l1-2), (4,l1-1), (4,c1))).
action_possible("unload",5,((5,p0), (5,a0), (5,l0-0), (5,c0))).
action_possible("drive",5,((5,t1), (5,l1-1), (5,l1-0), (5,c1))).
action_possible("unload",5,((5,p0), (5,t0), (5,l0-2), (5,c0))).
action_possible("drive",5,((5,t0), (5,l0-2), (5,l0-1), (5,c0))).
action_possible("unload",5,((5,p0), (5,t2), (5,l0-2), (5,c0))).
action_possible("unload",5,((5,p0), (5,t0), (5,l0-1), (5,c0))).
action_possible("drive",5,((5,t1), (5,l1-0), (5,l1-2), (5,c1))).
action_possible("load",5,((5,p1), (5,a0), (5,l0-0), (5,c0))).
action_possible("load",5,((5,p1), (5,t2), (5,l0-2), (5,c0))).
action_possible("load",5,((5,p0), (5,a0), (5,l1-0), (5,c1))).
action_possible("load",5,((5,p1), (5,t0), (5,l0-2), (5,c0))).
action_possible("load",5,((5,p1), (5,t0), (5,l0-1), (5,c0))).
action_possible("unload",5,((5,p0), (5,t2), (5,l0-1), (5,c0))).
action_possible("unload",5,((5,p0), (5,t0), (5,l0-0), (5,c0))).
action_possible("drive",5,((5,t0), (5,l0-2), (5,l0-0), (5,c0))).
action_possible("drive",5,((5,t2), (5,l0-1), (5,l0-0), (5,c0))).
action_possible("load",5,((5,p1), (5,t2), (5,l0-1), (5,c0))).
action_possible("drive",5,((5,t2), (5,l0-2), (5,l0-1), (5,c0))).
action_possible("load",5,((5,p1), (5,t2), (5,l0-0), (5,c0))).
action_possible("load",5,((5,p1), (5,t0), (5,l0-0), (5,c0))).
action_possible("unload",5,((5,p1), (5,a0), (5,l0-0), (5,c0))).
action_possible("drive",5,((5,t2), (5,l0-1), (5,l0-2), (5,c0))).
action_possible("unload",5,((5,p1), (5,t2), (5,l0-2), (5,c0))).
action_possible("drive",5,((5,t0), (5,l0-1), (5,l0-2), (5,c0))).
action_possible("unload",5,((5,p1), (5,t0), (5,l0-2), (5,c0))).
action_possible("unload",5,((5,p1), (5,t0), (5,l0-1), (5,c0))).
action_possible("drive",5,((5,t1), (5,l1-0), (5,l1-1), (5,c1))).
action_possible("drive",5,((5,t0), (5,l0-0), (5,l0-1), (5,c0))).
action_possible("drive",5,((5,t2), (5,l0-2), (5,l0-0), (5,c0))).
action_possible("drive",5,((5,t0), (5,l0-0), (5,l0-2), (5,c0))).
action_possible("drive",5,((5,t2), (5,l0-0), (5,l0-2), (5,c0))).
action_possible("unload",5,((5,p0), (5,a0), (5,l1-0), (5,c1))).
action_possible("unload",5,((5,p1), (5,t2), (5,l0-1), (5,c0))).
action_possible("drive",5,((5,t0), (5,l0-1), (5,l0-0), (5,c0))).
action_possible("fly",5,((5,a0), (5,l1-0), (5,l0-0), (5,c0), (5,c1))).
action_possible("drive",5,((5,t2), (5,l0-0), (5,l0-1), (5,c0))).
action_possible("drive",5,((5,t1), (5,l1-2), (5,l1-0), (5,c1))).
action_possible("unload",5,((5,p1), (5,t2), (5,l0-0), (5,c0))).
action_possible("unload",5,((5,p1), (5,t0), (5,l0-0), (5,c0))).
action_possible("load",5,((5,p0), (5,a0), (5,l0-0), (5,c0))).
action_possible("load",5,((5,p0), (5,t2), (5,l0-0), (5,c0))).
action_possible("load",5,((5,p0), (5,t0), (5,l0-2), (5,c0))).
action_possible("drive",5,((5,t1), (5,l1-1), (5,l1-2), (5,c1))).
action_possible("load",5,((5,p0), (5,t2), (5,l0-2), (5,c0))).
action_possible("load",5,((5,p0), (5,t0), (5,l0-1), (5,c0))).
action_possible("fly",5,((5,a0), (5,l0-0), (5,l1-0), (5,c1), (5,c0))).
action_possible("load",5,((5,p0), (5,t0), (5,l0-0), (5,c0))).
action_possible("load",5,((5,p0), (5,t2), (5,l0-1), (5,c0))).
action_possible("unload",5,((5,p0), (5,t2), (5,l0-0), (5,c0))).
action_possible("drive",5,((5,t1), (5,l1-2), (5,l1-1), (5,c1))).
