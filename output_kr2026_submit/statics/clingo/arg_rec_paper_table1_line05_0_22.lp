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
objects((0,1)).
obj_type(1,(0,1)).
objects((0,7)).
obj_type(0,(0,7)).
objects((0,10)).
obj_type(0,(0,10)).
objects((0,9)).
obj_type(0,(0,9)).
objects((0,2)).
obj_type(1,(0,2)).
objects((0,13)).
obj_type(0,(0,13)).
objects((0,0)).
obj_type(1,(0,0)).
objects((0,6)).
obj_type(0,(0,6)).
objects((0,8)).
obj_type(0,(0,8)).
objects((0,5)).
obj_type(0,(0,5)).
objects((0,11)).
obj_type(0,(0,11)).
objects((0,12)).
obj_type(0,(0,12)).
objects((0,3)).
obj_type(4,(0,3)).
objects((0,4)).
obj_type(4,(0,4)).
objects((1,1)).
obj_type(1,(1,1)).
objects((1,7)).
obj_type(0,(1,7)).
objects((1,10)).
obj_type(0,(1,10)).
objects((1,9)).
obj_type(0,(1,9)).
objects((1,2)).
obj_type(1,(1,2)).
objects((1,13)).
obj_type(0,(1,13)).
objects((1,0)).
obj_type(1,(1,0)).
objects((1,6)).
obj_type(0,(1,6)).
objects((1,8)).
obj_type(0,(1,8)).
objects((1,5)).
obj_type(0,(1,5)).
objects((1,11)).
obj_type(0,(1,11)).
objects((1,12)).
obj_type(0,(1,12)).
objects((1,3)).
obj_type(4,(1,3)).
objects((1,4)).
obj_type(4,(1,4)).
objects((2,1)).
obj_type(1,(2,1)).
objects((2,7)).
obj_type(0,(2,7)).
objects((2,10)).
obj_type(0,(2,10)).
objects((2,9)).
obj_type(0,(2,9)).
objects((2,2)).
obj_type(1,(2,2)).
objects((2,0)).
obj_type(1,(2,0)).
objects((2,13)).
obj_type(0,(2,13)).
objects((2,6)).
obj_type(0,(2,6)).
objects((2,8)).
obj_type(0,(2,8)).
objects((2,12)).
obj_type(0,(2,12)).
objects((2,5)).
obj_type(0,(2,5)).
objects((2,11)).
obj_type(0,(2,11)).
objects((3,1)).
obj_type(1,(3,1)).
objects((3,7)).
obj_type(0,(3,7)).
objects((3,10)).
obj_type(0,(3,10)).
objects((3,9)).
obj_type(0,(3,9)).
objects((3,2)).
obj_type(1,(3,2)).
objects((3,13)).
obj_type(0,(3,13)).
objects((3,0)).
obj_type(1,(3,0)).
objects((3,6)).
obj_type(0,(3,6)).
objects((3,5)).
obj_type(0,(3,5)).
objects((3,12)).
obj_type(0,(3,12)).
objects((3,8)).
obj_type(0,(3,8)).
objects((3,11)).
obj_type(0,(3,11)).
objects((4,1)).
obj_type(1,(4,1)).
objects((4,7)).
obj_type(0,(4,7)).
objects((4,10)).
obj_type(0,(4,10)).
objects((4,9)).
obj_type(0,(4,9)).
objects((4,2)).
obj_type(1,(4,2)).
objects((4,0)).
obj_type(1,(4,0)).
objects((4,13)).
obj_type(0,(4,13)).
objects((4,6)).
obj_type(0,(4,6)).
objects((4,8)).
obj_type(0,(4,8)).
objects((4,12)).
obj_type(0,(4,12)).
objects((4,5)).
obj_type(0,(4,5)).
objects((4,11)).
obj_type(0,(4,11)).
objects((4,3)).
obj_type(4,(4,3)).
objects((5,1)).
obj_type(1,(5,1)).
objects((5,7)).
obj_type(0,(5,7)).
objects((5,10)).
obj_type(0,(5,10)).
objects((5,9)).
obj_type(0,(5,9)).
objects((5,2)).
obj_type(1,(5,2)).
objects((5,13)).
obj_type(0,(5,13)).
objects((5,0)).
obj_type(1,(5,0)).
objects((5,6)).
obj_type(0,(5,6)).
objects((5,12)).
obj_type(0,(5,12)).
objects((5,8)).
obj_type(0,(5,8)).
objects((5,5)).
obj_type(0,(5,5)).
objects((5,11)).
obj_type(0,(5,11)).
types(0).
types(1).
types(4).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
action_arity("move",2).
action_type_list("move",(Type0, Type1)) :- action_arg_type(Type0,("move",0)), action_arg_type(Type1,("move",1)).
action_candidate("move",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("move",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arity("pickup",2).
action_type_list("pickup",(Type0, Type1)) :- action_arg_type(Type0,("pickup",0)), action_arg_type(Type1,("pickup",1)).
action_candidate("pickup",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("pickup",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arity("pickup-and-loose",3).
action_type_list("pickup-and-loose",(Type0, Type1, Type2)) :- action_arg_type(Type0,("pickup-and-loose",0)), action_arg_type(Type1,("pickup-and-loose",1)), action_arg_type(Type2,("pickup-and-loose",2)).
action_candidate("pickup-and-loose",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("pickup-and-loose",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("unlock",4).
action_type_list("unlock",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("unlock",0)), action_arg_type(Type1,("unlock",1)), action_arg_type(Type2,("unlock",2)), action_arg_type(Type3,("unlock",3)).
action_candidate("unlock",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("unlock",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arity("putdown",2).
action_type_list("putdown",(Type0, Type1)) :- action_arg_type(Type0,("putdown",0)), action_arg_type(Type1,("putdown",1)).
action_candidate("putdown",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("putdown",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arg_type(0,("move",0)).
action_arg_type(1,("pickup",0)).
action_arg_type(1,("pickup-and-loose",0)).
action_arg_type(0,("unlock",0)).
action_arg_type(4,("unlock",1)).
action_arg_type(0,("pickup",1)).
action_arg_type(0,("move",1)).
action_arg_type(1,("pickup-and-loose",1)).
action_arg_type(0,("pickup-and-loose",2)).
action_arg_type(1,("putdown",0)).
action_arg_type(0,("putdown",1)).
action_arg_type(1,("unlock",2)).
action_arg_type(0,("unlock",3)).
action_possible("pickup",0,((0,1), (0,7))).
action_possible("move",0,((0,10), (0,9))).
action_possible("pickup-and-loose",0,((0,1), (0,2), (0,7))).
action_possible("putdown",0,((0,2), (0,13))).
action_possible("pickup",0,((0,0), (0,6))).
action_possible("pickup",0,((0,1), (0,8))).
action_possible("pickup-and-loose",0,((0,1), (0,0), (0,5))).
action_possible("putdown",0,((0,2), (0,8))).
action_possible("move",0,((0,5), (0,6))).
action_possible("pickup-and-loose",0,((0,2), (0,1), (0,10))).
action_possible("pickup",0,((0,2), (0,10))).
action_possible("putdown",0,((0,0), (0,10))).
action_possible("move",0,((0,11), (0,12))).
action_possible("putdown",0,((0,1), (0,12))).
action_possible("pickup",0,((0,0), (0,8))).
action_possible("unlock",0,((0,8), (0,3), (0,1), (0,9))).
action_possible("move",0,((0,9), (0,10))).
action_possible("unlock",0,((0,6), (0,4), (0,2), (0,9))).
action_possible("move",0,((0,12), (0,9))).
action_possible("pickup",0,((0,1), (0,10))).
action_possible("move",0,((0,13), (0,12))).
action_possible("move",0,((0,10), (0,7))).
action_possible("putdown",0,((0,0), (0,6))).
action_possible("move",0,((0,11), (0,8))).
action_possible("pickup",0,((0,1), (0,6))).
action_possible("pickup",0,((0,2), (0,7))).
action_possible("putdown",0,((0,1), (0,8))).
action_possible("pickup-and-loose",0,((0,1), (0,2), (0,6))).
action_possible("move",0,((0,9), (0,6))).
action_possible("unlock",0,((0,6), (0,4), (0,2), (0,5))).
action_possible("pickup-and-loose",0,((0,0), (0,1), (0,5))).
action_possible("move",0,((0,8), (0,9))).
action_possible("pickup-and-loose",0,((0,2), (0,0), (0,6))).
action_possible("pickup-and-loose",0,((0,0), (0,2), (0,6))).
action_possible("pickup-and-loose",0,((0,1), (0,0), (0,8))).
action_possible("move",0,((0,6), (0,7))).
action_possible("unlock",0,((0,11), (0,3), (0,1), (0,8))).
action_possible("pickup",0,((0,2), (0,9))).
action_possible("putdown",0,((0,0), (0,9))).
action_possible("move",0,((0,8), (0,5))).
action_possible("unlock",0,((0,8), (0,3), (0,1), (0,11))).
action_possible("move",0,((0,9), (0,12))).
action_possible("putdown",0,((0,1), (0,6))).
action_possible("putdown",0,((0,2), (0,7))).
action_possible("pickup",0,((0,1), (0,13))).
action_possible("pickup",0,((0,2), (0,5))).
action_possible("putdown",0,((0,0), (0,5))).
action_possible("move",0,((0,7), (0,10))).
action_possible("unlock",0,((0,6), (0,4), (0,0), (0,9))).
action_possible("move",0,((0,9), (0,8))).
action_possible("putdown",0,((0,1), (0,11))).
action_possible("move",0,((0,12), (0,13))).
action_possible("unlock",0,((0,12), (0,3), (0,1), (0,11))).
action_possible("pickup",0,((0,0), (0,7))).
action_possible("pickup",0,((0,1), (0,9))).
action_possible("unlock",0,((0,11), (0,3), (0,1), (0,12))).
action_possible("pickup-and-loose",0,((0,1), (0,2), (0,9))).
action_possible("pickup-and-loose",0,((0,0), (0,2), (0,5))).
action_possible("move",0,((0,13), (0,10))).
action_possible("putdown",0,((0,2), (0,9))).
action_possible("move",0,((0,7), (0,6))).
action_possible("unlock",0,((0,6), (0,4), (0,0), (0,5))).
action_possible("pickup-and-loose",0,((0,0), (0,1), (0,8))).
action_possible("move",0,((0,6), (0,9))).
action_possible("pickup-and-loose",0,((0,1), (0,2), (0,10))).
action_possible("putdown",0,((0,1), (0,7))).
action_possible("pickup",0,((0,1), (0,5))).
action_possible("pickup-and-loose",0,((0,0), (0,1), (0,9))).
action_possible("pickup",0,((0,2), (0,6))).
action_possible("putdown",0,((0,1), (0,13))).
action_possible("pickup",0,((0,0), (0,9))).
action_possible("unlock",0,((0,12), (0,3), (0,1), (0,13))).
action_possible("pickup-and-loose",0,((0,2), (0,1), (0,6))).
action_possible("move",0,((0,5), (0,8))).
action_possible("putdown",0,((0,2), (0,5))).
action_possible("pickup",0,((0,2), (0,12))).
action_possible("pickup-and-loose",0,((0,2), (0,0), (0,5))).
action_possible("move",0,((0,6), (0,5))).
action_possible("pickup-and-loose",0,((0,2), (0,1), (0,7))).
action_possible("pickup",0,((0,2), (0,13))).
action_possible("move",0,((0,12), (0,11))).
action_possible("putdown",0,((0,0), (0,7))).
action_possible("putdown",0,((0,1), (0,9))).
action_possible("pickup",0,((0,0), (0,5))).
action_possible("putdown",0,((0,2), (0,10))).
action_possible("unlock",0,((0,12), (0,3), (0,1), (0,9))).
action_possible("pickup",0,((0,2), (0,8))).
action_possible("putdown",0,((0,0), (0,8))).
action_possible("putdown",0,((0,1), (0,10))).
action_possible("pickup",0,((0,1), (0,11))).
action_possible("move",0,((0,10), (0,13))).
action_possible("unlock",0,((0,6), (0,4), (0,2), (0,7))).
action_possible("pickup-and-loose",0,((0,2), (0,1), (0,9))).
action_possible("pickup",0,((0,0), (0,10))).
action_possible("putdown",0,((0,1), (0,5))).
action_possible("move",0,((0,8), (0,11))).
action_possible("putdown",0,((0,2), (0,6))).
action_possible("pickup",0,((0,1), (0,12))).
action_possible("unlock",0,((0,8), (0,3), (0,1), (0,5))).
action_possible("pickup-and-loose",0,((0,1), (0,0), (0,9))).
action_possible("putdown",0,((0,2), (0,12))).
action_possible("pickup",1,((1,1), (1,7))).
action_possible("move",1,((1,10), (1,9))).
action_possible("pickup-and-loose",1,((1,1), (1,2), (1,7))).
action_possible("putdown",1,((1,2), (1,13))).
action_possible("pickup",1,((1,0), (1,6))).
action_possible("pickup",1,((1,1), (1,8))).
action_possible("pickup-and-loose",1,((1,1), (1,0), (1,5))).
action_possible("putdown",1,((1,2), (1,8))).
action_possible("move",1,((1,5), (1,6))).
action_possible("pickup-and-loose",1,((1,2), (1,1), (1,10))).
action_possible("pickup",1,((1,2), (1,10))).
action_possible("putdown",1,((1,0), (1,10))).
action_possible("move",1,((1,11), (1,12))).
action_possible("putdown",1,((1,1), (1,12))).
action_possible("pickup",1,((1,0), (1,8))).
action_possible("unlock",1,((1,8), (1,3), (1,1), (1,9))).
action_possible("move",1,((1,9), (1,10))).
action_possible("pickup",1,((1,1), (1,10))).
action_possible("move",1,((1,12), (1,9))).
action_possible("unlock",1,((1,6), (1,4), (1,2), (1,9))).
action_possible("move",1,((1,13), (1,12))).
action_possible("move",1,((1,10), (1,7))).
action_possible("putdown",1,((1,0), (1,6))).
action_possible("move",1,((1,11), (1,8))).
action_possible("pickup",1,((1,1), (1,6))).
action_possible("pickup",1,((1,2), (1,7))).
action_possible("putdown",1,((1,1), (1,8))).
action_possible("move",1,((1,9), (1,6))).
action_possible("unlock",1,((1,6), (1,4), (1,2), (1,5))).
action_possible("pickup-and-loose",1,((1,0), (1,1), (1,5))).
action_possible("move",1,((1,8), (1,9))).
action_possible("pickup-and-loose",1,((1,1), (1,0), (1,8))).
action_possible("move",1,((1,6), (1,7))).
action_possible("unlock",1,((1,11), (1,3), (1,1), (1,8))).
action_possible("unlock",1,((1,6), (1,4), (1,0), (1,7))).
action_possible("pickup",1,((1,2), (1,9))).
action_possible("putdown",1,((1,0), (1,9))).
action_possible("move",1,((1,8), (1,5))).
action_possible("unlock",1,((1,8), (1,3), (1,1), (1,11))).
action_possible("move",1,((1,9), (1,12))).
action_possible("putdown",1,((1,1), (1,6))).
action_possible("putdown",1,((1,2), (1,7))).
action_possible("pickup",1,((1,1), (1,13))).
action_possible("pickup",1,((1,0), (1,11))).
action_possible("pickup",1,((1,2), (1,5))).
action_possible("putdown",1,((1,0), (1,5))).
action_possible("move",1,((1,7), (1,10))).
action_possible("unlock",1,((1,6), (1,4), (1,0), (1,9))).
action_possible("move",1,((1,9), (1,8))).
action_possible("putdown",1,((1,1), (1,11))).
action_possible("move",1,((1,12), (1,13))).
action_possible("unlock",1,((1,12), (1,3), (1,1), (1,11))).
action_possible("pickup",1,((1,0), (1,7))).
action_possible("pickup",1,((1,1), (1,9))).
action_possible("unlock",1,((1,11), (1,3), (1,1), (1,12))).
action_possible("pickup-and-loose",1,((1,1), (1,2), (1,9))).
action_possible("pickup-and-loose",1,((1,0), (1,2), (1,5))).
action_possible("move",1,((1,13), (1,10))).
action_possible("putdown",1,((1,2), (1,9))).
action_possible("move",1,((1,7), (1,6))).
action_possible("unlock",1,((1,6), (1,4), (1,0), (1,5))).
action_possible("pickup-and-loose",1,((1,0), (1,1), (1,8))).
action_possible("move",1,((1,6), (1,9))).
action_possible("pickup-and-loose",1,((1,1), (1,2), (1,10))).
action_possible("putdown",1,((1,1), (1,7))).
action_possible("pickup",1,((1,1), (1,5))).
action_possible("pickup-and-loose",1,((1,0), (1,1), (1,9))).
action_possible("pickup",1,((1,2), (1,6))).
action_possible("putdown",1,((1,1), (1,13))).
action_possible("pickup",1,((1,0), (1,9))).
action_possible("unlock",1,((1,12), (1,3), (1,1), (1,13))).
action_possible("putdown",1,((1,0), (1,11))).
action_possible("move",1,((1,5), (1,8))).
action_possible("putdown",1,((1,2), (1,5))).
action_possible("pickup",1,((1,2), (1,12))).
action_possible("pickup-and-loose",1,((1,2), (1,0), (1,5))).
action_possible("move",1,((1,6), (1,5))).
action_possible("pickup-and-loose",1,((1,2), (1,1), (1,7))).
action_possible("pickup",1,((1,2), (1,13))).
action_possible("move",1,((1,12), (1,11))).
action_possible("putdown",1,((1,0), (1,7))).
action_possible("putdown",1,((1,1), (1,9))).
action_possible("pickup",1,((1,0), (1,5))).
action_possible("unlock",1,((1,12), (1,3), (1,1), (1,9))).
action_possible("putdown",1,((1,2), (1,10))).
action_possible("pickup",1,((1,2), (1,8))).
action_possible("putdown",1,((1,0), (1,8))).
action_possible("putdown",1,((1,1), (1,10))).
action_possible("pickup",1,((1,1), (1,11))).
action_possible("move",1,((1,10), (1,13))).
action_possible("unlock",1,((1,6), (1,4), (1,2), (1,7))).
action_possible("pickup-and-loose",1,((1,2), (1,0), (1,7))).
action_possible("pickup-and-loose",1,((1,0), (1,2), (1,7))).
action_possible("pickup-and-loose",1,((1,2), (1,1), (1,9))).
action_possible("pickup",1,((1,0), (1,10))).
action_possible("putdown",1,((1,1), (1,5))).
action_possible("move",1,((1,8), (1,11))).
action_possible("pickup",1,((1,1), (1,12))).
action_possible("putdown",1,((1,2), (1,6))).
action_possible("unlock",1,((1,8), (1,3), (1,1), (1,5))).
action_possible("pickup-and-loose",1,((1,1), (1,0), (1,9))).
action_possible("putdown",1,((1,2), (1,12))).
action_possible("pickup",2,((2,1), (2,7))).
action_possible("move",2,((2,10), (2,9))).
action_possible("pickup-and-loose",2,((2,1), (2,2), (2,7))).
action_possible("pickup-and-loose",2,((2,1), (2,0), (2,10))).
action_possible("putdown",2,((2,2), (2,13))).
action_possible("pickup",2,((2,0), (2,6))).
action_possible("pickup",2,((2,1), (2,8))).
action_possible("pickup",2,((2,0), (2,12))).
action_possible("putdown",2,((2,2), (2,8))).
action_possible("move",2,((2,5), (2,6))).
action_possible("pickup",2,((2,0), (2,13))).
action_possible("pickup-and-loose",2,((2,2), (2,1), (2,10))).
action_possible("pickup",2,((2,2), (2,10))).
action_possible("putdown",2,((2,0), (2,10))).
action_possible("move",2,((2,11), (2,12))).
action_possible("putdown",2,((2,1), (2,12))).
action_possible("pickup",2,((2,0), (2,8))).
action_possible("pickup",2,((2,1), (2,10))).
action_possible("move",2,((2,9), (2,10))).
action_possible("move",2,((2,12), (2,9))).
action_possible("move",2,((2,13), (2,12))).
action_possible("pickup-and-loose",2,((2,0), (2,2), (2,10))).
action_possible("pickup-and-loose",2,((2,2), (2,0), (2,10))).
action_possible("move",2,((2,10), (2,7))).
action_possible("putdown",2,((2,0), (2,6))).
action_possible("move",2,((2,11), (2,8))).
action_possible("pickup-and-loose",2,((2,0), (2,1), (2,10))).
action_possible("pickup",2,((2,2), (2,7))).
action_possible("putdown",2,((2,1), (2,8))).
action_possible("pickup",2,((2,1), (2,6))).
action_possible("pickup-and-loose",2,((2,1), (2,2), (2,6))).
action_possible("putdown",2,((2,0), (2,12))).
action_possible("move",2,((2,9), (2,6))).
action_possible("pickup-and-loose",2,((2,1), (2,0), (2,12))).
action_possible("move",2,((2,8), (2,9))).
action_possible("putdown",2,((2,0), (2,13))).
action_possible("pickup-and-loose",2,((2,0), (2,2), (2,6))).
action_possible("pickup-and-loose",2,((2,2), (2,0), (2,6))).
action_possible("move",2,((2,6), (2,7))).
action_possible("putdown",2,((2,2), (2,11))).
action_possible("pickup",2,((2,2), (2,9))).
action_possible("putdown",2,((2,0), (2,9))).
action_possible("move",2,((2,8), (2,5))).
action_possible("pickup-and-loose",2,((2,0), (2,2), (2,13))).
action_possible("move",2,((2,9), (2,12))).
action_possible("putdown",2,((2,1), (2,6))).
action_possible("putdown",2,((2,2), (2,7))).
action_possible("pickup",2,((2,1), (2,13))).
action_possible("pickup",2,((2,0), (2,11))).
action_possible("pickup",2,((2,2), (2,5))).
action_possible("putdown",2,((2,0), (2,5))).
action_possible("move",2,((2,7), (2,10))).
action_possible("pickup-and-loose",2,((2,1), (2,2), (2,13))).
action_possible("pickup-and-loose",2,((2,0), (2,1), (2,12))).
action_possible("move",2,((2,9), (2,8))).
action_possible("pickup",2,((2,0), (2,7))).
action_possible("move",2,((2,12), (2,13))).
action_possible("putdown",2,((2,1), (2,11))).
action_possible("pickup-and-loose",2,((2,2), (2,0), (2,13))).
action_possible("pickup",2,((2,1), (2,9))).
action_possible("pickup-and-loose",2,((2,0), (2,1), (2,13))).
action_possible("pickup-and-loose",2,((2,1), (2,2), (2,9))).
action_possible("move",2,((2,13), (2,10))).
action_possible("putdown",2,((2,2), (2,9))).
action_possible("move",2,((2,7), (2,6))).
action_possible("move",2,((2,6), (2,9))).
action_possible("pickup-and-loose",2,((2,1), (2,2), (2,10))).
action_possible("putdown",2,((2,1), (2,7))).
action_possible("pickup",2,((2,2), (2,11))).
action_possible("pickup",2,((2,1), (2,5))).
action_possible("pickup-and-loose",2,((2,0), (2,1), (2,9))).
action_possible("pickup",2,((2,2), (2,6))).
action_possible("putdown",2,((2,1), (2,13))).
action_possible("pickup",2,((2,0), (2,9))).
action_possible("pickup-and-loose",2,((2,2), (2,1), (2,6))).
action_possible("putdown",2,((2,0), (2,11))).
action_possible("move",2,((2,5), (2,8))).
action_possible("putdown",2,((2,2), (2,5))).
action_possible("pickup",2,((2,2), (2,12))).
action_possible("move",2,((2,6), (2,5))).
action_possible("pickup-and-loose",2,((2,2), (2,1), (2,7))).
action_possible("pickup",2,((2,2), (2,13))).
action_possible("move",2,((2,12), (2,11))).
action_possible("putdown",2,((2,0), (2,7))).
action_possible("pickup-and-loose",2,((2,2), (2,1), (2,13))).
action_possible("putdown",2,((2,1), (2,9))).
action_possible("pickup",2,((2,0), (2,5))).
action_possible("putdown",2,((2,2), (2,10))).
action_possible("pickup-and-loose",2,((2,1), (2,0), (2,7))).
action_possible("pickup",2,((2,2), (2,8))).
action_possible("pickup-and-loose",2,((2,1), (2,0), (2,13))).
action_possible("putdown",2,((2,0), (2,8))).
action_possible("putdown",2,((2,1), (2,10))).
action_possible("pickup",2,((2,1), (2,11))).
action_possible("move",2,((2,10), (2,13))).
action_possible("pickup-and-loose",2,((2,2), (2,0), (2,7))).
action_possible("pickup-and-loose",2,((2,0), (2,2), (2,7))).
action_possible("pickup-and-loose",2,((2,2), (2,1), (2,9))).
action_possible("pickup",2,((2,0), (2,10))).
action_possible("putdown",2,((2,1), (2,5))).
action_possible("move",2,((2,8), (2,11))).
action_possible("putdown",2,((2,2), (2,6))).
action_possible("pickup",2,((2,1), (2,12))).
action_possible("pickup-and-loose",2,((2,0), (2,1), (2,7))).
action_possible("pickup-and-loose",2,((2,1), (2,0), (2,9))).
action_possible("putdown",2,((2,2), (2,12))).
action_possible("pickup",3,((3,1), (3,7))).
action_possible("move",3,((3,10), (3,9))).
action_possible("pickup-and-loose",3,((3,1), (3,2), (3,7))).
action_possible("putdown",3,((3,2), (3,13))).
action_possible("pickup",3,((3,0), (3,6))).
action_possible("pickup-and-loose",3,((3,2), (3,1), (3,5))).
action_possible("pickup-and-loose",3,((3,1), (3,2), (3,12))).
action_possible("pickup",3,((3,1), (3,8))).
action_possible("pickup",3,((3,0), (3,12))).
action_possible("pickup-and-loose",3,((3,1), (3,2), (3,8))).
action_possible("pickup-and-loose",3,((3,1), (3,0), (3,5))).
action_possible("putdown",3,((3,2), (3,8))).
action_possible("move",3,((3,5), (3,6))).
action_possible("pickup",3,((3,0), (3,13))).
action_possible("pickup-and-loose",3,((3,2), (3,1), (3,10))).
action_possible("pickup",3,((3,2), (3,10))).
action_possible("putdown",3,((3,0), (3,10))).
action_possible("move",3,((3,11), (3,12))).
action_possible("pickup",3,((3,0), (3,8))).
action_possible("putdown",3,((3,1), (3,12))).
action_possible("pickup",3,((3,1), (3,10))).
action_possible("move",3,((3,9), (3,10))).
action_possible("pickup-and-loose",3,((3,2), (3,0), (3,9))).
action_possible("move",3,((3,12), (3,9))).
action_possible("move",3,((3,13), (3,12))).
action_possible("move",3,((3,10), (3,7))).
action_possible("putdown",3,((3,0), (3,6))).
action_possible("move",3,((3,11), (3,8))).
action_possible("pickup",3,((3,1), (3,6))).
action_possible("pickup",3,((3,2), (3,7))).
action_possible("putdown",3,((3,1), (3,8))).
action_possible("pickup-and-loose",3,((3,2), (3,1), (3,12))).
action_possible("pickup-and-loose",3,((3,1), (3,2), (3,6))).
action_possible("putdown",3,((3,0), (3,12))).
action_possible("move",3,((3,9), (3,6))).
action_possible("pickup-and-loose",3,((3,1), (3,0), (3,12))).
action_possible("pickup-and-loose",3,((3,0), (3,1), (3,5))).
action_possible("move",3,((3,8), (3,9))).
action_possible("putdown",3,((3,0), (3,13))).
action_possible("pickup-and-loose",3,((3,2), (3,1), (3,8))).
action_possible("pickup-and-loose",3,((3,0), (3,1), (3,6))).
action_possible("pickup-and-loose",3,((3,0), (3,2), (3,12))).
action_possible("move",3,((3,6), (3,7))).
action_possible("putdown",3,((3,2), (3,11))).
action_possible("pickup-and-loose",3,((3,1), (3,0), (3,8))).
action_possible("pickup",3,((3,2), (3,9))).
action_possible("putdown",3,((3,0), (3,9))).
action_possible("move",3,((3,8), (3,5))).
action_possible("move",3,((3,9), (3,12))).
action_possible("putdown",3,((3,1), (3,6))).
action_possible("putdown",3,((3,2), (3,7))).
action_possible("pickup",3,((3,1), (3,13))).
action_possible("pickup",3,((3,0), (3,11))).
action_possible("pickup",3,((3,2), (3,5))).
action_possible("putdown",3,((3,0), (3,5))).
action_possible("move",3,((3,7), (3,10))).
action_possible("pickup-and-loose",3,((3,0), (3,2), (3,9))).
action_possible("pickup-and-loose",3,((3,0), (3,1), (3,12))).
action_possible("move",3,((3,9), (3,8))).
action_possible("putdown",3,((3,1), (3,11))).
action_possible("move",3,((3,12), (3,13))).
action_possible("pickup",3,((3,0), (3,7))).
action_possible("pickup",3,((3,1), (3,9))).
action_possible("pickup-and-loose",3,((3,1), (3,2), (3,9))).
action_possible("pickup-and-loose",3,((3,1), (3,0), (3,6))).
action_possible("move",3,((3,13), (3,10))).
action_possible("putdown",3,((3,2), (3,9))).
action_possible("move",3,((3,7), (3,6))).
action_possible("pickup-and-loose",3,((3,0), (3,1), (3,8))).
action_possible("move",3,((3,6), (3,9))).
action_possible("pickup-and-loose",3,((3,1), (3,2), (3,10))).
action_possible("putdown",3,((3,1), (3,7))).
action_possible("pickup",3,((3,2), (3,11))).
action_possible("pickup",3,((3,1), (3,5))).
action_possible("pickup-and-loose",3,((3,0), (3,1), (3,9))).
action_possible("pickup",3,((3,2), (3,6))).
action_possible("pickup",3,((3,0), (3,9))).
action_possible("putdown",3,((3,1), (3,13))).
action_possible("pickup-and-loose",3,((3,2), (3,1), (3,6))).
action_possible("putdown",3,((3,0), (3,11))).
action_possible("move",3,((3,5), (3,8))).
action_possible("putdown",3,((3,2), (3,5))).
action_possible("pickup",3,((3,2), (3,12))).
action_possible("pickup-and-loose",3,((3,1), (3,0), (3,11))).
action_possible("pickup-and-loose",3,((3,1), (3,2), (3,5))).
action_possible("pickup-and-loose",3,((3,0), (3,2), (3,8))).
action_possible("move",3,((3,6), (3,5))).
action_possible("pickup-and-loose",3,((3,2), (3,1), (3,7))).
action_possible("pickup",3,((3,2), (3,13))).
action_possible("move",3,((3,12), (3,11))).
action_possible("putdown",3,((3,0), (3,7))).
action_possible("putdown",3,((3,1), (3,9))).
action_possible("pickup-and-loose",3,((3,0), (3,2), (3,11))).
action_possible("putdown",3,((3,2), (3,10))).
action_possible("pickup-and-loose",3,((3,2), (3,0), (3,11))).
action_possible("pickup",3,((3,0), (3,5))).
action_possible("pickup-and-loose",3,((3,0), (3,1), (3,11))).
action_possible("pickup",3,((3,2), (3,8))).
action_possible("pickup-and-loose",3,((3,2), (3,0), (3,12))).
action_possible("putdown",3,((3,0), (3,8))).
action_possible("putdown",3,((3,1), (3,10))).
action_possible("pickup",3,((3,1), (3,11))).
action_possible("move",3,((3,10), (3,13))).
action_possible("pickup-and-loose",3,((3,2), (3,1), (3,9))).
action_possible("pickup",3,((3,0), (3,10))).
action_possible("putdown",3,((3,1), (3,5))).
action_possible("move",3,((3,8), (3,11))).
action_possible("putdown",3,((3,2), (3,6))).
action_possible("pickup",3,((3,1), (3,12))).
action_possible("pickup-and-loose",3,((3,2), (3,0), (3,8))).
action_possible("pickup-and-loose",3,((3,1), (3,0), (3,9))).
action_possible("putdown",3,((3,2), (3,12))).
action_possible("pickup",4,((4,1), (4,7))).
action_possible("move",4,((4,10), (4,9))).
action_possible("pickup-and-loose",4,((4,1), (4,2), (4,7))).
action_possible("pickup-and-loose",4,((4,1), (4,0), (4,10))).
action_possible("putdown",4,((4,2), (4,13))).
action_possible("pickup",4,((4,0), (4,6))).
action_possible("pickup",4,((4,1), (4,8))).
action_possible("pickup",4,((4,0), (4,12))).
action_possible("putdown",4,((4,2), (4,8))).
action_possible("move",4,((4,5), (4,6))).
action_possible("pickup",4,((4,0), (4,13))).
action_possible("pickup-and-loose",4,((4,2), (4,1), (4,10))).
action_possible("pickup",4,((4,2), (4,10))).
action_possible("putdown",4,((4,0), (4,10))).
action_possible("move",4,((4,11), (4,12))).
action_possible("pickup",4,((4,0), (4,8))).
action_possible("putdown",4,((4,1), (4,12))).
action_possible("pickup",4,((4,1), (4,10))).
action_possible("move",4,((4,9), (4,10))).
action_possible("pickup-and-loose",4,((4,2), (4,0), (4,9))).
action_possible("move",4,((4,12), (4,9))).
action_possible("pickup-and-loose",4,((4,2), (4,0), (4,8))).
action_possible("move",4,((4,13), (4,12))).
action_possible("pickup-and-loose",4,((4,0), (4,2), (4,10))).
action_possible("pickup-and-loose",4,((4,2), (4,0), (4,10))).
action_possible("move",4,((4,10), (4,7))).
action_possible("putdown",4,((4,0), (4,6))).
action_possible("pickup",4,((4,1), (4,6))).
action_possible("pickup-and-loose",4,((4,0), (4,1), (4,10))).
action_possible("pickup",4,((4,2), (4,7))).
action_possible("putdown",4,((4,1), (4,8))).
action_possible("move",4,((4,11), (4,8))).
action_possible("pickup-and-loose",4,((4,1), (4,2), (4,6))).
action_possible("putdown",4,((4,0), (4,12))).
action_possible("move",4,((4,9), (4,6))).
action_possible("move",4,((4,8), (4,9))).
action_possible("putdown",4,((4,0), (4,13))).
action_possible("pickup-and-loose",4,((4,0), (4,2), (4,6))).
action_possible("pickup-and-loose",4,((4,2), (4,0), (4,6))).
action_possible("pickup-and-loose",4,((4,1), (4,0), (4,8))).
action_possible("move",4,((4,6), (4,7))).
action_possible("unlock",4,((4,11), (4,3), (4,1), (4,8))).
action_possible("pickup",4,((4,2), (4,9))).
action_possible("putdown",4,((4,0), (4,9))).
action_possible("move",4,((4,8), (4,5))).
action_possible("move",4,((4,9), (4,12))).
action_possible("putdown",4,((4,1), (4,6))).
action_possible("putdown",4,((4,2), (4,7))).
action_possible("pickup",4,((4,1), (4,13))).
action_possible("pickup",4,((4,0), (4,11))).
action_possible("pickup",4,((4,2), (4,5))).
action_possible("putdown",4,((4,0), (4,5))).
action_possible("move",4,((4,7), (4,10))).
action_possible("pickup-and-loose",4,((4,0), (4,2), (4,9))).
action_possible("move",4,((4,9), (4,8))).
action_possible("pickup",4,((4,0), (4,7))).
action_possible("move",4,((4,12), (4,13))).
action_possible("putdown",4,((4,1), (4,11))).
action_possible("pickup",4,((4,1), (4,9))).
action_possible("pickup-and-loose",4,((4,0), (4,1), (4,13))).
action_possible("unlock",4,((4,11), (4,3), (4,1), (4,12))).
action_possible("pickup-and-loose",4,((4,0), (4,2), (4,5))).
action_possible("move",4,((4,13), (4,10))).
action_possible("putdown",4,((4,2), (4,9))).
action_possible("move",4,((4,7), (4,6))).
action_possible("pickup-and-loose",4,((4,0), (4,1), (4,8))).
action_possible("move",4,((4,6), (4,9))).
action_possible("pickup-and-loose",4,((4,1), (4,2), (4,10))).
action_possible("putdown",4,((4,1), (4,7))).
action_possible("pickup",4,((4,1), (4,5))).
action_possible("pickup-and-loose",4,((4,0), (4,1), (4,9))).
action_possible("pickup",4,((4,2), (4,6))).
action_possible("pickup",4,((4,0), (4,9))).
action_possible("putdown",4,((4,1), (4,13))).
action_possible("pickup-and-loose",4,((4,2), (4,1), (4,6))).
action_possible("putdown",4,((4,0), (4,11))).
action_possible("move",4,((4,5), (4,8))).
action_possible("putdown",4,((4,2), (4,5))).
action_possible("pickup",4,((4,2), (4,12))).
action_possible("pickup-and-loose",4,((4,2), (4,0), (4,5))).
action_possible("move",4,((4,6), (4,5))).
action_possible("pickup-and-loose",4,((4,2), (4,1), (4,7))).
action_possible("pickup",4,((4,2), (4,13))).
action_possible("move",4,((4,12), (4,11))).
action_possible("putdown",4,((4,0), (4,7))).
action_possible("pickup",4,((4,0), (4,5))).
action_possible("putdown",4,((4,1), (4,9))).
action_possible("putdown",4,((4,2), (4,10))).
action_possible("pickup-and-loose",4,((4,1), (4,0), (4,7))).
action_possible("pickup",4,((4,2), (4,8))).
action_possible("pickup-and-loose",4,((4,1), (4,0), (4,13))).
action_possible("putdown",4,((4,0), (4,8))).
action_possible("putdown",4,((4,1), (4,10))).
action_possible("pickup",4,((4,1), (4,11))).
action_possible("move",4,((4,10), (4,13))).
action_possible("pickup-and-loose",4,((4,2), (4,0), (4,7))).
action_possible("pickup-and-loose",4,((4,0), (4,2), (4,7))).
action_possible("pickup",4,((4,0), (4,10))).
action_possible("putdown",4,((4,1), (4,5))).
action_possible("move",4,((4,8), (4,11))).
action_possible("putdown",4,((4,2), (4,6))).
action_possible("pickup",4,((4,1), (4,12))).
action_possible("pickup-and-loose",4,((4,0), (4,1), (4,7))).
action_possible("pickup-and-loose",4,((4,0), (4,2), (4,8))).
action_possible("pickup-and-loose",4,((4,1), (4,0), (4,9))).
action_possible("putdown",4,((4,2), (4,12))).
action_possible("pickup",5,((5,1), (5,7))).
action_possible("move",5,((5,10), (5,9))).
action_possible("putdown",5,((5,2), (5,13))).
action_possible("pickup",5,((5,0), (5,6))).
action_possible("pickup-and-loose",5,((5,1), (5,2), (5,12))).
action_possible("pickup",5,((5,1), (5,8))).
action_possible("pickup",5,((5,0), (5,12))).
action_possible("pickup-and-loose",5,((5,1), (5,2), (5,8))).
action_possible("pickup-and-loose",5,((5,1), (5,0), (5,5))).
action_possible("putdown",5,((5,2), (5,8))).
action_possible("move",5,((5,5), (5,6))).
action_possible("pickup",5,((5,0), (5,13))).
action_possible("pickup-and-loose",5,((5,2), (5,1), (5,10))).
action_possible("pickup",5,((5,2), (5,10))).
action_possible("putdown",5,((5,0), (5,10))).
action_possible("move",5,((5,11), (5,12))).
action_possible("putdown",5,((5,1), (5,12))).
action_possible("pickup",5,((5,0), (5,8))).
action_possible("pickup",5,((5,1), (5,10))).
action_possible("move",5,((5,9), (5,10))).
action_possible("pickup-and-loose",5,((5,2), (5,0), (5,9))).
action_possible("move",5,((5,12), (5,9))).
action_possible("pickup-and-loose",5,((5,1), (5,2), (5,11))).
action_possible("move",5,((5,13), (5,12))).
action_possible("pickup-and-loose",5,((5,2), (5,0), (5,10))).
action_possible("pickup-and-loose",5,((5,0), (5,2), (5,10))).
action_possible("move",5,((5,10), (5,7))).
action_possible("putdown",5,((5,0), (5,6))).
action_possible("move",5,((5,11), (5,8))).
action_possible("pickup",5,((5,1), (5,6))).
action_possible("pickup",5,((5,2), (5,7))).
action_possible("putdown",5,((5,1), (5,8))).
action_possible("pickup-and-loose",5,((5,2), (5,1), (5,12))).
action_possible("putdown",5,((5,0), (5,12))).
action_possible("move",5,((5,9), (5,6))).
action_possible("pickup-and-loose",5,((5,1), (5,0), (5,12))).
action_possible("pickup-and-loose",5,((5,0), (5,1), (5,5))).
action_possible("move",5,((5,8), (5,9))).
action_possible("putdown",5,((5,0), (5,13))).
action_possible("pickup-and-loose",5,((5,2), (5,1), (5,8))).
action_possible("pickup-and-loose",5,((5,1), (5,0), (5,8))).
action_possible("move",5,((5,6), (5,7))).
action_possible("putdown",5,((5,2), (5,11))).
action_possible("pickup-and-loose",5,((5,0), (5,2), (5,12))).
action_possible("pickup",5,((5,2), (5,9))).
action_possible("putdown",5,((5,0), (5,9))).
action_possible("move",5,((5,8), (5,5))).
action_possible("pickup-and-loose",5,((5,0), (5,2), (5,13))).
action_possible("move",5,((5,9), (5,12))).
action_possible("putdown",5,((5,1), (5,6))).
action_possible("putdown",5,((5,2), (5,7))).
action_possible("pickup",5,((5,1), (5,13))).
action_possible("pickup",5,((5,0), (5,11))).
action_possible("pickup",5,((5,2), (5,5))).
action_possible("putdown",5,((5,0), (5,5))).
action_possible("move",5,((5,7), (5,10))).
action_possible("pickup-and-loose",5,((5,0), (5,2), (5,9))).
action_possible("pickup-and-loose",5,((5,1), (5,2), (5,13))).
action_possible("pickup-and-loose",5,((5,0), (5,1), (5,12))).
action_possible("move",5,((5,9), (5,8))).
action_possible("putdown",5,((5,1), (5,11))).
action_possible("move",5,((5,12), (5,13))).
action_possible("pickup",5,((5,0), (5,7))).
action_possible("pickup-and-loose",5,((5,2), (5,0), (5,13))).
action_possible("pickup",5,((5,1), (5,9))).
action_possible("pickup-and-loose",5,((5,1), (5,2), (5,9))).
action_possible("move",5,((5,13), (5,10))).
action_possible("putdown",5,((5,2), (5,9))).
action_possible("move",5,((5,7), (5,6))).
action_possible("pickup-and-loose",5,((5,0), (5,1), (5,8))).
action_possible("move",5,((5,6), (5,9))).
action_possible("pickup-and-loose",5,((5,1), (5,2), (5,10))).
action_possible("pickup-and-loose",5,((5,2), (5,1), (5,11))).
action_possible("putdown",5,((5,1), (5,7))).
action_possible("pickup",5,((5,2), (5,11))).
action_possible("pickup",5,((5,1), (5,5))).
action_possible("pickup",5,((5,2), (5,6))).
action_possible("pickup-and-loose",5,((5,1), (5,0), (5,11))).
action_possible("putdown",5,((5,1), (5,13))).
action_possible("pickup",5,((5,0), (5,9))).
action_possible("putdown",5,((5,0), (5,11))).
action_possible("move",5,((5,5), (5,8))).
action_possible("putdown",5,((5,2), (5,5))).
action_possible("pickup",5,((5,2), (5,12))).
action_possible("pickup-and-loose",5,((5,0), (5,2), (5,8))).
action_possible("move",5,((5,6), (5,5))).
action_possible("pickup",5,((5,2), (5,13))).
action_possible("move",5,((5,12), (5,11))).
action_possible("putdown",5,((5,0), (5,7))).
action_possible("pickup-and-loose",5,((5,2), (5,1), (5,13))).
action_possible("putdown",5,((5,1), (5,9))).
action_possible("pickup",5,((5,0), (5,5))).
action_possible("putdown",5,((5,2), (5,10))).
action_possible("pickup-and-loose",5,((5,0), (5,2), (5,11))).
action_possible("pickup-and-loose",5,((5,2), (5,0), (5,11))).
action_possible("pickup-and-loose",5,((5,0), (5,1), (5,11))).
action_possible("pickup",5,((5,2), (5,8))).
action_possible("pickup-and-loose",5,((5,2), (5,0), (5,12))).
action_possible("putdown",5,((5,0), (5,8))).
action_possible("putdown",5,((5,1), (5,10))).
action_possible("pickup",5,((5,1), (5,11))).
action_possible("move",5,((5,10), (5,13))).
action_possible("pickup-and-loose",5,((5,2), (5,1), (5,9))).
action_possible("pickup",5,((5,0), (5,10))).
action_possible("putdown",5,((5,1), (5,5))).
action_possible("move",5,((5,8), (5,11))).
action_possible("pickup",5,((5,1), (5,12))).
action_possible("putdown",5,((5,2), (5,6))).
action_possible("pickup-and-loose",5,((5,2), (5,0), (5,8))).
action_possible("putdown",5,((5,2), (5,12))).
