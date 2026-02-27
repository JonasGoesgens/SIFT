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
objects((0,4)).
obj_type(0,(0,4)).
objects((0,9)).
obj_type(1,(0,9)).
objects((0,0)).
obj_type(2,(0,0)).
objects((0,1)).
obj_type(2,(0,1)).
objects((0,10)).
obj_type(1,(0,10)).
objects((0,8)).
obj_type(0,(0,8)).
objects((0,2)).
obj_type(0,(0,2)).
objects((0,6)).
obj_type(0,(0,6)).
objects((0,7)).
obj_type(0,(0,7)).
objects((0,3)).
obj_type(0,(0,3)).
objects((0,5)).
obj_type(0,(0,5)).
objects((1,4)).
obj_type(0,(1,4)).
objects((1,9)).
obj_type(1,(1,9)).
objects((1,0)).
obj_type(2,(1,0)).
objects((1,1)).
obj_type(2,(1,1)).
objects((1,2)).
obj_type(0,(1,2)).
objects((1,6)).
obj_type(0,(1,6)).
objects((1,7)).
obj_type(0,(1,7)).
objects((1,8)).
obj_type(0,(1,8)).
objects((1,3)).
obj_type(0,(1,3)).
objects((1,5)).
obj_type(0,(1,5)).
objects((1,10)).
obj_type(1,(1,10)).
objects((2,4)).
obj_type(0,(2,4)).
objects((2,9)).
obj_type(1,(2,9)).
objects((2,0)).
obj_type(2,(2,0)).
objects((2,1)).
obj_type(2,(2,1)).
objects((2,10)).
obj_type(1,(2,10)).
objects((2,8)).
obj_type(0,(2,8)).
objects((2,6)).
obj_type(0,(2,6)).
objects((2,7)).
obj_type(0,(2,7)).
objects((2,2)).
obj_type(0,(2,2)).
objects((2,3)).
obj_type(0,(2,3)).
objects((2,5)).
obj_type(0,(2,5)).
objects((3,4)).
obj_type(0,(3,4)).
objects((3,9)).
obj_type(1,(3,9)).
objects((3,0)).
obj_type(2,(3,0)).
objects((3,1)).
obj_type(2,(3,1)).
objects((3,10)).
obj_type(1,(3,10)).
objects((3,8)).
obj_type(0,(3,8)).
objects((3,3)).
obj_type(0,(3,3)).
objects((3,7)).
obj_type(0,(3,7)).
objects((3,6)).
obj_type(0,(3,6)).
objects((3,2)).
obj_type(0,(3,2)).
objects((3,5)).
obj_type(0,(3,5)).
objects((4,4)).
obj_type(0,(4,4)).
objects((4,9)).
obj_type(1,(4,9)).
objects((4,0)).
obj_type(2,(4,0)).
objects((4,1)).
obj_type(2,(4,1)).
objects((4,10)).
obj_type(1,(4,10)).
objects((4,8)).
obj_type(0,(4,8)).
objects((4,2)).
obj_type(0,(4,2)).
objects((4,6)).
obj_type(0,(4,6)).
objects((4,7)).
obj_type(0,(4,7)).
objects((4,3)).
obj_type(0,(4,3)).
objects((4,5)).
obj_type(0,(4,5)).
objects((5,4)).
obj_type(0,(5,4)).
objects((5,9)).
obj_type(1,(5,9)).
objects((5,0)).
obj_type(2,(5,0)).
objects((5,1)).
obj_type(2,(5,1)).
objects((5,10)).
obj_type(1,(5,10)).
objects((5,8)).
obj_type(0,(5,8)).
objects((5,2)).
obj_type(0,(5,2)).
objects((5,6)).
obj_type(0,(5,6)).
objects((5,7)).
obj_type(0,(5,7)).
objects((5,3)).
obj_type(0,(5,3)).
objects((5,5)).
obj_type(0,(5,5)).
types(0).
types(1).
types(2).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
action_arity("pick",4).
action_type_list("pick",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("pick",0)), action_arg_type(Type1,("pick",1)), action_arg_type(Type2,("pick",2)), action_arg_type(Type3,("pick",3)).
action_candidate("pick",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("pick",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arity("drop",4).
action_type_list("drop",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("drop",0)), action_arg_type(Type1,("drop",1)), action_arg_type(Type2,("drop",2)), action_arg_type(Type3,("drop",3)).
action_candidate("drop",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("drop",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arity("move",2).
action_type_list("move",(Type0, Type1)) :- action_arg_type(Type0,("move",0)), action_arg_type(Type1,("move",1)).
action_candidate("move",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("move",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arg_type(0,("pick",0)).
action_arg_type(1,("pick",1)).
action_arg_type(1,("drop",0)).
action_arg_type(2,("move",0)).
action_arg_type(2,("drop",1)).
action_arg_type(0,("drop",2)).
action_arg_type(2,("pick",2)).
action_arg_type(2,("move",1)).
action_arg_type(2,("pick",3)).
action_arg_type(2,("drop",3)).
action_possible("pick",0,((0,4), (0,9), (0,0), (0,1))).
action_possible("drop",0,((0,10), (0,0), (0,8), (0,1))).
action_possible("drop",0,((0,9), (0,1), (0,2), (0,0))).
action_possible("pick",0,((0,6), (0,9), (0,0), (0,1))).
action_possible("pick",0,((0,7), (0,9), (0,0), (0,1))).
action_possible("pick",0,((0,2), (0,9), (0,1), (0,0))).
action_possible("pick",0,((0,8), (0,9), (0,1), (0,0))).
action_possible("drop",0,((0,9), (0,0), (0,3), (0,1))).
action_possible("move",0,((0,1), (0,0))).
action_possible("drop",0,((0,9), (0,1), (0,7), (0,0))).
action_possible("pick",0,((0,4), (0,10), (0,0), (0,1))).
action_possible("pick",0,((0,3), (0,10), (0,1), (0,0))).
action_possible("drop",0,((0,9), (0,0), (0,8), (0,1))).
action_possible("pick",0,((0,8), (0,9), (0,0), (0,1))).
action_possible("drop",0,((0,10), (0,1), (0,3), (0,0))).
action_possible("pick",0,((0,2), (0,10), (0,1), (0,0))).
action_possible("pick",0,((0,6), (0,10), (0,1), (0,0))).
action_possible("drop",0,((0,10), (0,1), (0,6), (0,0))).
action_possible("drop",0,((0,10), (0,0), (0,4), (0,1))).
action_possible("drop",0,((0,9), (0,0), (0,2), (0,1))).
action_possible("pick",0,((0,2), (0,9), (0,0), (0,1))).
action_possible("pick",0,((0,8), (0,10), (0,0), (0,1))).
action_possible("drop",0,((0,9), (0,0), (0,5), (0,1))).
action_possible("drop",0,((0,9), (0,1), (0,3), (0,0))).
action_possible("pick",0,((0,3), (0,9), (0,1), (0,0))).
action_possible("pick",0,((0,7), (0,10), (0,1), (0,0))).
action_possible("move",0,((0,0), (0,1))).
action_possible("drop",0,((0,10), (0,0), (0,3), (0,1))).
action_possible("drop",0,((0,10), (0,0), (0,7), (0,1))).
action_possible("pick",0,((0,5), (0,10), (0,0), (0,1))).
action_possible("pick",0,((0,6), (0,9), (0,1), (0,0))).
action_possible("pick",0,((0,2), (0,10), (0,0), (0,1))).
action_possible("drop",0,((0,10), (0,1), (0,2), (0,0))).
action_possible("pick",0,((0,7), (0,9), (0,1), (0,0))).
action_possible("drop",0,((0,10), (0,1), (0,8), (0,0))).
action_possible("drop",0,((0,10), (0,0), (0,6), (0,1))).
action_possible("drop",0,((0,9), (0,0), (0,4), (0,1))).
action_possible("pick",0,((0,3), (0,10), (0,0), (0,1))).
action_possible("drop",0,((0,9), (0,1), (0,6), (0,0))).
action_possible("pick",0,((0,6), (0,10), (0,0), (0,1))).
action_possible("pick",0,((0,8), (0,10), (0,1), (0,0))).
action_possible("pick",0,((0,5), (0,9), (0,0), (0,1))).
action_possible("drop",0,((0,9), (0,0), (0,7), (0,1))).
action_possible("drop",0,((0,9), (0,0), (0,6), (0,1))).
action_possible("pick",0,((0,3), (0,9), (0,0), (0,1))).
action_possible("pick",0,((0,7), (0,10), (0,0), (0,1))).
action_possible("drop",0,((0,10), (0,0), (0,2), (0,1))).
action_possible("drop",0,((0,9), (0,1), (0,8), (0,0))).
action_possible("drop",0,((0,10), (0,0), (0,5), (0,1))).
action_possible("drop",0,((0,10), (0,1), (0,7), (0,0))).
action_possible("pick",1,((1,4), (1,9), (1,0), (1,1))).
action_possible("drop",1,((1,9), (1,1), (1,2), (1,0))).
action_possible("pick",1,((1,6), (1,9), (1,0), (1,1))).
action_possible("pick",1,((1,2), (1,9), (1,1), (1,0))).
action_possible("pick",1,((1,7), (1,9), (1,0), (1,1))).
action_possible("pick",1,((1,8), (1,9), (1,1), (1,0))).
action_possible("drop",1,((1,9), (1,0), (1,3), (1,1))).
action_possible("pick",1,((1,5), (1,9), (1,1), (1,0))).
action_possible("move",1,((1,1), (1,0))).
action_possible("drop",1,((1,9), (1,1), (1,5), (1,0))).
action_possible("drop",1,((1,9), (1,1), (1,7), (1,0))).
action_possible("pick",1,((1,4), (1,10), (1,0), (1,1))).
action_possible("pick",1,((1,3), (1,10), (1,1), (1,0))).
action_possible("drop",1,((1,9), (1,0), (1,8), (1,1))).
action_possible("pick",1,((1,8), (1,9), (1,0), (1,1))).
action_possible("drop",1,((1,10), (1,1), (1,3), (1,0))).
action_possible("pick",1,((1,6), (1,10), (1,1), (1,0))).
action_possible("drop",1,((1,10), (1,1), (1,6), (1,0))).
action_possible("drop",1,((1,10), (1,0), (1,4), (1,1))).
action_possible("drop",1,((1,9), (1,0), (1,2), (1,1))).
action_possible("pick",1,((1,2), (1,9), (1,0), (1,1))).
action_possible("drop",1,((1,9), (1,1), (1,4), (1,0))).
action_possible("drop",1,((1,9), (1,0), (1,5), (1,1))).
action_possible("drop",1,((1,9), (1,1), (1,3), (1,0))).
action_possible("pick",1,((1,3), (1,9), (1,1), (1,0))).
action_possible("pick",1,((1,7), (1,10), (1,1), (1,0))).
action_possible("move",1,((1,0), (1,1))).
action_possible("pick",1,((1,4), (1,9), (1,1), (1,0))).
action_possible("pick",1,((1,5), (1,10), (1,0), (1,1))).
action_possible("pick",1,((1,6), (1,9), (1,1), (1,0))).
action_possible("pick",1,((1,2), (1,10), (1,0), (1,1))).
action_possible("pick",1,((1,7), (1,9), (1,1), (1,0))).
action_possible("drop",1,((1,10), (1,1), (1,8), (1,0))).
action_possible("drop",1,((1,10), (1,0), (1,6), (1,1))).
action_possible("drop",1,((1,9), (1,0), (1,4), (1,1))).
action_possible("drop",1,((1,9), (1,1), (1,6), (1,0))).
action_possible("pick",1,((1,6), (1,10), (1,0), (1,1))).
action_possible("pick",1,((1,5), (1,9), (1,0), (1,1))).
action_possible("pick",1,((1,8), (1,10), (1,1), (1,0))).
action_possible("drop",1,((1,9), (1,0), (1,7), (1,1))).
action_possible("drop",1,((1,9), (1,0), (1,6), (1,1))).
action_possible("pick",1,((1,3), (1,9), (1,0), (1,1))).
action_possible("drop",1,((1,10), (1,0), (1,2), (1,1))).
action_possible("drop",1,((1,9), (1,1), (1,8), (1,0))).
action_possible("drop",1,((1,10), (1,0), (1,5), (1,1))).
action_possible("drop",1,((1,10), (1,1), (1,7), (1,0))).
action_possible("pick",2,((2,4), (2,9), (2,0), (2,1))).
action_possible("drop",2,((2,10), (2,1), (2,4), (2,0))).
action_possible("drop",2,((2,10), (2,0), (2,8), (2,1))).
action_possible("pick",2,((2,6), (2,9), (2,0), (2,1))).
action_possible("pick",2,((2,7), (2,9), (2,0), (2,1))).
action_possible("drop",2,((2,9), (2,1), (2,2), (2,0))).
action_possible("pick",2,((2,2), (2,9), (2,1), (2,0))).
action_possible("pick",2,((2,8), (2,9), (2,1), (2,0))).
action_possible("drop",2,((2,9), (2,0), (2,3), (2,1))).
action_possible("pick",2,((2,5), (2,9), (2,1), (2,0))).
action_possible("move",2,((2,1), (2,0))).
action_possible("drop",2,((2,9), (2,1), (2,5), (2,0))).
action_possible("pick",2,((2,4), (2,10), (2,0), (2,1))).
action_possible("pick",2,((2,3), (2,10), (2,1), (2,0))).
action_possible("drop",2,((2,9), (2,0), (2,8), (2,1))).
action_possible("pick",2,((2,8), (2,9), (2,0), (2,1))).
action_possible("drop",2,((2,10), (2,1), (2,3), (2,0))).
action_possible("pick",2,((2,2), (2,10), (2,1), (2,0))).
action_possible("drop",2,((2,10), (2,0), (2,4), (2,1))).
action_possible("drop",2,((2,9), (2,0), (2,2), (2,1))).
action_possible("pick",2,((2,2), (2,9), (2,0), (2,1))).
action_possible("drop",2,((2,9), (2,1), (2,4), (2,0))).
action_possible("pick",2,((2,8), (2,10), (2,0), (2,1))).
action_possible("drop",2,((2,9), (2,0), (2,5), (2,1))).
action_possible("drop",2,((2,9), (2,1), (2,3), (2,0))).
action_possible("pick",2,((2,3), (2,9), (2,1), (2,0))).
action_possible("move",2,((2,0), (2,1))).
action_possible("drop",2,((2,10), (2,0), (2,3), (2,1))).
action_possible("pick",2,((2,4), (2,9), (2,1), (2,0))).
action_possible("drop",2,((2,10), (2,0), (2,7), (2,1))).
action_possible("pick",2,((2,5), (2,10), (2,0), (2,1))).
action_possible("drop",2,((2,10), (2,1), (2,5), (2,0))).
action_possible("pick",2,((2,2), (2,10), (2,0), (2,1))).
action_possible("drop",2,((2,10), (2,1), (2,2), (2,0))).
action_possible("drop",2,((2,10), (2,1), (2,8), (2,0))).
action_possible("drop",2,((2,10), (2,0), (2,6), (2,1))).
action_possible("pick",2,((2,4), (2,10), (2,1), (2,0))).
action_possible("drop",2,((2,9), (2,0), (2,4), (2,1))).
action_possible("pick",2,((2,3), (2,10), (2,0), (2,1))).
action_possible("pick",2,((2,6), (2,10), (2,0), (2,1))).
action_possible("pick",2,((2,8), (2,10), (2,1), (2,0))).
action_possible("pick",2,((2,5), (2,9), (2,0), (2,1))).
action_possible("drop",2,((2,9), (2,0), (2,7), (2,1))).
action_possible("drop",2,((2,9), (2,0), (2,6), (2,1))).
action_possible("pick",2,((2,3), (2,9), (2,0), (2,1))).
action_possible("pick",2,((2,7), (2,10), (2,0), (2,1))).
action_possible("drop",2,((2,10), (2,0), (2,2), (2,1))).
action_possible("drop",2,((2,9), (2,1), (2,8), (2,0))).
action_possible("pick",2,((2,5), (2,10), (2,1), (2,0))).
action_possible("drop",2,((2,10), (2,0), (2,5), (2,1))).
action_possible("pick",3,((3,4), (3,9), (3,0), (3,1))).
action_possible("drop",3,((3,10), (3,0), (3,8), (3,1))).
action_possible("pick",3,((3,8), (3,9), (3,1), (3,0))).
action_possible("drop",3,((3,9), (3,0), (3,3), (3,1))).
action_possible("move",3,((3,1), (3,0))).
action_possible("drop",3,((3,9), (3,1), (3,7), (3,0))).
action_possible("pick",3,((3,4), (3,10), (3,0), (3,1))).
action_possible("pick",3,((3,3), (3,10), (3,1), (3,0))).
action_possible("pick",3,((3,8), (3,9), (3,0), (3,1))).
action_possible("drop",3,((3,9), (3,0), (3,8), (3,1))).
action_possible("drop",3,((3,10), (3,1), (3,3), (3,0))).
action_possible("pick",3,((3,6), (3,10), (3,1), (3,0))).
action_possible("drop",3,((3,10), (3,1), (3,6), (3,0))).
action_possible("drop",3,((3,10), (3,0), (3,4), (3,1))).
action_possible("drop",3,((3,9), (3,0), (3,2), (3,1))).
action_possible("pick",3,((3,2), (3,9), (3,0), (3,1))).
action_possible("pick",3,((3,8), (3,10), (3,0), (3,1))).
action_possible("drop",3,((3,9), (3,0), (3,5), (3,1))).
action_possible("drop",3,((3,9), (3,1), (3,3), (3,0))).
action_possible("pick",3,((3,3), (3,9), (3,1), (3,0))).
action_possible("pick",3,((3,7), (3,10), (3,1), (3,0))).
action_possible("move",3,((3,0), (3,1))).
action_possible("drop",3,((3,10), (3,0), (3,3), (3,1))).
action_possible("drop",3,((3,10), (3,0), (3,7), (3,1))).
action_possible("pick",3,((3,5), (3,10), (3,0), (3,1))).
action_possible("pick",3,((3,6), (3,9), (3,1), (3,0))).
action_possible("pick",3,((3,2), (3,10), (3,0), (3,1))).
action_possible("pick",3,((3,7), (3,9), (3,1), (3,0))).
action_possible("drop",3,((3,10), (3,1), (3,8), (3,0))).
action_possible("drop",3,((3,10), (3,0), (3,6), (3,1))).
action_possible("drop",3,((3,9), (3,0), (3,4), (3,1))).
action_possible("pick",3,((3,3), (3,10), (3,0), (3,1))).
action_possible("drop",3,((3,9), (3,1), (3,6), (3,0))).
action_possible("pick",3,((3,6), (3,10), (3,0), (3,1))).
action_possible("pick",3,((3,5), (3,9), (3,0), (3,1))).
action_possible("pick",3,((3,8), (3,10), (3,1), (3,0))).
action_possible("pick",3,((3,3), (3,9), (3,0), (3,1))).
action_possible("pick",3,((3,7), (3,10), (3,0), (3,1))).
action_possible("drop",3,((3,10), (3,0), (3,2), (3,1))).
action_possible("drop",3,((3,9), (3,1), (3,8), (3,0))).
action_possible("drop",3,((3,10), (3,0), (3,5), (3,1))).
action_possible("drop",3,((3,10), (3,1), (3,7), (3,0))).
action_possible("pick",4,((4,4), (4,9), (4,0), (4,1))).
action_possible("drop",4,((4,10), (4,0), (4,8), (4,1))).
action_possible("drop",4,((4,9), (4,1), (4,2), (4,0))).
action_possible("pick",4,((4,6), (4,9), (4,0), (4,1))).
action_possible("pick",4,((4,7), (4,9), (4,0), (4,1))).
action_possible("pick",4,((4,2), (4,9), (4,1), (4,0))).
action_possible("pick",4,((4,8), (4,9), (4,1), (4,0))).
action_possible("drop",4,((4,9), (4,0), (4,3), (4,1))).
action_possible("pick",4,((4,5), (4,9), (4,1), (4,0))).
action_possible("move",4,((4,1), (4,0))).
action_possible("drop",4,((4,9), (4,1), (4,5), (4,0))).
action_possible("drop",4,((4,9), (4,1), (4,7), (4,0))).
action_possible("pick",4,((4,4), (4,10), (4,0), (4,1))).
action_possible("pick",4,((4,3), (4,10), (4,1), (4,0))).
action_possible("drop",4,((4,9), (4,0), (4,8), (4,1))).
action_possible("pick",4,((4,8), (4,9), (4,0), (4,1))).
action_possible("drop",4,((4,10), (4,1), (4,3), (4,0))).
action_possible("pick",4,((4,6), (4,10), (4,1), (4,0))).
action_possible("drop",4,((4,10), (4,1), (4,6), (4,0))).
action_possible("drop",4,((4,10), (4,0), (4,4), (4,1))).
action_possible("drop",4,((4,9), (4,0), (4,2), (4,1))).
action_possible("pick",4,((4,2), (4,9), (4,0), (4,1))).
action_possible("pick",4,((4,8), (4,10), (4,0), (4,1))).
action_possible("drop",4,((4,9), (4,1), (4,4), (4,0))).
action_possible("drop",4,((4,9), (4,0), (4,5), (4,1))).
action_possible("drop",4,((4,9), (4,1), (4,3), (4,0))).
action_possible("pick",4,((4,3), (4,9), (4,1), (4,0))).
action_possible("move",4,((4,0), (4,1))).
action_possible("pick",4,((4,4), (4,9), (4,1), (4,0))).
action_possible("drop",4,((4,10), (4,0), (4,7), (4,1))).
action_possible("pick",4,((4,6), (4,9), (4,1), (4,0))).
action_possible("drop",4,((4,10), (4,1), (4,5), (4,0))).
action_possible("pick",4,((4,2), (4,10), (4,0), (4,1))).
action_possible("pick",4,((4,7), (4,9), (4,1), (4,0))).
action_possible("drop",4,((4,10), (4,0), (4,6), (4,1))).
action_possible("drop",4,((4,9), (4,0), (4,4), (4,1))).
action_possible("drop",4,((4,9), (4,1), (4,6), (4,0))).
action_possible("pick",4,((4,6), (4,10), (4,0), (4,1))).
action_possible("pick",4,((4,5), (4,9), (4,0), (4,1))).
action_possible("drop",4,((4,9), (4,0), (4,7), (4,1))).
action_possible("drop",4,((4,9), (4,0), (4,6), (4,1))).
action_possible("pick",4,((4,7), (4,10), (4,0), (4,1))).
action_possible("pick",4,((4,3), (4,9), (4,0), (4,1))).
action_possible("pick",4,((4,5), (4,10), (4,1), (4,0))).
action_possible("drop",4,((4,9), (4,1), (4,8), (4,0))).
action_possible("drop",4,((4,10), (4,0), (4,2), (4,1))).
action_possible("pick",5,((5,4), (5,9), (5,0), (5,1))).
action_possible("drop",5,((5,10), (5,0), (5,8), (5,1))).
action_possible("drop",5,((5,9), (5,1), (5,2), (5,0))).
action_possible("pick",5,((5,2), (5,9), (5,1), (5,0))).
action_possible("pick",5,((5,6), (5,9), (5,0), (5,1))).
action_possible("pick",5,((5,7), (5,9), (5,0), (5,1))).
action_possible("pick",5,((5,8), (5,9), (5,1), (5,0))).
action_possible("drop",5,((5,9), (5,0), (5,3), (5,1))).
action_possible("pick",5,((5,5), (5,9), (5,1), (5,0))).
action_possible("move",5,((5,1), (5,0))).
action_possible("drop",5,((5,9), (5,1), (5,5), (5,0))).
action_possible("drop",5,((5,9), (5,1), (5,7), (5,0))).
action_possible("pick",5,((5,4), (5,10), (5,0), (5,1))).
action_possible("pick",5,((5,3), (5,10), (5,1), (5,0))).
action_possible("drop",5,((5,9), (5,0), (5,8), (5,1))).
action_possible("pick",5,((5,8), (5,9), (5,0), (5,1))).
action_possible("drop",5,((5,10), (5,1), (5,3), (5,0))).
action_possible("pick",5,((5,6), (5,10), (5,1), (5,0))).
action_possible("drop",5,((5,10), (5,1), (5,6), (5,0))).
action_possible("drop",5,((5,10), (5,0), (5,4), (5,1))).
action_possible("drop",5,((5,9), (5,0), (5,2), (5,1))).
action_possible("pick",5,((5,2), (5,9), (5,0), (5,1))).
action_possible("pick",5,((5,8), (5,10), (5,0), (5,1))).
action_possible("drop",5,((5,9), (5,1), (5,4), (5,0))).
action_possible("drop",5,((5,9), (5,0), (5,5), (5,1))).
action_possible("drop",5,((5,9), (5,1), (5,3), (5,0))).
action_possible("pick",5,((5,3), (5,9), (5,1), (5,0))).
action_possible("pick",5,((5,7), (5,10), (5,1), (5,0))).
action_possible("move",5,((5,0), (5,1))).
action_possible("pick",5,((5,4), (5,9), (5,1), (5,0))).
action_possible("pick",5,((5,5), (5,10), (5,0), (5,1))).
action_possible("pick",5,((5,6), (5,9), (5,1), (5,0))).
action_possible("drop",5,((5,10), (5,1), (5,5), (5,0))).
action_possible("pick",5,((5,2), (5,10), (5,0), (5,1))).
action_possible("pick",5,((5,7), (5,9), (5,1), (5,0))).
action_possible("drop",5,((5,9), (5,0), (5,4), (5,1))).
action_possible("drop",5,((5,9), (5,1), (5,6), (5,0))).
action_possible("pick",5,((5,5), (5,9), (5,0), (5,1))).
action_possible("drop",5,((5,9), (5,0), (5,7), (5,1))).
action_possible("drop",5,((5,9), (5,0), (5,6), (5,1))).
action_possible("pick",5,((5,3), (5,9), (5,0), (5,1))).
action_possible("pick",5,((5,5), (5,10), (5,1), (5,0))).
action_possible("drop",5,((5,9), (5,1), (5,8), (5,0))).
action_possible("drop",5,((5,10), (5,0), (5,2), (5,1))).
action_possible("drop",5,((5,10), (5,0), (5,5), (5,1))).
action_possible("drop",5,((5,10), (5,1), (5,7), (5,0))).
