max_arity(4).
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
objects((0,0)).
obj_type(0,(0,0)).
objects((0,9)).
obj_type(1,(0,9)).
objects((0,6)).
obj_type(2,(0,6)).
objects((0,8)).
obj_type(1,(0,8)).
objects((0,3)).
obj_type(2,(0,3)).
objects((0,13)).
obj_type(1,(0,13)).
objects((0,2)).
obj_type(2,(0,2)).
objects((0,4)).
obj_type(2,(0,4)).
objects((0,7)).
obj_type(1,(0,7)).
objects((0,1)).
obj_type(2,(0,1)).
objects((0,5)).
obj_type(2,(0,5)).
objects((0,12)).
obj_type(5,(0,12)).
objects((0,10)).
obj_type(5,(0,10)).
objects((0,11)).
obj_type(5,(0,11)).
objects((1,0)).
obj_type(0,(1,0)).
objects((1,9)).
obj_type(1,(1,9)).
objects((1,6)).
obj_type(2,(1,6)).
objects((1,8)).
obj_type(1,(1,8)).
objects((1,3)).
obj_type(2,(1,3)).
objects((1,13)).
obj_type(1,(1,13)).
objects((1,2)).
obj_type(2,(1,2)).
objects((1,4)).
obj_type(2,(1,4)).
objects((1,7)).
obj_type(1,(1,7)).
objects((1,1)).
obj_type(2,(1,1)).
objects((1,5)).
obj_type(2,(1,5)).
objects((1,12)).
obj_type(5,(1,12)).
objects((1,10)).
obj_type(5,(1,10)).
objects((1,11)).
obj_type(5,(1,11)).
objects((2,2)).
obj_type(0,(2,2)).
objects((2,13)).
obj_type(1,(2,13)).
objects((2,6)).
obj_type(2,(2,6)).
objects((2,12)).
obj_type(1,(2,12)).
objects((2,4)).
obj_type(2,(2,4)).
objects((2,0)).
obj_type(0,(2,0)).
objects((2,7)).
obj_type(1,(2,7)).
objects((2,3)).
obj_type(2,(2,3)).
objects((2,1)).
obj_type(0,(2,1)).
objects((2,8)).
obj_type(1,(2,8)).
objects((2,10)).
obj_type(5,(2,10)).
objects((2,5)).
obj_type(2,(2,5)).
objects((2,9)).
obj_type(5,(2,9)).
objects((3,2)).
obj_type(0,(3,2)).
objects((3,13)).
obj_type(1,(3,13)).
objects((3,6)).
obj_type(2,(3,6)).
objects((3,12)).
obj_type(1,(3,12)).
objects((3,4)).
obj_type(2,(3,4)).
objects((3,0)).
obj_type(0,(3,0)).
objects((3,8)).
obj_type(1,(3,8)).
objects((3,5)).
obj_type(2,(3,5)).
objects((3,1)).
obj_type(0,(3,1)).
objects((3,10)).
obj_type(5,(3,10)).
objects((3,7)).
obj_type(1,(3,7)).
objects((3,9)).
obj_type(5,(3,9)).
objects((3,3)).
obj_type(2,(3,3)).
objects((4,0)).
obj_type(0,(4,0)).
objects((4,13)).
obj_type(1,(4,13)).
objects((4,7)).
obj_type(2,(4,7)).
objects((4,9)).
obj_type(1,(4,9)).
objects((4,4)).
obj_type(2,(4,4)).
objects((4,11)).
obj_type(5,(4,11)).
objects((4,2)).
obj_type(2,(4,2)).
objects((4,8)).
obj_type(1,(4,8)).
objects((4,5)).
obj_type(2,(4,5)).
objects((4,12)).
obj_type(5,(4,12)).
objects((4,1)).
obj_type(0,(4,1)).
objects((4,10)).
obj_type(1,(4,10)).
objects((4,3)).
obj_type(2,(4,3)).
objects((4,6)).
obj_type(2,(4,6)).
objects((5,1)).
obj_type(0,(5,1)).
objects((5,9)).
obj_type(1,(5,9)).
objects((5,4)).
obj_type(2,(5,4)).
objects((5,0)).
obj_type(0,(5,0)).
objects((5,13)).
obj_type(1,(5,13)).
objects((5,7)).
obj_type(2,(5,7)).
objects((5,11)).
obj_type(5,(5,11)).
objects((5,2)).
obj_type(2,(5,2)).
objects((5,8)).
obj_type(1,(5,8)).
objects((5,5)).
obj_type(2,(5,5)).
objects((5,12)).
obj_type(5,(5,12)).
objects((5,10)).
obj_type(1,(5,10)).
objects((5,3)).
obj_type(2,(5,3)).
objects((5,6)).
obj_type(2,(5,6)).
types(0).
types(1).
types(2).
types(5).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
action_arity("load",3).
action_type_list("load",(Type0, Type1, Type2)) :- action_arg_type(Type0,("load",0)), action_arg_type(Type1,("load",1)), action_arg_type(Type2,("load",2)).
action_candidate("load",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("load",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("fly",3).
action_type_list("fly",(Type0, Type1, Type2)) :- action_arg_type(Type0,("fly",0)), action_arg_type(Type1,("fly",1)), action_arg_type(Type2,("fly",2)).
action_candidate("fly",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("fly",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("drive",4).
action_type_list("drive",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("drive",0)), action_arg_type(Type1,("drive",1)), action_arg_type(Type2,("drive",2)), action_arg_type(Type3,("drive",3)).
action_candidate("drive",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("drive",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arity("unload",3).
action_type_list("unload",(Type0, Type1, Type2)) :- action_arg_type(Type0,("unload",0)), action_arg_type(Type1,("unload",1)), action_arg_type(Type2,("unload",2)).
action_candidate("unload",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("unload",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arg_type(0,("load",0)).
action_arg_type(1,("load",1)).
action_arg_type(1,("fly",0)).
action_arg_type(2,("fly",1)).
action_arg_type(1,("drive",0)).
action_arg_type(2,("drive",1)).
action_arg_type(5,("drive",2)).
action_arg_type(0,("unload",0)).
action_arg_type(2,("load",2)).
action_arg_type(2,("fly",2)).
action_arg_type(2,("drive",3)).
action_arg_type(1,("unload",1)).
action_arg_type(2,("unload",2)).
action_possible("unload",0,((0,0), (0,9), (0,6))).
action_possible("load",0,((0,0), (0,8), (0,3))).
action_possible("fly",0,((0,13), (0,2), (0,4))).
action_possible("fly",0,((0,13), (0,2), (0,6))).
action_possible("load",0,((0,0), (0,7), (0,1))).
action_possible("drive",0,((0,9), (0,5), (0,12), (0,6))).
action_possible("fly",0,((0,13), (0,4), (0,2))).
action_possible("load",0,((0,0), (0,13), (0,4))).
action_possible("unload",0,((0,0), (0,13), (0,2))).
action_possible("drive",0,((0,7), (0,1), (0,10), (0,2))).
action_possible("load",0,((0,0), (0,13), (0,6))).
action_possible("load",0,((0,0), (0,9), (0,5))).
action_possible("load",0,((0,0), (0,7), (0,2))).
action_possible("unload",0,((0,0), (0,8), (0,4))).
action_possible("drive",0,((0,8), (0,4), (0,11), (0,3))).
action_possible("drive",0,((0,8), (0,3), (0,11), (0,4))).
action_possible("unload",0,((0,0), (0,8), (0,3))).
action_possible("fly",0,((0,13), (0,6), (0,2))).
action_possible("unload",0,((0,0), (0,7), (0,1))).
action_possible("load",0,((0,0), (0,9), (0,6))).
action_possible("unload",0,((0,0), (0,13), (0,4))).
action_possible("load",0,((0,0), (0,13), (0,2))).
action_possible("fly",0,((0,13), (0,6), (0,4))).
action_possible("unload",0,((0,0), (0,13), (0,6))).
action_possible("drive",0,((0,9), (0,6), (0,12), (0,5))).
action_possible("unload",0,((0,0), (0,9), (0,5))).
action_possible("unload",0,((0,0), (0,7), (0,2))).
action_possible("fly",0,((0,13), (0,4), (0,6))).
action_possible("load",0,((0,0), (0,8), (0,4))).
action_possible("drive",0,((0,7), (0,2), (0,10), (0,1))).
action_possible("unload",1,((1,0), (1,9), (1,6))).
action_possible("load",1,((1,0), (1,8), (1,3))).
action_possible("fly",1,((1,13), (1,2), (1,4))).
action_possible("fly",1,((1,13), (1,2), (1,6))).
action_possible("load",1,((1,0), (1,7), (1,1))).
action_possible("drive",1,((1,9), (1,5), (1,12), (1,6))).
action_possible("fly",1,((1,13), (1,4), (1,2))).
action_possible("load",1,((1,0), (1,13), (1,4))).
action_possible("unload",1,((1,0), (1,13), (1,2))).
action_possible("drive",1,((1,7), (1,1), (1,10), (1,2))).
action_possible("load",1,((1,0), (1,13), (1,6))).
action_possible("load",1,((1,0), (1,9), (1,5))).
action_possible("load",1,((1,0), (1,7), (1,2))).
action_possible("unload",1,((1,0), (1,8), (1,4))).
action_possible("drive",1,((1,8), (1,4), (1,11), (1,3))).
action_possible("drive",1,((1,8), (1,3), (1,11), (1,4))).
action_possible("unload",1,((1,0), (1,8), (1,3))).
action_possible("fly",1,((1,13), (1,6), (1,2))).
action_possible("unload",1,((1,0), (1,7), (1,1))).
action_possible("load",1,((1,0), (1,9), (1,6))).
action_possible("unload",1,((1,0), (1,13), (1,4))).
action_possible("load",1,((1,0), (1,13), (1,2))).
action_possible("fly",1,((1,13), (1,6), (1,4))).
action_possible("unload",1,((1,0), (1,13), (1,6))).
action_possible("drive",1,((1,9), (1,6), (1,12), (1,5))).
action_possible("unload",1,((1,0), (1,9), (1,5))).
action_possible("unload",1,((1,0), (1,7), (1,2))).
action_possible("fly",1,((1,13), (1,4), (1,6))).
action_possible("load",1,((1,0), (1,8), (1,4))).
action_possible("drive",1,((1,7), (1,2), (1,10), (1,1))).
action_possible("load",2,((2,2), (2,13), (2,6))).
action_possible("fly",2,((2,12), (2,6), (2,4))).
action_possible("load",2,((2,0), (2,7), (2,3))).
action_possible("load",2,((2,0), (2,13), (2,4))).
action_possible("load",2,((2,1), (2,12), (2,6))).
action_possible("fly",2,((2,12), (2,4), (2,6))).
action_possible("unload",2,((2,0), (2,12), (2,6))).
action_possible("drive",2,((2,8), (2,6), (2,10), (2,5))).
action_possible("drive",2,((2,7), (2,4), (2,9), (2,3))).
action_possible("load",2,((2,0), (2,8), (2,6))).
action_possible("unload",2,((2,2), (2,12), (2,4))).
action_possible("load",2,((2,0), (2,7), (2,4))).
action_possible("load",2,((2,2), (2,12), (2,6))).
action_possible("unload",2,((2,2), (2,13), (2,6))).
action_possible("load",2,((2,1), (2,8), (2,5))).
action_possible("unload",2,((2,0), (2,7), (2,3))).
action_possible("unload",2,((2,0), (2,13), (2,4))).
action_possible("unload",2,((2,1), (2,12), (2,6))).
action_possible("load",2,((2,2), (2,8), (2,5))).
action_possible("load",2,((2,1), (2,8), (2,6))).
action_possible("unload",2,((2,0), (2,8), (2,6))).
action_possible("unload",2,((2,0), (2,7), (2,4))).
action_possible("drive",2,((2,8), (2,5), (2,10), (2,6))).
action_possible("unload",2,((2,2), (2,12), (2,6))).
action_possible("load",2,((2,1), (2,13), (2,4))).
action_possible("load",2,((2,2), (2,7), (2,4))).
action_possible("unload",2,((2,1), (2,8), (2,5))).
action_possible("load",2,((2,2), (2,8), (2,6))).
action_possible("load",2,((2,1), (2,12), (2,4))).
action_possible("load",2,((2,0), (2,13), (2,6))).
action_possible("unload",2,((2,2), (2,8), (2,5))).
action_possible("unload",2,((2,1), (2,8), (2,6))).
action_possible("load",2,((2,0), (2,12), (2,4))).
action_possible("load",2,((2,1), (2,13), (2,6))).
action_possible("unload",2,((2,1), (2,13), (2,4))).
action_possible("load",2,((2,2), (2,13), (2,4))).
action_possible("unload",2,((2,2), (2,7), (2,4))).
action_possible("drive",2,((2,7), (2,3), (2,9), (2,4))).
action_possible("unload",2,((2,2), (2,8), (2,6))).
action_possible("unload",2,((2,2), (2,13), (2,4))).
action_possible("unload",2,((2,1), (2,12), (2,4))).
action_possible("fly",2,((2,13), (2,6), (2,4))).
action_possible("unload",2,((2,0), (2,13), (2,6))).
action_possible("load",2,((2,0), (2,12), (2,6))).
action_possible("unload",2,((2,0), (2,12), (2,4))).
action_possible("fly",2,((2,13), (2,4), (2,6))).
action_possible("unload",2,((2,1), (2,13), (2,6))).
action_possible("load",2,((2,2), (2,12), (2,4))).
action_possible("load",3,((3,2), (3,13), (3,6))).
action_possible("fly",3,((3,12), (3,6), (3,4))).
action_possible("load",3,((3,0), (3,8), (3,5))).
action_possible("load",3,((3,0), (3,13), (3,4))).
action_possible("load",3,((3,1), (3,12), (3,6))).
action_possible("fly",3,((3,12), (3,4), (3,6))).
action_possible("unload",3,((3,0), (3,12), (3,6))).
action_possible("drive",3,((3,8), (3,6), (3,10), (3,5))).
action_possible("load",3,((3,0), (3,8), (3,6))).
action_possible("drive",3,((3,7), (3,4), (3,9), (3,3))).
action_possible("unload",3,((3,2), (3,12), (3,4))).
action_possible("load",3,((3,2), (3,12), (3,6))).
action_possible("unload",3,((3,2), (3,13), (3,6))).
action_possible("unload",3,((3,0), (3,8), (3,5))).
action_possible("load",3,((3,1), (3,8), (3,5))).
action_possible("unload",3,((3,0), (3,13), (3,4))).
action_possible("unload",3,((3,1), (3,12), (3,6))).
action_possible("load",3,((3,2), (3,8), (3,5))).
action_possible("load",3,((3,1), (3,8), (3,6))).
action_possible("load",3,((3,1), (3,7), (3,4))).
action_possible("unload",3,((3,0), (3,8), (3,6))).
action_possible("load",3,((3,1), (3,13), (3,4))).
action_possible("unload",3,((3,2), (3,12), (3,6))).
action_possible("drive",3,((3,8), (3,5), (3,10), (3,6))).
action_possible("unload",3,((3,1), (3,8), (3,5))).
action_possible("load",3,((3,2), (3,8), (3,6))).
action_possible("load",3,((3,1), (3,12), (3,4))).
action_possible("load",3,((3,0), (3,13), (3,6))).
action_possible("unload",3,((3,2), (3,8), (3,5))).
action_possible("unload",3,((3,1), (3,8), (3,6))).
action_possible("load",3,((3,0), (3,12), (3,4))).
action_possible("unload",3,((3,1), (3,7), (3,4))).
action_possible("load",3,((3,1), (3,13), (3,6))).
action_possible("unload",3,((3,1), (3,13), (3,4))).
action_possible("load",3,((3,2), (3,13), (3,4))).
action_possible("drive",3,((3,7), (3,3), (3,9), (3,4))).
action_possible("unload",3,((3,2), (3,8), (3,6))).
action_possible("unload",3,((3,1), (3,12), (3,4))).
action_possible("unload",3,((3,2), (3,13), (3,4))).
action_possible("fly",3,((3,13), (3,6), (3,4))).
action_possible("load",3,((3,0), (3,12), (3,6))).
action_possible("unload",3,((3,0), (3,13), (3,6))).
action_possible("unload",3,((3,0), (3,12), (3,4))).
action_possible("fly",3,((3,13), (3,4), (3,6))).
action_possible("unload",3,((3,1), (3,13), (3,6))).
action_possible("load",3,((3,2), (3,12), (3,4))).
action_possible("unload",4,((4,0), (4,13), (4,7))).
action_possible("drive",4,((4,9), (4,4), (4,11), (4,2))).
action_possible("fly",4,((4,13), (4,4), (4,7))).
action_possible("load",4,((4,0), (4,8), (4,5))).
action_possible("drive",4,((4,8), (4,5), (4,12), (4,7))).
action_possible("unload",4,((4,1), (4,10), (4,7))).
action_possible("unload",4,((4,1), (4,13), (4,7))).
action_possible("drive",4,((4,9), (4,3), (4,11), (4,2))).
action_possible("load",4,((4,0), (4,8), (4,6))).
action_possible("drive",4,((4,10), (4,6), (4,12), (4,7))).
action_possible("drive",4,((4,9), (4,2), (4,11), (4,3))).
action_possible("unload",4,((4,0), (4,8), (4,5))).
action_possible("load",4,((4,1), (4,8), (4,5))).
action_possible("load",4,((4,0), (4,8), (4,7))).
action_possible("drive",4,((4,8), (4,6), (4,12), (4,5))).
action_possible("load",4,((4,1), (4,8), (4,6))).
action_possible("unload",4,((4,0), (4,8), (4,6))).
action_possible("load",4,((4,0), (4,10), (4,5))).
action_possible("drive",4,((4,10), (4,7), (4,12), (4,5))).
action_possible("drive",4,((4,9), (4,4), (4,11), (4,3))).
action_possible("fly",4,((4,13), (4,7), (4,4))).
action_possible("load",4,((4,1), (4,13), (4,4))).
action_possible("load",4,((4,1), (4,8), (4,7))).
action_possible("drive",4,((4,10), (4,5), (4,12), (4,6))).
action_possible("unload",4,((4,1), (4,8), (4,5))).
action_possible("unload",4,((4,0), (4,8), (4,7))).
action_possible("load",4,((4,0), (4,10), (4,6))).
action_possible("drive",4,((4,10), (4,7), (4,12), (4,6))).
action_possible("load",4,((4,1), (4,10), (4,5))).
action_possible("drive",4,((4,8), (4,5), (4,12), (4,6))).
action_possible("drive",4,((4,10), (4,5), (4,12), (4,7))).
action_possible("unload",4,((4,1), (4,8), (4,6))).
action_possible("drive",4,((4,9), (4,2), (4,11), (4,4))).
action_possible("drive",4,((4,10), (4,6), (4,12), (4,5))).
action_possible("unload",4,((4,0), (4,10), (4,5))).
action_possible("load",4,((4,0), (4,10), (4,7))).
action_possible("unload",4,((4,1), (4,13), (4,4))).
action_possible("drive",4,((4,9), (4,3), (4,11), (4,4))).
action_possible("load",4,((4,1), (4,10), (4,6))).
action_possible("load",4,((4,0), (4,13), (4,7))).
action_possible("unload",4,((4,1), (4,8), (4,7))).
action_possible("drive",4,((4,8), (4,7), (4,12), (4,5))).
action_possible("unload",4,((4,0), (4,10), (4,6))).
action_possible("unload",4,((4,1), (4,10), (4,5))).
action_possible("load",4,((4,1), (4,13), (4,7))).
action_possible("drive",4,((4,8), (4,7), (4,12), (4,6))).
action_possible("drive",4,((4,8), (4,6), (4,12), (4,7))).
action_possible("load",4,((4,1), (4,10), (4,7))).
action_possible("unload",4,((4,0), (4,10), (4,7))).
action_possible("unload",4,((4,1), (4,10), (4,6))).
action_possible("unload",5,((5,1), (5,9), (5,4))).
action_possible("unload",5,((5,0), (5,13), (5,7))).
action_possible("drive",5,((5,9), (5,4), (5,11), (5,2))).
action_possible("fly",5,((5,13), (5,4), (5,7))).
action_possible("load",5,((5,0), (5,8), (5,5))).
action_possible("drive",5,((5,8), (5,5), (5,12), (5,7))).
action_possible("unload",5,((5,1), (5,10), (5,7))).
action_possible("unload",5,((5,1), (5,13), (5,7))).
action_possible("drive",5,((5,9), (5,3), (5,11), (5,2))).
action_possible("load",5,((5,1), (5,9), (5,2))).
action_possible("load",5,((5,0), (5,8), (5,6))).
action_possible("drive",5,((5,10), (5,6), (5,12), (5,7))).
action_possible("drive",5,((5,9), (5,2), (5,11), (5,3))).
action_possible("unload",5,((5,0), (5,8), (5,5))).
action_possible("load",5,((5,0), (5,8), (5,7))).
action_possible("drive",5,((5,8), (5,6), (5,12), (5,5))).
action_possible("load",5,((5,1), (5,9), (5,3))).
action_possible("unload",5,((5,1), (5,9), (5,2))).
action_possible("unload",5,((5,0), (5,8), (5,6))).
action_possible("load",5,((5,0), (5,10), (5,5))).
action_possible("fly",5,((5,13), (5,7), (5,4))).
action_possible("drive",5,((5,10), (5,7), (5,12), (5,5))).
action_possible("drive",5,((5,9), (5,4), (5,11), (5,3))).
action_possible("load",5,((5,1), (5,13), (5,4))).
action_possible("load",5,((5,1), (5,8), (5,7))).
action_possible("drive",5,((5,10), (5,5), (5,12), (5,6))).
action_possible("unload",5,((5,0), (5,8), (5,7))).
action_possible("load",5,((5,0), (5,10), (5,6))).
action_possible("drive",5,((5,10), (5,7), (5,12), (5,6))).
action_possible("unload",5,((5,1), (5,9), (5,3))).
action_possible("drive",5,((5,8), (5,5), (5,12), (5,6))).
action_possible("drive",5,((5,10), (5,5), (5,12), (5,7))).
action_possible("unload",5,((5,0), (5,10), (5,5))).
action_possible("drive",5,((5,9), (5,2), (5,11), (5,4))).
action_possible("drive",5,((5,10), (5,6), (5,12), (5,5))).
action_possible("load",5,((5,0), (5,10), (5,7))).
action_possible("unload",5,((5,1), (5,13), (5,4))).
action_possible("drive",5,((5,9), (5,3), (5,11), (5,4))).
action_possible("load",5,((5,1), (5,9), (5,4))).
action_possible("load",5,((5,0), (5,13), (5,7))).
action_possible("unload",5,((5,1), (5,8), (5,7))).
action_possible("drive",5,((5,8), (5,7), (5,12), (5,5))).
action_possible("unload",5,((5,0), (5,10), (5,6))).
action_possible("load",5,((5,1), (5,13), (5,7))).
action_possible("drive",5,((5,8), (5,7), (5,12), (5,6))).
action_possible("drive",5,((5,8), (5,6), (5,12), (5,7))).
action_possible("load",5,((5,1), (5,10), (5,7))).
action_possible("unload",5,((5,0), (5,10), (5,7))).
