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
objects((0,6)).
obj_type(0,(0,6)).
objects((0,5)).
obj_type(4,(0,5)).
objects((0,1)).
obj_type(0,(0,1)).
objects((0,7)).
obj_type(0,(0,7)).
objects((0,2)).
obj_type(0,(0,2)).
objects((0,0)).
obj_type(0,(0,0)).
objects((0,3)).
obj_type(3,(0,3)).
objects((0,4)).
obj_type(4,(0,4)).
objects((1,6)).
obj_type(0,(1,6)).
objects((1,5)).
obj_type(4,(1,5)).
objects((1,1)).
obj_type(0,(1,1)).
objects((1,7)).
obj_type(0,(1,7)).
objects((1,2)).
obj_type(0,(1,2)).
objects((1,0)).
obj_type(0,(1,0)).
objects((1,3)).
obj_type(3,(1,3)).
objects((1,4)).
obj_type(4,(1,4)).
objects((2,8)).
obj_type(0,(2,8)).
objects((2,7)).
obj_type(4,(2,7)).
objects((2,4)).
obj_type(0,(2,4)).
objects((2,5)).
obj_type(3,(2,5)).
objects((2,2)).
obj_type(0,(2,2)).
objects((2,1)).
obj_type(0,(2,1)).
objects((2,3)).
obj_type(0,(2,3)).
objects((2,0)).
obj_type(0,(2,0)).
objects((2,6)).
obj_type(3,(2,6)).
objects((3,8)).
obj_type(0,(3,8)).
objects((3,7)).
obj_type(4,(3,7)).
objects((3,4)).
obj_type(0,(3,4)).
objects((3,5)).
obj_type(3,(3,5)).
objects((3,2)).
obj_type(0,(3,2)).
objects((3,1)).
obj_type(0,(3,1)).
objects((3,3)).
obj_type(0,(3,3)).
objects((3,0)).
obj_type(0,(3,0)).
objects((3,6)).
obj_type(3,(3,6)).
objects((4,8)).
obj_type(0,(4,8)).
objects((4,7)).
obj_type(4,(4,7)).
objects((4,4)).
obj_type(0,(4,4)).
objects((4,2)).
obj_type(0,(4,2)).
objects((4,6)).
obj_type(4,(4,6)).
objects((4,5)).
obj_type(3,(4,5)).
objects((4,1)).
obj_type(0,(4,1)).
objects((4,3)).
obj_type(0,(4,3)).
objects((4,0)).
obj_type(0,(4,0)).
objects((5,2)).
obj_type(0,(5,2)).
objects((5,8)).
obj_type(0,(5,8)).
objects((5,4)).
obj_type(0,(5,4)).
objects((5,6)).
obj_type(4,(5,6)).
objects((5,5)).
obj_type(3,(5,5)).
objects((5,7)).
obj_type(4,(5,7)).
objects((5,1)).
obj_type(0,(5,1)).
objects((5,3)).
obj_type(0,(5,3)).
objects((5,0)).
obj_type(0,(5,0)).
types(0).
types(3).
types(4).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
action_arity("drive-truck",4).
action_type_list("drive-truck",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("drive-truck",0)), action_arg_type(Type1,("drive-truck",1)), action_arg_type(Type2,("drive-truck",2)), action_arg_type(Type3,("drive-truck",3)).
action_candidate("drive-truck",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("drive-truck",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arity("walk",3).
action_type_list("walk",(Type0, Type1, Type2)) :- action_arg_type(Type0,("walk",0)), action_arg_type(Type1,("walk",1)), action_arg_type(Type2,("walk",2)).
action_candidate("walk",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("walk",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("unload-truck",4).
action_type_list("unload-truck",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("unload-truck",0)), action_arg_type(Type1,("unload-truck",1)), action_arg_type(Type2,("unload-truck",2)), action_arg_type(Type3,("unload-truck",3)).
action_candidate("unload-truck",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("unload-truck",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arity("disembark-truck",3).
action_type_list("disembark-truck",(Type0, Type1, Type2)) :- action_arg_type(Type0,("disembark-truck",0)), action_arg_type(Type1,("disembark-truck",1)), action_arg_type(Type2,("disembark-truck",2)).
action_candidate("disembark-truck",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("disembark-truck",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("board-truck",3).
action_type_list("board-truck",(Type0, Type1, Type2)) :- action_arg_type(Type0,("board-truck",0)), action_arg_type(Type1,("board-truck",1)), action_arg_type(Type2,("board-truck",2)).
action_candidate("board-truck",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("board-truck",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("load-truck",4).
action_type_list("load-truck",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("load-truck",0)), action_arg_type(Type1,("load-truck",1)), action_arg_type(Type2,("load-truck",2)), action_arg_type(Type3,("load-truck",3)).
action_candidate("load-truck",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("load-truck",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arg_type(0,("drive-truck",0)).
action_arg_type(0,("drive-truck",1)).
action_arg_type(0,("walk",0)).
action_arg_type(0,("walk",1)).
action_arg_type(3,("unload-truck",0)).
action_arg_type(0,("disembark-truck",0)).
action_arg_type(0,("board-truck",0)).
action_arg_type(4,("board-truck",1)).
action_arg_type(3,("load-truck",0)).
action_arg_type(4,("load-truck",1)).
action_arg_type(4,("unload-truck",1)).
action_arg_type(0,("disembark-truck",1)).
action_arg_type(4,("disembark-truck",2)).
action_arg_type(0,("drive-truck",2)).
action_arg_type(4,("drive-truck",3)).
action_arg_type(0,("walk",2)).
action_arg_type(0,("board-truck",2)).
action_arg_type(0,("load-truck",2)).
action_arg_type(0,("load-truck",3)).
action_arg_type(0,("unload-truck",2)).
action_arg_type(0,("unload-truck",3)).
action_possible("board-truck",0,((0,6), (0,5), (0,1))).
action_possible("disembark-truck",0,((0,7), (0,1), (0,5))).
action_possible("walk",0,((0,7), (0,2), (0,0))).
action_possible("drive-truck",0,((0,2), (0,7), (0,1), (0,5))).
action_possible("load-truck",0,((0,3), (0,4), (0,1), (0,7))).
action_possible("board-truck",0,((0,6), (0,5), (0,2))).
action_possible("unload-truck",0,((0,3), (0,5), (0,2), (0,7))).
action_possible("drive-truck",0,((0,1), (0,7), (0,2), (0,4))).
action_possible("board-truck",0,((0,7), (0,5), (0,1))).
action_possible("walk",0,((0,6), (0,1), (0,0))).
action_possible("unload-truck",0,((0,3), (0,5), (0,2), (0,2))).
action_possible("unload-truck",0,((0,3), (0,4), (0,2), (0,6))).
action_possible("walk",0,((0,7), (0,0), (0,1))).
action_possible("unload-truck",0,((0,3), (0,5), (0,1), (0,6))).
action_possible("load-truck",0,((0,3), (0,5), (0,2), (0,6))).
action_possible("drive-truck",0,((0,1), (0,6), (0,2), (0,4))).
action_possible("walk",0,((0,7), (0,0), (0,2))).
action_possible("unload-truck",0,((0,3), (0,4), (0,2), (0,7))).
action_possible("disembark-truck",0,((0,6), (0,2), (0,4))).
action_possible("board-truck",0,((0,6), (0,4), (0,1))).
action_possible("unload-truck",0,((0,3), (0,5), (0,1), (0,1))).
action_possible("unload-truck",0,((0,3), (0,4), (0,2), (0,2))).
action_possible("load-truck",0,((0,3), (0,5), (0,2), (0,7))).
action_possible("load-truck",0,((0,3), (0,4), (0,2), (0,6))).
action_possible("drive-truck",0,((0,1), (0,6), (0,2), (0,5))).
action_possible("board-truck",0,((0,6), (0,4), (0,2))).
action_possible("walk",0,((0,7), (0,1), (0,0))).
action_possible("unload-truck",0,((0,3), (0,4), (0,1), (0,6))).
action_possible("load-truck",0,((0,3), (0,5), (0,1), (0,6))).
action_possible("load-truck",0,((0,3), (0,5), (0,2), (0,2))).
action_possible("disembark-truck",0,((0,6), (0,2), (0,5))).
action_possible("load-truck",0,((0,3), (0,4), (0,2), (0,7))).
action_possible("drive-truck",0,((0,2), (0,6), (0,1), (0,4))).
action_possible("disembark-truck",0,((0,7), (0,2), (0,4))).
action_possible("unload-truck",0,((0,3), (0,4), (0,1), (0,1))).
action_possible("load-truck",0,((0,3), (0,5), (0,1), (0,1))).
action_possible("board-truck",0,((0,7), (0,5), (0,2))).
action_possible("load-truck",0,((0,3), (0,4), (0,2), (0,2))).
action_possible("disembark-truck",0,((0,6), (0,1), (0,4))).
action_possible("drive-truck",0,((0,1), (0,7), (0,2), (0,5))).
action_possible("drive-truck",0,((0,2), (0,6), (0,1), (0,5))).
action_possible("unload-truck",0,((0,3), (0,5), (0,1), (0,7))).
action_possible("drive-truck",0,((0,2), (0,7), (0,1), (0,4))).
action_possible("walk",0,((0,6), (0,0), (0,1))).
action_possible("load-truck",0,((0,3), (0,4), (0,1), (0,6))).
action_possible("board-truck",0,((0,7), (0,4), (0,1))).
action_possible("disembark-truck",0,((0,6), (0,1), (0,5))).
action_possible("load-truck",0,((0,3), (0,4), (0,1), (0,1))).
action_possible("board-truck",0,((0,7), (0,4), (0,2))).
action_possible("unload-truck",0,((0,3), (0,4), (0,1), (0,7))).
action_possible("walk",0,((0,6), (0,0), (0,2))).
action_possible("load-truck",0,((0,3), (0,5), (0,1), (0,7))).
action_possible("disembark-truck",0,((0,7), (0,1), (0,4))).
action_possible("disembark-truck",0,((0,7), (0,2), (0,5))).
action_possible("walk",0,((0,6), (0,2), (0,0))).
action_possible("unload-truck",0,((0,3), (0,5), (0,2), (0,6))).
action_possible("board-truck",1,((1,6), (1,5), (1,1))).
action_possible("disembark-truck",1,((1,7), (1,1), (1,5))).
action_possible("walk",1,((1,7), (1,2), (1,0))).
action_possible("drive-truck",1,((1,2), (1,7), (1,1), (1,5))).
action_possible("load-truck",1,((1,3), (1,4), (1,1), (1,7))).
action_possible("board-truck",1,((1,6), (1,5), (1,2))).
action_possible("unload-truck",1,((1,3), (1,5), (1,2), (1,7))).
action_possible("drive-truck",1,((1,1), (1,7), (1,2), (1,4))).
action_possible("board-truck",1,((1,7), (1,5), (1,1))).
action_possible("walk",1,((1,6), (1,1), (1,0))).
action_possible("walk",1,((1,7), (1,0), (1,1))).
action_possible("unload-truck",1,((1,3), (1,5), (1,2), (1,2))).
action_possible("unload-truck",1,((1,3), (1,4), (1,2), (1,6))).
action_possible("unload-truck",1,((1,3), (1,5), (1,1), (1,6))).
action_possible("load-truck",1,((1,3), (1,5), (1,2), (1,6))).
action_possible("drive-truck",1,((1,1), (1,6), (1,2), (1,4))).
action_possible("walk",1,((1,7), (1,0), (1,2))).
action_possible("unload-truck",1,((1,3), (1,4), (1,2), (1,7))).
action_possible("disembark-truck",1,((1,6), (1,2), (1,4))).
action_possible("unload-truck",1,((1,3), (1,5), (1,1), (1,1))).
action_possible("board-truck",1,((1,6), (1,4), (1,1))).
action_possible("unload-truck",1,((1,3), (1,4), (1,2), (1,2))).
action_possible("load-truck",1,((1,3), (1,5), (1,2), (1,7))).
action_possible("load-truck",1,((1,3), (1,4), (1,2), (1,6))).
action_possible("drive-truck",1,((1,1), (1,6), (1,2), (1,5))).
action_possible("board-truck",1,((1,6), (1,4), (1,2))).
action_possible("walk",1,((1,7), (1,1), (1,0))).
action_possible("unload-truck",1,((1,3), (1,4), (1,1), (1,6))).
action_possible("load-truck",1,((1,3), (1,5), (1,1), (1,6))).
action_possible("load-truck",1,((1,3), (1,5), (1,2), (1,2))).
action_possible("disembark-truck",1,((1,6), (1,2), (1,5))).
action_possible("load-truck",1,((1,3), (1,4), (1,2), (1,7))).
action_possible("drive-truck",1,((1,2), (1,6), (1,1), (1,4))).
action_possible("disembark-truck",1,((1,7), (1,2), (1,4))).
action_possible("load-truck",1,((1,3), (1,5), (1,1), (1,1))).
action_possible("unload-truck",1,((1,3), (1,4), (1,1), (1,1))).
action_possible("board-truck",1,((1,7), (1,5), (1,2))).
action_possible("disembark-truck",1,((1,6), (1,1), (1,4))).
action_possible("load-truck",1,((1,3), (1,4), (1,2), (1,2))).
action_possible("unload-truck",1,((1,3), (1,5), (1,1), (1,7))).
action_possible("drive-truck",1,((1,1), (1,7), (1,2), (1,5))).
action_possible("drive-truck",1,((1,2), (1,6), (1,1), (1,5))).
action_possible("drive-truck",1,((1,2), (1,7), (1,1), (1,4))).
action_possible("walk",1,((1,6), (1,0), (1,1))).
action_possible("load-truck",1,((1,3), (1,4), (1,1), (1,6))).
action_possible("board-truck",1,((1,7), (1,4), (1,1))).
action_possible("disembark-truck",1,((1,6), (1,1), (1,5))).
action_possible("load-truck",1,((1,3), (1,4), (1,1), (1,1))).
action_possible("board-truck",1,((1,7), (1,4), (1,2))).
action_possible("unload-truck",1,((1,3), (1,4), (1,1), (1,7))).
action_possible("walk",1,((1,6), (1,0), (1,2))).
action_possible("load-truck",1,((1,3), (1,5), (1,1), (1,7))).
action_possible("disembark-truck",1,((1,7), (1,1), (1,4))).
action_possible("disembark-truck",1,((1,7), (1,2), (1,5))).
action_possible("walk",1,((1,6), (1,2), (1,0))).
action_possible("unload-truck",1,((1,3), (1,5), (1,2), (1,6))).
action_possible("board-truck",2,((2,8), (2,7), (2,4))).
action_possible("load-truck",2,((2,5), (2,7), (2,2), (2,8))).
action_possible("walk",2,((2,8), (2,1), (2,4))).
action_possible("drive-truck",2,((2,4), (2,8), (2,3), (2,7))).
action_possible("walk",2,((2,8), (2,0), (2,2))).
action_possible("unload-truck",2,((2,5), (2,7), (2,4), (2,4))).
action_possible("walk",2,((2,8), (2,0), (2,3))).
action_possible("unload-truck",2,((2,5), (2,7), (2,3), (2,8))).
action_possible("load-truck",2,((2,5), (2,7), (2,4), (2,8))).
action_possible("drive-truck",2,((2,3), (2,8), (2,2), (2,7))).
action_possible("unload-truck",2,((2,6), (2,7), (2,4), (2,8))).
action_possible("unload-truck",2,((2,5), (2,7), (2,3), (2,3))).
action_possible("unload-truck",2,((2,6), (2,7), (2,3), (2,8))).
action_possible("disembark-truck",2,((2,8), (2,4), (2,7))).
action_possible("drive-truck",2,((2,4), (2,8), (2,2), (2,7))).
action_possible("unload-truck",2,((2,6), (2,7), (2,3), (2,3))).
action_possible("drive-truck",2,((2,2), (2,8), (2,4), (2,7))).
action_possible("load-truck",2,((2,5), (2,7), (2,3), (2,8))).
action_possible("unload-truck",2,((2,5), (2,7), (2,2), (2,2))).
action_possible("load-truck",2,((2,5), (2,7), (2,4), (2,4))).
action_possible("unload-truck",2,((2,6), (2,7), (2,4), (2,4))).
action_possible("drive-truck",2,((2,2), (2,8), (2,3), (2,7))).
action_possible("load-truck",2,((2,6), (2,7), (2,4), (2,8))).
action_possible("unload-truck",2,((2,6), (2,7), (2,2), (2,2))).
action_possible("load-truck",2,((2,5), (2,7), (2,3), (2,3))).
action_possible("load-truck",2,((2,6), (2,7), (2,3), (2,8))).
action_possible("unload-truck",2,((2,6), (2,7), (2,2), (2,8))).
action_possible("load-truck",2,((2,6), (2,7), (2,3), (2,3))).
action_possible("drive-truck",2,((2,3), (2,8), (2,4), (2,7))).
action_possible("walk",2,((2,8), (2,3), (2,0))).
action_possible("load-truck",2,((2,5), (2,7), (2,2), (2,2))).
action_possible("walk",2,((2,8), (2,4), (2,1))).
action_possible("load-truck",2,((2,6), (2,7), (2,4), (2,4))).
action_possible("board-truck",2,((2,8), (2,7), (2,2))).
action_possible("walk",2,((2,8), (2,3), (2,1))).
action_possible("disembark-truck",2,((2,8), (2,3), (2,7))).
action_possible("load-truck",2,((2,6), (2,7), (2,2), (2,2))).
action_possible("load-truck",2,((2,6), (2,7), (2,2), (2,8))).
action_possible("unload-truck",2,((2,5), (2,7), (2,2), (2,8))).
action_possible("walk",2,((2,8), (2,2), (2,0))).
action_possible("board-truck",2,((2,8), (2,7), (2,3))).
action_possible("walk",2,((2,8), (2,1), (2,3))).
action_possible("unload-truck",2,((2,5), (2,7), (2,4), (2,8))).
action_possible("disembark-truck",2,((2,8), (2,2), (2,7))).
action_possible("board-truck",3,((3,8), (3,7), (3,4))).
action_possible("load-truck",3,((3,5), (3,7), (3,2), (3,8))).
action_possible("walk",3,((3,8), (3,1), (3,4))).
action_possible("drive-truck",3,((3,4), (3,8), (3,3), (3,7))).
action_possible("walk",3,((3,8), (3,0), (3,2))).
action_possible("unload-truck",3,((3,5), (3,7), (3,4), (3,4))).
action_possible("walk",3,((3,8), (3,0), (3,3))).
action_possible("unload-truck",3,((3,5), (3,7), (3,3), (3,8))).
action_possible("load-truck",3,((3,5), (3,7), (3,4), (3,8))).
action_possible("drive-truck",3,((3,3), (3,8), (3,2), (3,7))).
action_possible("unload-truck",3,((3,6), (3,7), (3,4), (3,8))).
action_possible("unload-truck",3,((3,5), (3,7), (3,3), (3,3))).
action_possible("unload-truck",3,((3,6), (3,7), (3,3), (3,8))).
action_possible("disembark-truck",3,((3,8), (3,4), (3,7))).
action_possible("drive-truck",3,((3,4), (3,8), (3,2), (3,7))).
action_possible("unload-truck",3,((3,6), (3,7), (3,3), (3,3))).
action_possible("drive-truck",3,((3,2), (3,8), (3,4), (3,7))).
action_possible("load-truck",3,((3,5), (3,7), (3,3), (3,8))).
action_possible("unload-truck",3,((3,5), (3,7), (3,2), (3,2))).
action_possible("load-truck",3,((3,5), (3,7), (3,4), (3,4))).
action_possible("unload-truck",3,((3,6), (3,7), (3,4), (3,4))).
action_possible("drive-truck",3,((3,2), (3,8), (3,3), (3,7))).
action_possible("load-truck",3,((3,6), (3,7), (3,4), (3,8))).
action_possible("unload-truck",3,((3,6), (3,7), (3,2), (3,2))).
action_possible("load-truck",3,((3,5), (3,7), (3,3), (3,3))).
action_possible("load-truck",3,((3,6), (3,7), (3,3), (3,8))).
action_possible("unload-truck",3,((3,6), (3,7), (3,2), (3,8))).
action_possible("load-truck",3,((3,6), (3,7), (3,3), (3,3))).
action_possible("drive-truck",3,((3,3), (3,8), (3,4), (3,7))).
action_possible("walk",3,((3,8), (3,3), (3,0))).
action_possible("load-truck",3,((3,5), (3,7), (3,2), (3,2))).
action_possible("walk",3,((3,8), (3,4), (3,1))).
action_possible("load-truck",3,((3,6), (3,7), (3,4), (3,4))).
action_possible("board-truck",3,((3,8), (3,7), (3,2))).
action_possible("walk",3,((3,8), (3,3), (3,1))).
action_possible("disembark-truck",3,((3,8), (3,3), (3,7))).
action_possible("load-truck",3,((3,6), (3,7), (3,2), (3,2))).
action_possible("load-truck",3,((3,6), (3,7), (3,2), (3,8))).
action_possible("unload-truck",3,((3,5), (3,7), (3,2), (3,8))).
action_possible("walk",3,((3,8), (3,2), (3,0))).
action_possible("board-truck",3,((3,8), (3,7), (3,3))).
action_possible("walk",3,((3,8), (3,1), (3,3))).
action_possible("unload-truck",3,((3,5), (3,7), (3,4), (3,8))).
action_possible("disembark-truck",3,((3,8), (3,2), (3,7))).
action_possible("board-truck",4,((4,8), (4,7), (4,4))).
action_possible("drive-truck",4,((4,2), (4,8), (4,4), (4,6))).
action_possible("load-truck",4,((4,5), (4,7), (4,2), (4,8))).
action_possible("load-truck",4,((4,5), (4,6), (4,2), (4,2))).
action_possible("walk",4,((4,8), (4,1), (4,4))).
action_possible("drive-truck",4,((4,4), (4,8), (4,3), (4,7))).
action_possible("load-truck",4,((4,5), (4,6), (4,2), (4,8))).
action_possible("unload-truck",4,((4,5), (4,6), (4,4), (4,8))).
action_possible("drive-truck",4,((4,3), (4,8), (4,2), (4,6))).
action_possible("walk",4,((4,8), (4,0), (4,2))).
action_possible("unload-truck",4,((4,5), (4,7), (4,4), (4,4))).
action_possible("walk",4,((4,8), (4,0), (4,3))).
action_possible("drive-truck",4,((4,4), (4,8), (4,2), (4,6))).
action_possible("unload-truck",4,((4,5), (4,7), (4,3), (4,8))).
action_possible("load-truck",4,((4,5), (4,7), (4,4), (4,8))).
action_possible("board-truck",4,((4,8), (4,6), (4,3))).
action_possible("disembark-truck",4,((4,8), (4,4), (4,6))).
action_possible("drive-truck",4,((4,3), (4,8), (4,2), (4,7))).
action_possible("unload-truck",4,((4,5), (4,7), (4,3), (4,3))).
action_possible("unload-truck",4,((4,5), (4,6), (4,4), (4,4))).
action_possible("disembark-truck",4,((4,8), (4,4), (4,7))).
action_possible("drive-truck",4,((4,4), (4,8), (4,2), (4,7))).
action_possible("load-truck",4,((4,5), (4,6), (4,4), (4,8))).
action_possible("board-truck",4,((4,8), (4,6), (4,4))).
action_possible("drive-truck",4,((4,2), (4,8), (4,3), (4,6))).
action_possible("drive-truck",4,((4,2), (4,8), (4,4), (4,7))).
action_possible("load-truck",4,((4,5), (4,7), (4,3), (4,8))).
action_possible("load-truck",4,((4,5), (4,7), (4,4), (4,4))).
action_possible("drive-truck",4,((4,3), (4,8), (4,4), (4,6))).
action_possible("unload-truck",4,((4,5), (4,7), (4,2), (4,2))).
action_possible("drive-truck",4,((4,2), (4,8), (4,3), (4,7))).
action_possible("unload-truck",4,((4,5), (4,6), (4,3), (4,3))).
action_possible("load-truck",4,((4,5), (4,7), (4,3), (4,3))).
action_possible("disembark-truck",4,((4,8), (4,3), (4,6))).
action_possible("load-truck",4,((4,5), (4,6), (4,4), (4,4))).
action_possible("drive-truck",4,((4,4), (4,8), (4,3), (4,6))).
action_possible("drive-truck",4,((4,3), (4,8), (4,4), (4,7))).
action_possible("walk",4,((4,8), (4,3), (4,0))).
action_possible("load-truck",4,((4,5), (4,7), (4,2), (4,2))).
action_possible("walk",4,((4,8), (4,4), (4,1))).
action_possible("board-truck",4,((4,8), (4,7), (4,2))).
action_possible("load-truck",4,((4,5), (4,6), (4,3), (4,3))).
action_possible("walk",4,((4,8), (4,3), (4,1))).
action_possible("disembark-truck",4,((4,8), (4,3), (4,7))).
action_possible("unload-truck",4,((4,5), (4,6), (4,2), (4,2))).
action_possible("unload-truck",4,((4,5), (4,6), (4,3), (4,8))).
action_possible("unload-truck",4,((4,5), (4,7), (4,2), (4,8))).
action_possible("unload-truck",4,((4,5), (4,6), (4,2), (4,8))).
action_possible("board-truck",4,((4,8), (4,6), (4,2))).
action_possible("disembark-truck",4,((4,8), (4,2), (4,6))).
action_possible("walk",4,((4,8), (4,2), (4,0))).
action_possible("board-truck",4,((4,8), (4,7), (4,3))).
action_possible("walk",4,((4,8), (4,1), (4,3))).
action_possible("unload-truck",4,((4,5), (4,7), (4,4), (4,8))).
action_possible("load-truck",4,((4,5), (4,6), (4,3), (4,8))).
action_possible("disembark-truck",4,((4,8), (4,2), (4,7))).
action_possible("drive-truck",5,((5,2), (5,8), (5,4), (5,6))).
action_possible("load-truck",5,((5,5), (5,6), (5,2), (5,2))).
action_possible("board-truck",5,((5,8), (5,7), (5,4))).
action_possible("load-truck",5,((5,5), (5,7), (5,2), (5,8))).
action_possible("walk",5,((5,8), (5,1), (5,4))).
action_possible("drive-truck",5,((5,4), (5,8), (5,3), (5,7))).
action_possible("load-truck",5,((5,5), (5,6), (5,2), (5,8))).
action_possible("unload-truck",5,((5,5), (5,6), (5,4), (5,8))).
action_possible("drive-truck",5,((5,3), (5,8), (5,2), (5,6))).
action_possible("walk",5,((5,8), (5,0), (5,2))).
action_possible("unload-truck",5,((5,5), (5,7), (5,4), (5,4))).
action_possible("walk",5,((5,8), (5,0), (5,3))).
action_possible("drive-truck",5,((5,4), (5,8), (5,2), (5,6))).
action_possible("unload-truck",5,((5,5), (5,7), (5,3), (5,8))).
action_possible("board-truck",5,((5,8), (5,6), (5,3))).
action_possible("load-truck",5,((5,5), (5,7), (5,4), (5,8))).
action_possible("disembark-truck",5,((5,8), (5,4), (5,6))).
action_possible("drive-truck",5,((5,3), (5,8), (5,2), (5,7))).
action_possible("unload-truck",5,((5,5), (5,7), (5,3), (5,3))).
action_possible("unload-truck",5,((5,5), (5,6), (5,4), (5,4))).
action_possible("disembark-truck",5,((5,8), (5,4), (5,7))).
action_possible("drive-truck",5,((5,4), (5,8), (5,2), (5,7))).
action_possible("load-truck",5,((5,5), (5,6), (5,4), (5,8))).
action_possible("drive-truck",5,((5,2), (5,8), (5,3), (5,6))).
action_possible("board-truck",5,((5,8), (5,6), (5,4))).
action_possible("drive-truck",5,((5,2), (5,8), (5,4), (5,7))).
action_possible("load-truck",5,((5,5), (5,7), (5,3), (5,8))).
action_possible("load-truck",5,((5,5), (5,7), (5,4), (5,4))).
action_possible("drive-truck",5,((5,3), (5,8), (5,4), (5,6))).
action_possible("unload-truck",5,((5,5), (5,7), (5,2), (5,2))).
action_possible("drive-truck",5,((5,2), (5,8), (5,3), (5,7))).
action_possible("unload-truck",5,((5,5), (5,6), (5,3), (5,3))).
action_possible("load-truck",5,((5,5), (5,7), (5,3), (5,3))).
action_possible("disembark-truck",5,((5,8), (5,3), (5,6))).
action_possible("load-truck",5,((5,5), (5,6), (5,4), (5,4))).
action_possible("drive-truck",5,((5,4), (5,8), (5,3), (5,6))).
action_possible("drive-truck",5,((5,3), (5,8), (5,4), (5,7))).
action_possible("walk",5,((5,8), (5,3), (5,0))).
action_possible("load-truck",5,((5,5), (5,7), (5,2), (5,2))).
action_possible("walk",5,((5,8), (5,4), (5,1))).
action_possible("load-truck",5,((5,5), (5,6), (5,3), (5,3))).
action_possible("board-truck",5,((5,8), (5,7), (5,2))).
action_possible("unload-truck",5,((5,5), (5,6), (5,2), (5,2))).
action_possible("walk",5,((5,8), (5,3), (5,1))).
action_possible("disembark-truck",5,((5,8), (5,3), (5,7))).
action_possible("unload-truck",5,((5,5), (5,6), (5,3), (5,8))).
action_possible("unload-truck",5,((5,5), (5,7), (5,2), (5,8))).
action_possible("unload-truck",5,((5,5), (5,6), (5,2), (5,8))).
action_possible("board-truck",5,((5,8), (5,6), (5,2))).
action_possible("disembark-truck",5,((5,8), (5,2), (5,6))).
action_possible("walk",5,((5,8), (5,2), (5,0))).
action_possible("board-truck",5,((5,8), (5,7), (5,3))).
action_possible("walk",5,((5,8), (5,1), (5,3))).
action_possible("unload-truck",5,((5,5), (5,7), (5,4), (5,8))).
action_possible("load-truck",5,((5,5), (5,6), (5,3), (5,8))).
action_possible("disembark-truck",5,((5,8), (5,2), (5,7))).
