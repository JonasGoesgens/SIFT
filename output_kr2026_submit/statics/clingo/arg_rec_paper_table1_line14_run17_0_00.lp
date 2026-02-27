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
objects((0,7)).
obj_type(0,(0,7)).
objects((0,1)).
obj_type(0,(0,1)).
objects((0,4)).
obj_type(1,(0,4)).
objects((0,3)).
obj_type(5,(0,3)).
objects((0,2)).
obj_type(0,(0,2)).
objects((0,5)).
obj_type(1,(0,5)).
objects((0,6)).
obj_type(0,(0,6)).
objects((0,0)).
obj_type(0,(0,0)).
objects((1,7)).
obj_type(0,(1,7)).
objects((1,1)).
obj_type(0,(1,1)).
objects((1,4)).
obj_type(1,(1,4)).
objects((1,3)).
obj_type(5,(1,3)).
objects((1,2)).
obj_type(0,(1,2)).
objects((1,5)).
obj_type(1,(1,5)).
objects((1,6)).
obj_type(0,(1,6)).
objects((1,0)).
obj_type(0,(1,0)).
objects((2,7)).
obj_type(0,(2,7)).
objects((2,1)).
obj_type(0,(2,1)).
objects((2,4)).
obj_type(1,(2,4)).
objects((2,3)).
obj_type(5,(2,3)).
objects((2,2)).
obj_type(0,(2,2)).
objects((2,5)).
obj_type(1,(2,5)).
objects((2,6)).
obj_type(0,(2,6)).
objects((2,0)).
obj_type(0,(2,0)).
objects((3,7)).
obj_type(0,(3,7)).
objects((3,1)).
obj_type(0,(3,1)).
objects((3,4)).
obj_type(1,(3,4)).
objects((3,3)).
obj_type(5,(3,3)).
objects((3,2)).
obj_type(0,(3,2)).
objects((3,5)).
obj_type(1,(3,5)).
objects((3,6)).
obj_type(0,(3,6)).
objects((3,0)).
obj_type(0,(3,0)).
objects((4,7)).
obj_type(0,(4,7)).
objects((4,1)).
obj_type(0,(4,1)).
objects((4,4)).
obj_type(1,(4,4)).
objects((4,3)).
obj_type(5,(4,3)).
objects((4,2)).
obj_type(0,(4,2)).
objects((4,5)).
obj_type(1,(4,5)).
objects((4,6)).
obj_type(0,(4,6)).
objects((4,0)).
obj_type(0,(4,0)).
objects((5,7)).
obj_type(0,(5,7)).
objects((5,1)).
obj_type(0,(5,1)).
objects((5,4)).
obj_type(1,(5,4)).
objects((5,3)).
obj_type(5,(5,3)).
objects((5,2)).
obj_type(0,(5,2)).
objects((5,5)).
obj_type(1,(5,5)).
objects((5,6)).
obj_type(0,(5,6)).
objects((5,0)).
obj_type(0,(5,0)).
objects((6,6)).
obj_type(5,(6,6)).
objects((6,7)).
obj_type(1,(6,7)).
objects((6,3)).
obj_type(0,(6,3)).
objects((6,5)).
obj_type(5,(6,5)).
objects((6,4)).
obj_type(0,(6,4)).
objects((6,8)).
obj_type(0,(6,8)).
objects((6,2)).
obj_type(0,(6,2)).
objects((6,0)).
obj_type(0,(6,0)).
objects((6,1)).
obj_type(0,(6,1)).
objects((7,6)).
obj_type(5,(7,6)).
objects((7,7)).
obj_type(1,(7,7)).
objects((7,3)).
obj_type(0,(7,3)).
objects((7,8)).
obj_type(0,(7,8)).
objects((7,2)).
obj_type(0,(7,2)).
objects((7,5)).
obj_type(5,(7,5)).
objects((7,4)).
obj_type(0,(7,4)).
objects((7,0)).
obj_type(0,(7,0)).
objects((7,1)).
obj_type(0,(7,1)).
objects((8,6)).
obj_type(5,(8,6)).
objects((8,7)).
obj_type(1,(8,7)).
objects((8,3)).
obj_type(0,(8,3)).
objects((8,8)).
obj_type(0,(8,8)).
objects((8,2)).
obj_type(0,(8,2)).
objects((8,5)).
obj_type(5,(8,5)).
objects((8,4)).
obj_type(0,(8,4)).
objects((8,0)).
obj_type(0,(8,0)).
objects((8,1)).
obj_type(0,(8,1)).
objects((9,6)).
obj_type(5,(9,6)).
objects((9,7)).
obj_type(1,(9,7)).
objects((9,3)).
obj_type(0,(9,3)).
objects((9,8)).
obj_type(0,(9,8)).
objects((9,2)).
obj_type(0,(9,2)).
objects((9,5)).
obj_type(5,(9,5)).
objects((9,4)).
obj_type(0,(9,4)).
objects((9,0)).
obj_type(0,(9,0)).
objects((9,1)).
obj_type(0,(9,1)).
objects((10,6)).
obj_type(5,(10,6)).
objects((10,7)).
obj_type(1,(10,7)).
objects((10,3)).
obj_type(0,(10,3)).
objects((10,5)).
obj_type(5,(10,5)).
objects((10,4)).
obj_type(0,(10,4)).
objects((10,8)).
obj_type(0,(10,8)).
objects((10,2)).
obj_type(0,(10,2)).
objects((10,0)).
obj_type(0,(10,0)).
objects((10,1)).
obj_type(0,(10,1)).
objects((11,6)).
obj_type(5,(11,6)).
objects((11,7)).
obj_type(1,(11,7)).
objects((11,3)).
obj_type(0,(11,3)).
objects((11,8)).
obj_type(0,(11,8)).
objects((11,2)).
obj_type(0,(11,2)).
objects((11,5)).
obj_type(5,(11,5)).
objects((11,4)).
obj_type(0,(11,4)).
objects((11,0)).
obj_type(0,(11,0)).
objects((11,1)).
obj_type(0,(11,1)).
objects((12,5)).
obj_type(5,(12,5)).
objects((12,6)).
obj_type(1,(12,6)).
objects((12,4)).
obj_type(0,(12,4)).
objects((12,7)).
obj_type(1,(12,7)).
objects((12,3)).
obj_type(0,(12,3)).
objects((12,8)).
obj_type(0,(12,8)).
objects((12,2)).
obj_type(0,(12,2)).
objects((12,0)).
obj_type(0,(12,0)).
objects((12,1)).
obj_type(0,(12,1)).
objects((13,5)).
obj_type(5,(13,5)).
objects((13,6)).
obj_type(1,(13,6)).
objects((13,4)).
obj_type(0,(13,4)).
objects((13,3)).
obj_type(0,(13,3)).
objects((13,8)).
obj_type(0,(13,8)).
objects((13,2)).
obj_type(0,(13,2)).
objects((13,7)).
obj_type(1,(13,7)).
objects((13,0)).
obj_type(0,(13,0)).
objects((13,1)).
obj_type(0,(13,1)).
objects((14,5)).
obj_type(5,(14,5)).
objects((14,6)).
obj_type(1,(14,6)).
objects((14,4)).
obj_type(0,(14,4)).
objects((14,7)).
obj_type(1,(14,7)).
objects((14,3)).
obj_type(0,(14,3)).
objects((14,8)).
obj_type(0,(14,8)).
objects((14,2)).
obj_type(0,(14,2)).
objects((14,0)).
obj_type(0,(14,0)).
objects((14,1)).
obj_type(0,(14,1)).
objects((15,5)).
obj_type(5,(15,5)).
objects((15,6)).
obj_type(1,(15,6)).
objects((15,4)).
obj_type(0,(15,4)).
objects((15,3)).
obj_type(0,(15,3)).
objects((15,8)).
obj_type(0,(15,8)).
objects((15,2)).
obj_type(0,(15,2)).
objects((15,7)).
obj_type(1,(15,7)).
objects((15,0)).
obj_type(0,(15,0)).
objects((15,1)).
obj_type(0,(15,1)).
objects((16,5)).
obj_type(5,(16,5)).
objects((16,6)).
obj_type(1,(16,6)).
objects((16,4)).
obj_type(0,(16,4)).
objects((16,3)).
obj_type(0,(16,3)).
objects((16,8)).
obj_type(0,(16,8)).
objects((16,2)).
obj_type(0,(16,2)).
objects((16,7)).
obj_type(1,(16,7)).
objects((16,0)).
obj_type(0,(16,0)).
objects((16,1)).
obj_type(0,(16,1)).
objects((17,5)).
obj_type(5,(17,5)).
objects((17,6)).
obj_type(1,(17,6)).
objects((17,4)).
obj_type(0,(17,4)).
objects((17,3)).
obj_type(0,(17,3)).
objects((17,8)).
obj_type(0,(17,8)).
objects((17,2)).
obj_type(0,(17,2)).
objects((17,7)).
obj_type(1,(17,7)).
objects((17,0)).
obj_type(0,(17,0)).
objects((17,1)).
obj_type(0,(17,1)).
types(0).
types(1).
types(5).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
instance(6).
instance(7).
instance(8).
instance(9).
instance(10).
instance(11).
instance(12).
instance(13).
instance(14).
instance(15).
instance(16).
instance(17).
action_arity("board-truck",3).
action_type_list("board-truck",(Type0, Type1, Type2)) :- action_arg_type(Type0,("board-truck",0)), action_arg_type(Type1,("board-truck",1)), action_arg_type(Type2,("board-truck",2)).
action_candidate("board-truck",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("board-truck",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("walk",3).
action_type_list("walk",(Type0, Type1, Type2)) :- action_arg_type(Type0,("walk",0)), action_arg_type(Type1,("walk",1)), action_arg_type(Type2,("walk",2)).
action_candidate("walk",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("walk",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("drive-truck",4).
action_type_list("drive-truck",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("drive-truck",0)), action_arg_type(Type1,("drive-truck",1)), action_arg_type(Type2,("drive-truck",2)), action_arg_type(Type3,("drive-truck",3)).
action_candidate("drive-truck",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("drive-truck",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arity("disembark-truck",3).
action_type_list("disembark-truck",(Type0, Type1, Type2)) :- action_arg_type(Type0,("disembark-truck",0)), action_arg_type(Type1,("disembark-truck",1)), action_arg_type(Type2,("disembark-truck",2)).
action_candidate("disembark-truck",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("disembark-truck",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("unload-truck",4).
action_type_list("unload-truck",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("unload-truck",0)), action_arg_type(Type1,("unload-truck",1)), action_arg_type(Type2,("unload-truck",2)), action_arg_type(Type3,("unload-truck",3)).
action_candidate("unload-truck",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("unload-truck",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arity("load-truck",4).
action_type_list("load-truck",(Type0, Type1, Type2, Type3)) :- action_arg_type(Type0,("load-truck",0)), action_arg_type(Type1,("load-truck",1)), action_arg_type(Type2,("load-truck",2)), action_arg_type(Type3,("load-truck",3)).
action_candidate("load-truck",Inst,(Obj0, Obj1, Obj2, Obj3)):- instance(Inst),action_type_list("load-truck",(Type0, Type1, Type2, Type3)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_), obj_type(Type3,(Obj3)),Obj3=(Inst,_).
action_arg_type(0,("board-truck",0)).
action_arg_type(1,("board-truck",1)).
action_arg_type(0,("walk",0)).
action_arg_type(0,("walk",1)).
action_arg_type(0,("drive-truck",0)).
action_arg_type(0,("drive-truck",1)).
action_arg_type(0,("disembark-truck",0)).
action_arg_type(5,("unload-truck",0)).
action_arg_type(5,("load-truck",0)).
action_arg_type(1,("load-truck",1)).
action_arg_type(0,("disembark-truck",1)).
action_arg_type(1,("disembark-truck",2)).
action_arg_type(0,("drive-truck",2)).
action_arg_type(1,("drive-truck",3)).
action_arg_type(0,("walk",2)).
action_arg_type(0,("board-truck",2)).
action_arg_type(1,("unload-truck",1)).
action_arg_type(0,("unload-truck",2)).
action_arg_type(0,("unload-truck",3)).
action_arg_type(0,("load-truck",2)).
action_arg_type(0,("load-truck",3)).
action_possible("disembark-truck",0,((0,7), (0,1), (0,4))).
action_possible("unload-truck",0,((0,3), (0,4), (0,2), (0,2))).
action_possible("disembark-truck",0,((0,7), (0,2), (0,5))).
action_possible("load-truck",0,((0,3), (0,5), (0,2), (0,2))).
action_possible("board-truck",0,((0,7), (0,4), (0,1))).
action_possible("drive-truck",0,((0,1), (0,7), (0,2), (0,4))).
action_possible("disembark-truck",0,((0,7), (0,1), (0,5))).
action_possible("unload-truck",0,((0,3), (0,5), (0,7), (0,1))).
action_possible("drive-truck",0,((0,1), (0,6), (0,2), (0,4))).
action_possible("unload-truck",0,((0,3), (0,4), (0,1), (0,1))).
action_possible("board-truck",0,((0,7), (0,4), (0,2))).
action_possible("walk",0,((0,6), (0,0), (0,1))).
action_possible("load-truck",0,((0,3), (0,5), (0,1), (0,1))).
action_possible("load-truck",0,((0,3), (0,4), (0,2), (0,2))).
action_possible("walk",0,((0,6), (0,0), (0,2))).
action_possible("unload-truck",0,((0,3), (0,5), (0,7), (0,2))).
action_possible("board-truck",0,((0,6), (0,5), (0,1))).
action_possible("drive-truck",0,((0,1), (0,6), (0,2), (0,5))).
action_possible("unload-truck",0,((0,3), (0,4), (0,7), (0,1))).
action_possible("walk",0,((0,6), (0,2), (0,0))).
action_possible("load-truck",0,((0,3), (0,5), (0,7), (0,1))).
action_possible("load-truck",0,((0,3), (0,4), (0,1), (0,1))).
action_possible("drive-truck",0,((0,2), (0,6), (0,1), (0,4))).
action_possible("unload-truck",0,((0,3), (0,5), (0,6), (0,1))).
action_possible("unload-truck",0,((0,3), (0,4), (0,7), (0,2))).
action_possible("disembark-truck",0,((0,6), (0,2), (0,4))).
action_possible("board-truck",0,((0,6), (0,5), (0,2))).
action_possible("board-truck",0,((0,7), (0,5), (0,1))).
action_possible("load-truck",0,((0,3), (0,5), (0,7), (0,2))).
action_possible("drive-truck",0,((0,1), (0,7), (0,2), (0,5))).
action_possible("walk",0,((0,7), (0,2), (0,0))).
action_possible("unload-truck",0,((0,3), (0,5), (0,6), (0,2))).
action_possible("drive-truck",0,((0,2), (0,6), (0,1), (0,5))).
action_possible("load-truck",0,((0,3), (0,4), (0,7), (0,1))).
action_possible("disembark-truck",0,((0,6), (0,2), (0,5))).
action_possible("drive-truck",0,((0,2), (0,7), (0,1), (0,4))).
action_possible("unload-truck",0,((0,3), (0,4), (0,6), (0,1))).
action_possible("board-truck",0,((0,6), (0,4), (0,1))).
action_possible("walk",0,((0,6), (0,1), (0,0))).
action_possible("disembark-truck",0,((0,7), (0,2), (0,4))).
action_possible("walk",0,((0,7), (0,0), (0,1))).
action_possible("load-truck",0,((0,3), (0,5), (0,6), (0,1))).
action_possible("load-truck",0,((0,3), (0,4), (0,7), (0,2))).
action_possible("unload-truck",0,((0,3), (0,4), (0,6), (0,2))).
action_possible("disembark-truck",0,((0,6), (0,1), (0,4))).
action_possible("board-truck",0,((0,6), (0,4), (0,2))).
action_possible("walk",0,((0,7), (0,0), (0,2))).
action_possible("load-truck",0,((0,3), (0,5), (0,6), (0,2))).
action_possible("load-truck",0,((0,3), (0,4), (0,6), (0,1))).
action_possible("unload-truck",0,((0,3), (0,5), (0,2), (0,2))).
action_possible("disembark-truck",0,((0,6), (0,1), (0,5))).
action_possible("walk",0,((0,7), (0,1), (0,0))).
action_possible("board-truck",0,((0,7), (0,5), (0,2))).
action_possible("load-truck",0,((0,3), (0,4), (0,6), (0,2))).
action_possible("drive-truck",0,((0,2), (0,7), (0,1), (0,5))).
action_possible("unload-truck",0,((0,3), (0,5), (0,1), (0,1))).
action_possible("disembark-truck",1,((1,7), (1,1), (1,4))).
action_possible("unload-truck",1,((1,3), (1,4), (1,2), (1,2))).
action_possible("disembark-truck",1,((1,7), (1,2), (1,5))).
action_possible("load-truck",1,((1,3), (1,5), (1,2), (1,2))).
action_possible("board-truck",1,((1,7), (1,4), (1,1))).
action_possible("drive-truck",1,((1,1), (1,7), (1,2), (1,4))).
action_possible("disembark-truck",1,((1,7), (1,1), (1,5))).
action_possible("unload-truck",1,((1,3), (1,5), (1,7), (1,1))).
action_possible("drive-truck",1,((1,1), (1,6), (1,2), (1,4))).
action_possible("unload-truck",1,((1,3), (1,4), (1,1), (1,1))).
action_possible("walk",1,((1,6), (1,0), (1,1))).
action_possible("board-truck",1,((1,7), (1,4), (1,2))).
action_possible("load-truck",1,((1,3), (1,5), (1,1), (1,1))).
action_possible("load-truck",1,((1,3), (1,4), (1,2), (1,2))).
action_possible("walk",1,((1,6), (1,0), (1,2))).
action_possible("unload-truck",1,((1,3), (1,5), (1,7), (1,2))).
action_possible("board-truck",1,((1,6), (1,5), (1,1))).
action_possible("drive-truck",1,((1,1), (1,6), (1,2), (1,5))).
action_possible("unload-truck",1,((1,3), (1,4), (1,7), (1,1))).
action_possible("walk",1,((1,6), (1,2), (1,0))).
action_possible("load-truck",1,((1,3), (1,5), (1,7), (1,1))).
action_possible("load-truck",1,((1,3), (1,4), (1,1), (1,1))).
action_possible("drive-truck",1,((1,2), (1,6), (1,1), (1,4))).
action_possible("unload-truck",1,((1,3), (1,5), (1,6), (1,1))).
action_possible("unload-truck",1,((1,3), (1,4), (1,7), (1,2))).
action_possible("board-truck",1,((1,7), (1,5), (1,1))).
action_possible("disembark-truck",1,((1,6), (1,2), (1,4))).
action_possible("board-truck",1,((1,6), (1,5), (1,2))).
action_possible("load-truck",1,((1,3), (1,5), (1,7), (1,2))).
action_possible("walk",1,((1,7), (1,2), (1,0))).
action_possible("drive-truck",1,((1,2), (1,6), (1,1), (1,5))).
action_possible("unload-truck",1,((1,3), (1,5), (1,6), (1,2))).
action_possible("drive-truck",1,((1,1), (1,7), (1,2), (1,5))).
action_possible("load-truck",1,((1,3), (1,4), (1,7), (1,1))).
action_possible("disembark-truck",1,((1,6), (1,2), (1,5))).
action_possible("drive-truck",1,((1,2), (1,7), (1,1), (1,4))).
action_possible("unload-truck",1,((1,3), (1,4), (1,6), (1,1))).
action_possible("board-truck",1,((1,6), (1,4), (1,1))).
action_possible("walk",1,((1,6), (1,1), (1,0))).
action_possible("walk",1,((1,7), (1,0), (1,1))).
action_possible("disembark-truck",1,((1,7), (1,2), (1,4))).
action_possible("load-truck",1,((1,3), (1,5), (1,6), (1,1))).
action_possible("load-truck",1,((1,3), (1,4), (1,7), (1,2))).
action_possible("unload-truck",1,((1,3), (1,4), (1,6), (1,2))).
action_possible("disembark-truck",1,((1,6), (1,1), (1,4))).
action_possible("board-truck",1,((1,6), (1,4), (1,2))).
action_possible("walk",1,((1,7), (1,0), (1,2))).
action_possible("load-truck",1,((1,3), (1,5), (1,6), (1,2))).
action_possible("load-truck",1,((1,3), (1,4), (1,6), (1,1))).
action_possible("unload-truck",1,((1,3), (1,5), (1,2), (1,2))).
action_possible("disembark-truck",1,((1,6), (1,1), (1,5))).
action_possible("walk",1,((1,7), (1,1), (1,0))).
action_possible("board-truck",1,((1,7), (1,5), (1,2))).
action_possible("load-truck",1,((1,3), (1,4), (1,6), (1,2))).
action_possible("drive-truck",1,((1,2), (1,7), (1,1), (1,5))).
action_possible("unload-truck",1,((1,3), (1,5), (1,1), (1,1))).
action_possible("disembark-truck",2,((2,7), (2,1), (2,4))).
action_possible("unload-truck",2,((2,3), (2,4), (2,2), (2,2))).
action_possible("disembark-truck",2,((2,7), (2,2), (2,5))).
action_possible("load-truck",2,((2,3), (2,5), (2,2), (2,2))).
action_possible("board-truck",2,((2,7), (2,4), (2,1))).
action_possible("drive-truck",2,((2,1), (2,7), (2,2), (2,4))).
action_possible("disembark-truck",2,((2,7), (2,1), (2,5))).
action_possible("unload-truck",2,((2,3), (2,5), (2,7), (2,1))).
action_possible("unload-truck",2,((2,3), (2,4), (2,1), (2,1))).
action_possible("drive-truck",2,((2,1), (2,6), (2,2), (2,4))).
action_possible("walk",2,((2,6), (2,0), (2,1))).
action_possible("board-truck",2,((2,7), (2,4), (2,2))).
action_possible("load-truck",2,((2,3), (2,5), (2,1), (2,1))).
action_possible("load-truck",2,((2,3), (2,4), (2,2), (2,2))).
action_possible("walk",2,((2,6), (2,0), (2,2))).
action_possible("unload-truck",2,((2,3), (2,5), (2,7), (2,2))).
action_possible("board-truck",2,((2,6), (2,5), (2,1))).
action_possible("drive-truck",2,((2,1), (2,6), (2,2), (2,5))).
action_possible("unload-truck",2,((2,3), (2,4), (2,7), (2,1))).
action_possible("walk",2,((2,6), (2,2), (2,0))).
action_possible("load-truck",2,((2,3), (2,5), (2,7), (2,1))).
action_possible("load-truck",2,((2,3), (2,4), (2,1), (2,1))).
action_possible("drive-truck",2,((2,2), (2,6), (2,1), (2,4))).
action_possible("unload-truck",2,((2,3), (2,5), (2,6), (2,1))).
action_possible("unload-truck",2,((2,3), (2,4), (2,7), (2,2))).
action_possible("board-truck",2,((2,7), (2,5), (2,1))).
action_possible("board-truck",2,((2,6), (2,5), (2,2))).
action_possible("disembark-truck",2,((2,6), (2,2), (2,4))).
action_possible("load-truck",2,((2,3), (2,4), (2,6), (2,2))).
action_possible("load-truck",2,((2,3), (2,5), (2,7), (2,2))).
action_possible("drive-truck",2,((2,2), (2,6), (2,1), (2,5))).
action_possible("load-truck",2,((2,3), (2,4), (2,7), (2,1))).
action_possible("unload-truck",2,((2,3), (2,5), (2,6), (2,2))).
action_possible("walk",2,((2,7), (2,2), (2,0))).
action_possible("drive-truck",2,((2,1), (2,7), (2,2), (2,5))).
action_possible("drive-truck",2,((2,2), (2,7), (2,1), (2,4))).
action_possible("disembark-truck",2,((2,6), (2,2), (2,5))).
action_possible("unload-truck",2,((2,3), (2,4), (2,6), (2,1))).
action_possible("board-truck",2,((2,6), (2,4), (2,1))).
action_possible("walk",2,((2,6), (2,1), (2,0))).
action_possible("load-truck",2,((2,3), (2,5), (2,6), (2,1))).
action_possible("walk",2,((2,7), (2,0), (2,1))).
action_possible("disembark-truck",2,((2,7), (2,2), (2,4))).
action_possible("load-truck",2,((2,3), (2,4), (2,7), (2,2))).
action_possible("unload-truck",2,((2,3), (2,4), (2,6), (2,2))).
action_possible("disembark-truck",2,((2,6), (2,1), (2,4))).
action_possible("board-truck",2,((2,6), (2,4), (2,2))).
action_possible("walk",2,((2,7), (2,0), (2,2))).
action_possible("load-truck",2,((2,3), (2,5), (2,6), (2,2))).
action_possible("load-truck",2,((2,3), (2,4), (2,6), (2,1))).
action_possible("unload-truck",2,((2,3), (2,5), (2,2), (2,2))).
action_possible("disembark-truck",2,((2,6), (2,1), (2,5))).
action_possible("walk",2,((2,7), (2,1), (2,0))).
action_possible("board-truck",2,((2,7), (2,5), (2,2))).
action_possible("unload-truck",2,((2,3), (2,5), (2,1), (2,1))).
action_possible("drive-truck",2,((2,2), (2,7), (2,1), (2,5))).
action_possible("disembark-truck",3,((3,7), (3,1), (3,4))).
action_possible("unload-truck",3,((3,3), (3,4), (3,2), (3,2))).
action_possible("disembark-truck",3,((3,7), (3,2), (3,5))).
action_possible("load-truck",3,((3,3), (3,5), (3,2), (3,2))).
action_possible("board-truck",3,((3,7), (3,4), (3,1))).
action_possible("drive-truck",3,((3,1), (3,7), (3,2), (3,4))).
action_possible("disembark-truck",3,((3,7), (3,1), (3,5))).
action_possible("unload-truck",3,((3,3), (3,5), (3,7), (3,1))).
action_possible("drive-truck",3,((3,1), (3,6), (3,2), (3,4))).
action_possible("unload-truck",3,((3,3), (3,4), (3,1), (3,1))).
action_possible("board-truck",3,((3,7), (3,4), (3,2))).
action_possible("walk",3,((3,6), (3,0), (3,1))).
action_possible("load-truck",3,((3,3), (3,5), (3,1), (3,1))).
action_possible("load-truck",3,((3,3), (3,4), (3,2), (3,2))).
action_possible("walk",3,((3,6), (3,0), (3,2))).
action_possible("unload-truck",3,((3,3), (3,5), (3,7), (3,2))).
action_possible("board-truck",3,((3,6), (3,5), (3,1))).
action_possible("drive-truck",3,((3,1), (3,6), (3,2), (3,5))).
action_possible("unload-truck",3,((3,3), (3,4), (3,7), (3,1))).
action_possible("walk",3,((3,6), (3,2), (3,0))).
action_possible("load-truck",3,((3,3), (3,5), (3,7), (3,1))).
action_possible("load-truck",3,((3,3), (3,4), (3,1), (3,1))).
action_possible("drive-truck",3,((3,2), (3,6), (3,1), (3,4))).
action_possible("unload-truck",3,((3,3), (3,5), (3,6), (3,1))).
action_possible("unload-truck",3,((3,3), (3,4), (3,7), (3,2))).
action_possible("disembark-truck",3,((3,6), (3,2), (3,4))).
action_possible("board-truck",3,((3,6), (3,5), (3,2))).
action_possible("board-truck",3,((3,7), (3,5), (3,1))).
action_possible("load-truck",3,((3,3), (3,5), (3,7), (3,2))).
action_possible("walk",3,((3,7), (3,2), (3,0))).
action_possible("drive-truck",3,((3,2), (3,6), (3,1), (3,5))).
action_possible("unload-truck",3,((3,3), (3,5), (3,6), (3,2))).
action_possible("drive-truck",3,((3,1), (3,7), (3,2), (3,5))).
action_possible("load-truck",3,((3,3), (3,4), (3,7), (3,1))).
action_possible("disembark-truck",3,((3,6), (3,2), (3,5))).
action_possible("drive-truck",3,((3,2), (3,7), (3,1), (3,4))).
action_possible("unload-truck",3,((3,3), (3,4), (3,6), (3,1))).
action_possible("board-truck",3,((3,6), (3,4), (3,1))).
action_possible("walk",3,((3,6), (3,1), (3,0))).
action_possible("walk",3,((3,7), (3,0), (3,1))).
action_possible("disembark-truck",3,((3,7), (3,2), (3,4))).
action_possible("load-truck",3,((3,3), (3,5), (3,6), (3,1))).
action_possible("load-truck",3,((3,3), (3,4), (3,7), (3,2))).
action_possible("unload-truck",3,((3,3), (3,4), (3,6), (3,2))).
action_possible("disembark-truck",3,((3,6), (3,1), (3,4))).
action_possible("board-truck",3,((3,6), (3,4), (3,2))).
action_possible("walk",3,((3,7), (3,0), (3,2))).
action_possible("load-truck",3,((3,3), (3,5), (3,6), (3,2))).
action_possible("load-truck",3,((3,3), (3,4), (3,6), (3,1))).
action_possible("unload-truck",3,((3,3), (3,5), (3,2), (3,2))).
action_possible("disembark-truck",3,((3,6), (3,1), (3,5))).
action_possible("walk",3,((3,7), (3,1), (3,0))).
action_possible("board-truck",3,((3,7), (3,5), (3,2))).
action_possible("load-truck",3,((3,3), (3,4), (3,6), (3,2))).
action_possible("drive-truck",3,((3,2), (3,7), (3,1), (3,5))).
action_possible("unload-truck",3,((3,3), (3,5), (3,1), (3,1))).
action_possible("disembark-truck",4,((4,7), (4,1), (4,4))).
action_possible("unload-truck",4,((4,3), (4,4), (4,2), (4,2))).
action_possible("disembark-truck",4,((4,7), (4,2), (4,5))).
action_possible("load-truck",4,((4,3), (4,5), (4,2), (4,2))).
action_possible("board-truck",4,((4,7), (4,4), (4,1))).
action_possible("drive-truck",4,((4,1), (4,7), (4,2), (4,4))).
action_possible("disembark-truck",4,((4,7), (4,1), (4,5))).
action_possible("unload-truck",4,((4,3), (4,5), (4,7), (4,1))).
action_possible("unload-truck",4,((4,3), (4,4), (4,1), (4,1))).
action_possible("drive-truck",4,((4,1), (4,6), (4,2), (4,4))).
action_possible("walk",4,((4,6), (4,0), (4,1))).
action_possible("board-truck",4,((4,7), (4,4), (4,2))).
action_possible("load-truck",4,((4,3), (4,5), (4,1), (4,1))).
action_possible("load-truck",4,((4,3), (4,4), (4,2), (4,2))).
action_possible("walk",4,((4,6), (4,0), (4,2))).
action_possible("unload-truck",4,((4,3), (4,5), (4,7), (4,2))).
action_possible("board-truck",4,((4,6), (4,5), (4,1))).
action_possible("drive-truck",4,((4,1), (4,6), (4,2), (4,5))).
action_possible("unload-truck",4,((4,3), (4,4), (4,7), (4,1))).
action_possible("walk",4,((4,6), (4,2), (4,0))).
action_possible("load-truck",4,((4,3), (4,5), (4,7), (4,1))).
action_possible("load-truck",4,((4,3), (4,4), (4,1), (4,1))).
action_possible("drive-truck",4,((4,2), (4,6), (4,1), (4,4))).
action_possible("unload-truck",4,((4,3), (4,5), (4,6), (4,1))).
action_possible("unload-truck",4,((4,3), (4,4), (4,7), (4,2))).
action_possible("board-truck",4,((4,7), (4,5), (4,1))).
action_possible("disembark-truck",4,((4,6), (4,2), (4,4))).
action_possible("board-truck",4,((4,6), (4,5), (4,2))).
action_possible("load-truck",4,((4,3), (4,4), (4,6), (4,2))).
action_possible("load-truck",4,((4,3), (4,5), (4,7), (4,2))).
action_possible("walk",4,((4,7), (4,2), (4,0))).
action_possible("load-truck",4,((4,3), (4,4), (4,7), (4,1))).
action_possible("drive-truck",4,((4,2), (4,6), (4,1), (4,5))).
action_possible("drive-truck",4,((4,1), (4,7), (4,2), (4,5))).
action_possible("unload-truck",4,((4,3), (4,5), (4,6), (4,2))).
action_possible("drive-truck",4,((4,2), (4,7), (4,1), (4,4))).
action_possible("disembark-truck",4,((4,6), (4,2), (4,5))).
action_possible("unload-truck",4,((4,3), (4,4), (4,6), (4,1))).
action_possible("board-truck",4,((4,6), (4,4), (4,1))).
action_possible("walk",4,((4,6), (4,1), (4,0))).
action_possible("walk",4,((4,7), (4,0), (4,1))).
action_possible("disembark-truck",4,((4,7), (4,2), (4,4))).
action_possible("load-truck",4,((4,3), (4,5), (4,6), (4,1))).
action_possible("load-truck",4,((4,3), (4,4), (4,7), (4,2))).
action_possible("unload-truck",4,((4,3), (4,4), (4,6), (4,2))).
action_possible("disembark-truck",4,((4,6), (4,1), (4,4))).
action_possible("board-truck",4,((4,6), (4,4), (4,2))).
action_possible("walk",4,((4,7), (4,0), (4,2))).
action_possible("load-truck",4,((4,3), (4,5), (4,6), (4,2))).
action_possible("load-truck",4,((4,3), (4,4), (4,6), (4,1))).
action_possible("unload-truck",4,((4,3), (4,5), (4,2), (4,2))).
action_possible("disembark-truck",4,((4,6), (4,1), (4,5))).
action_possible("walk",4,((4,7), (4,1), (4,0))).
action_possible("board-truck",4,((4,7), (4,5), (4,2))).
action_possible("unload-truck",4,((4,3), (4,5), (4,1), (4,1))).
action_possible("drive-truck",4,((4,2), (4,7), (4,1), (4,5))).
action_possible("disembark-truck",5,((5,7), (5,1), (5,4))).
action_possible("unload-truck",5,((5,3), (5,4), (5,2), (5,2))).
action_possible("disembark-truck",5,((5,7), (5,2), (5,5))).
action_possible("load-truck",5,((5,3), (5,5), (5,2), (5,2))).
action_possible("board-truck",5,((5,7), (5,4), (5,1))).
action_possible("drive-truck",5,((5,1), (5,7), (5,2), (5,4))).
action_possible("disembark-truck",5,((5,7), (5,1), (5,5))).
action_possible("unload-truck",5,((5,3), (5,5), (5,7), (5,1))).
action_possible("drive-truck",5,((5,1), (5,6), (5,2), (5,4))).
action_possible("unload-truck",5,((5,3), (5,4), (5,1), (5,1))).
action_possible("board-truck",5,((5,7), (5,4), (5,2))).
action_possible("walk",5,((5,6), (5,0), (5,1))).
action_possible("load-truck",5,((5,3), (5,5), (5,1), (5,1))).
action_possible("load-truck",5,((5,3), (5,4), (5,2), (5,2))).
action_possible("walk",5,((5,6), (5,0), (5,2))).
action_possible("unload-truck",5,((5,3), (5,5), (5,7), (5,2))).
action_possible("board-truck",5,((5,6), (5,5), (5,1))).
action_possible("drive-truck",5,((5,1), (5,6), (5,2), (5,5))).
action_possible("unload-truck",5,((5,3), (5,4), (5,7), (5,1))).
action_possible("walk",5,((5,6), (5,2), (5,0))).
action_possible("load-truck",5,((5,3), (5,5), (5,7), (5,1))).
action_possible("load-truck",5,((5,3), (5,4), (5,1), (5,1))).
action_possible("drive-truck",5,((5,2), (5,6), (5,1), (5,4))).
action_possible("unload-truck",5,((5,3), (5,5), (5,6), (5,1))).
action_possible("unload-truck",5,((5,3), (5,4), (5,7), (5,2))).
action_possible("disembark-truck",5,((5,6), (5,2), (5,4))).
action_possible("board-truck",5,((5,6), (5,5), (5,2))).
action_possible("board-truck",5,((5,7), (5,5), (5,1))).
action_possible("load-truck",5,((5,3), (5,5), (5,7), (5,2))).
action_possible("drive-truck",5,((5,2), (5,6), (5,1), (5,5))).
action_possible("walk",5,((5,7), (5,2), (5,0))).
action_possible("unload-truck",5,((5,3), (5,5), (5,6), (5,2))).
action_possible("drive-truck",5,((5,1), (5,7), (5,2), (5,5))).
action_possible("load-truck",5,((5,3), (5,4), (5,7), (5,1))).
action_possible("disembark-truck",5,((5,6), (5,2), (5,5))).
action_possible("drive-truck",5,((5,2), (5,7), (5,1), (5,4))).
action_possible("unload-truck",5,((5,3), (5,4), (5,6), (5,1))).
action_possible("board-truck",5,((5,6), (5,4), (5,1))).
action_possible("walk",5,((5,6), (5,1), (5,0))).
action_possible("disembark-truck",5,((5,7), (5,2), (5,4))).
action_possible("walk",5,((5,7), (5,0), (5,1))).
action_possible("load-truck",5,((5,3), (5,5), (5,6), (5,1))).
action_possible("load-truck",5,((5,3), (5,4), (5,7), (5,2))).
action_possible("unload-truck",5,((5,3), (5,4), (5,6), (5,2))).
action_possible("disembark-truck",5,((5,6), (5,1), (5,4))).
action_possible("board-truck",5,((5,6), (5,4), (5,2))).
action_possible("walk",5,((5,7), (5,0), (5,2))).
action_possible("load-truck",5,((5,3), (5,5), (5,6), (5,2))).
action_possible("load-truck",5,((5,3), (5,4), (5,6), (5,1))).
action_possible("unload-truck",5,((5,3), (5,5), (5,2), (5,2))).
action_possible("disembark-truck",5,((5,6), (5,1), (5,5))).
action_possible("walk",5,((5,7), (5,1), (5,0))).
action_possible("board-truck",5,((5,7), (5,5), (5,2))).
action_possible("load-truck",5,((5,3), (5,4), (5,6), (5,2))).
action_possible("drive-truck",5,((5,2), (5,7), (5,1), (5,5))).
action_possible("unload-truck",5,((5,3), (5,5), (5,1), (5,1))).
action_possible("unload-truck",6,((6,6), (6,7), (6,3), (6,3))).
action_possible("load-truck",6,((6,5), (6,7), (6,4), (6,4))).
action_possible("unload-truck",6,((6,6), (6,7), (6,8), (6,2))).
action_possible("unload-truck",6,((6,5), (6,7), (6,2), (6,2))).
action_possible("walk",6,((6,8), (6,3), (6,0))).
action_possible("board-truck",6,((6,8), (6,7), (6,2))).
action_possible("load-truck",6,((6,5), (6,7), (6,3), (6,3))).
action_possible("unload-truck",6,((6,6), (6,7), (6,4), (6,4))).
action_possible("walk",6,((6,8), (6,4), (6,1))).
action_possible("disembark-truck",6,((6,8), (6,2), (6,7))).
action_possible("walk",6,((6,8), (6,3), (6,1))).
action_possible("board-truck",6,((6,8), (6,7), (6,3))).
action_possible("unload-truck",6,((6,6), (6,7), (6,2), (6,2))).
action_possible("drive-truck",6,((6,3), (6,8), (6,2), (6,7))).
action_possible("load-truck",6,((6,6), (6,7), (6,3), (6,3))).
action_possible("drive-truck",6,((6,4), (6,8), (6,2), (6,7))).
action_possible("load-truck",6,((6,6), (6,7), (6,8), (6,2))).
action_possible("board-truck",6,((6,8), (6,7), (6,4))).
action_possible("load-truck",6,((6,5), (6,7), (6,2), (6,2))).
action_possible("drive-truck",6,((6,2), (6,8), (6,4), (6,7))).
action_possible("load-truck",6,((6,6), (6,7), (6,4), (6,4))).
action_possible("unload-truck",6,((6,5), (6,7), (6,8), (6,2))).
action_possible("walk",6,((6,8), (6,2), (6,0))).
action_possible("walk",6,((6,8), (6,1), (6,3))).
action_possible("load-truck",6,((6,6), (6,7), (6,2), (6,2))).
action_possible("drive-truck",6,((6,2), (6,8), (6,3), (6,7))).
action_possible("unload-truck",6,((6,5), (6,7), (6,8), (6,3))).
action_possible("unload-truck",6,((6,6), (6,7), (6,8), (6,3))).
action_possible("load-truck",6,((6,5), (6,7), (6,8), (6,2))).
action_possible("disembark-truck",6,((6,8), (6,4), (6,7))).
action_possible("drive-truck",6,((6,3), (6,8), (6,4), (6,7))).
action_possible("unload-truck",6,((6,5), (6,7), (6,8), (6,4))).
action_possible("walk",6,((6,8), (6,1), (6,4))).
action_possible("walk",6,((6,8), (6,0), (6,2))).
action_possible("unload-truck",6,((6,6), (6,7), (6,8), (6,4))).
action_possible("load-truck",6,((6,5), (6,7), (6,8), (6,3))).
action_possible("walk",6,((6,8), (6,0), (6,3))).
action_possible("load-truck",6,((6,6), (6,7), (6,8), (6,3))).
action_possible("load-truck",6,((6,5), (6,7), (6,8), (6,4))).
action_possible("load-truck",6,((6,6), (6,7), (6,8), (6,4))).
action_possible("disembark-truck",6,((6,8), (6,3), (6,7))).
action_possible("unload-truck",6,((6,5), (6,7), (6,4), (6,4))).
action_possible("unload-truck",6,((6,5), (6,7), (6,3), (6,3))).
action_possible("drive-truck",6,((6,4), (6,8), (6,3), (6,7))).
action_possible("unload-truck",7,((7,6), (7,7), (7,3), (7,3))).
action_possible("unload-truck",7,((7,6), (7,7), (7,8), (7,2))).
action_possible("load-truck",7,((7,5), (7,7), (7,4), (7,4))).
action_possible("unload-truck",7,((7,5), (7,7), (7,2), (7,2))).
action_possible("walk",7,((7,8), (7,3), (7,0))).
action_possible("board-truck",7,((7,8), (7,7), (7,2))).
action_possible("load-truck",7,((7,5), (7,7), (7,3), (7,3))).
action_possible("unload-truck",7,((7,6), (7,7), (7,4), (7,4))).
action_possible("walk",7,((7,8), (7,4), (7,1))).
action_possible("disembark-truck",7,((7,8), (7,2), (7,7))).
action_possible("walk",7,((7,8), (7,3), (7,1))).
action_possible("board-truck",7,((7,8), (7,7), (7,3))).
action_possible("unload-truck",7,((7,6), (7,7), (7,2), (7,2))).
action_possible("drive-truck",7,((7,3), (7,8), (7,2), (7,7))).
action_possible("load-truck",7,((7,6), (7,7), (7,3), (7,3))).
action_possible("drive-truck",7,((7,4), (7,8), (7,2), (7,7))).
action_possible("load-truck",7,((7,6), (7,7), (7,8), (7,2))).
action_possible("board-truck",7,((7,8), (7,7), (7,4))).
action_possible("load-truck",7,((7,5), (7,7), (7,2), (7,2))).
action_possible("drive-truck",7,((7,2), (7,8), (7,4), (7,7))).
action_possible("load-truck",7,((7,6), (7,7), (7,4), (7,4))).
action_possible("unload-truck",7,((7,5), (7,7), (7,8), (7,2))).
action_possible("walk",7,((7,8), (7,2), (7,0))).
action_possible("walk",7,((7,8), (7,1), (7,3))).
action_possible("load-truck",7,((7,6), (7,7), (7,2), (7,2))).
action_possible("drive-truck",7,((7,2), (7,8), (7,3), (7,7))).
action_possible("unload-truck",7,((7,5), (7,7), (7,8), (7,3))).
action_possible("unload-truck",7,((7,6), (7,7), (7,8), (7,3))).
action_possible("load-truck",7,((7,5), (7,7), (7,8), (7,2))).
action_possible("disembark-truck",7,((7,8), (7,4), (7,7))).
action_possible("drive-truck",7,((7,3), (7,8), (7,4), (7,7))).
action_possible("unload-truck",7,((7,5), (7,7), (7,8), (7,4))).
action_possible("walk",7,((7,8), (7,1), (7,4))).
action_possible("walk",7,((7,8), (7,0), (7,2))).
action_possible("unload-truck",7,((7,6), (7,7), (7,8), (7,4))).
action_possible("load-truck",7,((7,5), (7,7), (7,8), (7,3))).
action_possible("walk",7,((7,8), (7,0), (7,3))).
action_possible("load-truck",7,((7,6), (7,7), (7,8), (7,3))).
action_possible("load-truck",7,((7,5), (7,7), (7,8), (7,4))).
action_possible("load-truck",7,((7,6), (7,7), (7,8), (7,4))).
action_possible("disembark-truck",7,((7,8), (7,3), (7,7))).
action_possible("unload-truck",7,((7,5), (7,7), (7,4), (7,4))).
action_possible("unload-truck",7,((7,5), (7,7), (7,3), (7,3))).
action_possible("drive-truck",7,((7,4), (7,8), (7,3), (7,7))).
action_possible("unload-truck",8,((8,6), (8,7), (8,3), (8,3))).
action_possible("unload-truck",8,((8,6), (8,7), (8,8), (8,2))).
action_possible("load-truck",8,((8,5), (8,7), (8,4), (8,4))).
action_possible("unload-truck",8,((8,5), (8,7), (8,2), (8,2))).
action_possible("walk",8,((8,8), (8,3), (8,0))).
action_possible("board-truck",8,((8,8), (8,7), (8,2))).
action_possible("load-truck",8,((8,5), (8,7), (8,3), (8,3))).
action_possible("unload-truck",8,((8,6), (8,7), (8,4), (8,4))).
action_possible("walk",8,((8,8), (8,4), (8,1))).
action_possible("disembark-truck",8,((8,8), (8,2), (8,7))).
action_possible("walk",8,((8,8), (8,3), (8,1))).
action_possible("board-truck",8,((8,8), (8,7), (8,3))).
action_possible("unload-truck",8,((8,6), (8,7), (8,2), (8,2))).
action_possible("drive-truck",8,((8,3), (8,8), (8,2), (8,7))).
action_possible("load-truck",8,((8,6), (8,7), (8,3), (8,3))).
action_possible("drive-truck",8,((8,4), (8,8), (8,2), (8,7))).
action_possible("load-truck",8,((8,6), (8,7), (8,8), (8,2))).
action_possible("board-truck",8,((8,8), (8,7), (8,4))).
action_possible("load-truck",8,((8,5), (8,7), (8,2), (8,2))).
action_possible("walk",8,((8,8), (8,2), (8,0))).
action_possible("drive-truck",8,((8,2), (8,8), (8,4), (8,7))).
action_possible("unload-truck",8,((8,5), (8,7), (8,8), (8,2))).
action_possible("load-truck",8,((8,6), (8,7), (8,4), (8,4))).
action_possible("load-truck",8,((8,6), (8,7), (8,2), (8,2))).
action_possible("walk",8,((8,8), (8,1), (8,3))).
action_possible("drive-truck",8,((8,2), (8,8), (8,3), (8,7))).
action_possible("unload-truck",8,((8,5), (8,7), (8,8), (8,3))).
action_possible("unload-truck",8,((8,6), (8,7), (8,8), (8,3))).
action_possible("load-truck",8,((8,5), (8,7), (8,8), (8,2))).
action_possible("disembark-truck",8,((8,8), (8,4), (8,7))).
action_possible("drive-truck",8,((8,3), (8,8), (8,4), (8,7))).
action_possible("unload-truck",8,((8,5), (8,7), (8,8), (8,4))).
action_possible("walk",8,((8,8), (8,1), (8,4))).
action_possible("walk",8,((8,8), (8,0), (8,2))).
action_possible("load-truck",8,((8,5), (8,7), (8,8), (8,3))).
action_possible("unload-truck",8,((8,6), (8,7), (8,8), (8,4))).
action_possible("walk",8,((8,8), (8,0), (8,3))).
action_possible("load-truck",8,((8,6), (8,7), (8,8), (8,3))).
action_possible("load-truck",8,((8,5), (8,7), (8,8), (8,4))).
action_possible("load-truck",8,((8,6), (8,7), (8,8), (8,4))).
action_possible("disembark-truck",8,((8,8), (8,3), (8,7))).
action_possible("unload-truck",8,((8,5), (8,7), (8,4), (8,4))).
action_possible("unload-truck",8,((8,5), (8,7), (8,3), (8,3))).
action_possible("drive-truck",8,((8,4), (8,8), (8,3), (8,7))).
action_possible("unload-truck",9,((9,6), (9,7), (9,3), (9,3))).
action_possible("unload-truck",9,((9,6), (9,7), (9,8), (9,2))).
action_possible("load-truck",9,((9,5), (9,7), (9,4), (9,4))).
action_possible("unload-truck",9,((9,5), (9,7), (9,2), (9,2))).
action_possible("walk",9,((9,8), (9,3), (9,0))).
action_possible("board-truck",9,((9,8), (9,7), (9,2))).
action_possible("load-truck",9,((9,5), (9,7), (9,3), (9,3))).
action_possible("unload-truck",9,((9,6), (9,7), (9,4), (9,4))).
action_possible("walk",9,((9,8), (9,4), (9,1))).
action_possible("disembark-truck",9,((9,8), (9,2), (9,7))).
action_possible("walk",9,((9,8), (9,3), (9,1))).
action_possible("board-truck",9,((9,8), (9,7), (9,3))).
action_possible("unload-truck",9,((9,6), (9,7), (9,2), (9,2))).
action_possible("drive-truck",9,((9,3), (9,8), (9,2), (9,7))).
action_possible("load-truck",9,((9,6), (9,7), (9,3), (9,3))).
action_possible("drive-truck",9,((9,4), (9,8), (9,2), (9,7))).
action_possible("load-truck",9,((9,6), (9,7), (9,8), (9,2))).
action_possible("board-truck",9,((9,8), (9,7), (9,4))).
action_possible("load-truck",9,((9,5), (9,7), (9,2), (9,2))).
action_possible("walk",9,((9,8), (9,2), (9,0))).
action_possible("unload-truck",9,((9,5), (9,7), (9,8), (9,2))).
action_possible("drive-truck",9,((9,2), (9,8), (9,4), (9,7))).
action_possible("load-truck",9,((9,6), (9,7), (9,4), (9,4))).
action_possible("walk",9,((9,8), (9,1), (9,3))).
action_possible("load-truck",9,((9,6), (9,7), (9,2), (9,2))).
action_possible("drive-truck",9,((9,2), (9,8), (9,3), (9,7))).
action_possible("unload-truck",9,((9,5), (9,7), (9,8), (9,3))).
action_possible("unload-truck",9,((9,6), (9,7), (9,8), (9,3))).
action_possible("load-truck",9,((9,5), (9,7), (9,8), (9,2))).
action_possible("disembark-truck",9,((9,8), (9,4), (9,7))).
action_possible("drive-truck",9,((9,3), (9,8), (9,4), (9,7))).
action_possible("unload-truck",9,((9,5), (9,7), (9,8), (9,4))).
action_possible("walk",9,((9,8), (9,1), (9,4))).
action_possible("walk",9,((9,8), (9,0), (9,2))).
action_possible("load-truck",9,((9,5), (9,7), (9,8), (9,3))).
action_possible("unload-truck",9,((9,6), (9,7), (9,8), (9,4))).
action_possible("walk",9,((9,8), (9,0), (9,3))).
action_possible("load-truck",9,((9,6), (9,7), (9,8), (9,3))).
action_possible("load-truck",9,((9,5), (9,7), (9,8), (9,4))).
action_possible("load-truck",9,((9,6), (9,7), (9,8), (9,4))).
action_possible("disembark-truck",9,((9,8), (9,3), (9,7))).
action_possible("unload-truck",9,((9,5), (9,7), (9,4), (9,4))).
action_possible("unload-truck",9,((9,5), (9,7), (9,3), (9,3))).
action_possible("drive-truck",9,((9,4), (9,8), (9,3), (9,7))).
action_possible("unload-truck",10,((10,6), (10,7), (10,3), (10,3))).
action_possible("load-truck",10,((10,5), (10,7), (10,4), (10,4))).
action_possible("unload-truck",10,((10,6), (10,7), (10,8), (10,2))).
action_possible("unload-truck",10,((10,5), (10,7), (10,2), (10,2))).
action_possible("walk",10,((10,8), (10,3), (10,0))).
action_possible("board-truck",10,((10,8), (10,7), (10,2))).
action_possible("load-truck",10,((10,5), (10,7), (10,3), (10,3))).
action_possible("unload-truck",10,((10,6), (10,7), (10,4), (10,4))).
action_possible("disembark-truck",10,((10,8), (10,2), (10,7))).
action_possible("walk",10,((10,8), (10,4), (10,1))).
action_possible("walk",10,((10,8), (10,3), (10,1))).
action_possible("board-truck",10,((10,8), (10,7), (10,3))).
action_possible("unload-truck",10,((10,6), (10,7), (10,2), (10,2))).
action_possible("drive-truck",10,((10,3), (10,8), (10,2), (10,7))).
action_possible("load-truck",10,((10,6), (10,7), (10,3), (10,3))).
action_possible("drive-truck",10,((10,4), (10,8), (10,2), (10,7))).
action_possible("load-truck",10,((10,6), (10,7), (10,8), (10,2))).
action_possible("board-truck",10,((10,8), (10,7), (10,4))).
action_possible("load-truck",10,((10,5), (10,7), (10,2), (10,2))).
action_possible("drive-truck",10,((10,2), (10,8), (10,4), (10,7))).
action_possible("walk",10,((10,8), (10,2), (10,0))).
action_possible("load-truck",10,((10,6), (10,7), (10,4), (10,4))).
action_possible("unload-truck",10,((10,5), (10,7), (10,8), (10,2))).
action_possible("walk",10,((10,8), (10,1), (10,3))).
action_possible("load-truck",10,((10,6), (10,7), (10,2), (10,2))).
action_possible("drive-truck",10,((10,2), (10,8), (10,3), (10,7))).
action_possible("unload-truck",10,((10,5), (10,7), (10,8), (10,3))).
action_possible("unload-truck",10,((10,6), (10,7), (10,8), (10,3))).
action_possible("load-truck",10,((10,5), (10,7), (10,8), (10,2))).
action_possible("disembark-truck",10,((10,8), (10,4), (10,7))).
action_possible("drive-truck",10,((10,3), (10,8), (10,4), (10,7))).
action_possible("unload-truck",10,((10,5), (10,7), (10,8), (10,4))).
action_possible("walk",10,((10,8), (10,1), (10,4))).
action_possible("walk",10,((10,8), (10,0), (10,2))).
action_possible("unload-truck",10,((10,6), (10,7), (10,8), (10,4))).
action_possible("load-truck",10,((10,5), (10,7), (10,8), (10,3))).
action_possible("walk",10,((10,8), (10,0), (10,3))).
action_possible("load-truck",10,((10,6), (10,7), (10,8), (10,3))).
action_possible("load-truck",10,((10,5), (10,7), (10,8), (10,4))).
action_possible("load-truck",10,((10,6), (10,7), (10,8), (10,4))).
action_possible("disembark-truck",10,((10,8), (10,3), (10,7))).
action_possible("unload-truck",10,((10,5), (10,7), (10,4), (10,4))).
action_possible("unload-truck",10,((10,5), (10,7), (10,3), (10,3))).
action_possible("drive-truck",10,((10,4), (10,8), (10,3), (10,7))).
action_possible("unload-truck",11,((11,6), (11,7), (11,3), (11,3))).
action_possible("unload-truck",11,((11,6), (11,7), (11,8), (11,2))).
action_possible("load-truck",11,((11,5), (11,7), (11,4), (11,4))).
action_possible("unload-truck",11,((11,5), (11,7), (11,2), (11,2))).
action_possible("walk",11,((11,8), (11,3), (11,0))).
action_possible("board-truck",11,((11,8), (11,7), (11,2))).
action_possible("load-truck",11,((11,5), (11,7), (11,3), (11,3))).
action_possible("unload-truck",11,((11,6), (11,7), (11,4), (11,4))).
action_possible("walk",11,((11,8), (11,4), (11,1))).
action_possible("disembark-truck",11,((11,8), (11,2), (11,7))).
action_possible("walk",11,((11,8), (11,3), (11,1))).
action_possible("board-truck",11,((11,8), (11,7), (11,3))).
action_possible("unload-truck",11,((11,6), (11,7), (11,2), (11,2))).
action_possible("drive-truck",11,((11,3), (11,8), (11,2), (11,7))).
action_possible("load-truck",11,((11,6), (11,7), (11,3), (11,3))).
action_possible("drive-truck",11,((11,4), (11,8), (11,2), (11,7))).
action_possible("load-truck",11,((11,6), (11,7), (11,8), (11,2))).
action_possible("board-truck",11,((11,8), (11,7), (11,4))).
action_possible("load-truck",11,((11,5), (11,7), (11,2), (11,2))).
action_possible("drive-truck",11,((11,2), (11,8), (11,4), (11,7))).
action_possible("load-truck",11,((11,6), (11,7), (11,4), (11,4))).
action_possible("walk",11,((11,8), (11,2), (11,0))).
action_possible("unload-truck",11,((11,5), (11,7), (11,8), (11,2))).
action_possible("walk",11,((11,8), (11,1), (11,3))).
action_possible("load-truck",11,((11,6), (11,7), (11,2), (11,2))).
action_possible("drive-truck",11,((11,2), (11,8), (11,3), (11,7))).
action_possible("unload-truck",11,((11,5), (11,7), (11,8), (11,3))).
action_possible("unload-truck",11,((11,6), (11,7), (11,8), (11,3))).
action_possible("load-truck",11,((11,5), (11,7), (11,8), (11,2))).
action_possible("disembark-truck",11,((11,8), (11,4), (11,7))).
action_possible("drive-truck",11,((11,3), (11,8), (11,4), (11,7))).
action_possible("unload-truck",11,((11,5), (11,7), (11,8), (11,4))).
action_possible("walk",11,((11,8), (11,1), (11,4))).
action_possible("walk",11,((11,8), (11,0), (11,2))).
action_possible("unload-truck",11,((11,6), (11,7), (11,8), (11,4))).
action_possible("load-truck",11,((11,5), (11,7), (11,8), (11,3))).
action_possible("walk",11,((11,8), (11,0), (11,3))).
action_possible("load-truck",11,((11,6), (11,7), (11,8), (11,3))).
action_possible("load-truck",11,((11,5), (11,7), (11,8), (11,4))).
action_possible("load-truck",11,((11,6), (11,7), (11,8), (11,4))).
action_possible("disembark-truck",11,((11,8), (11,3), (11,7))).
action_possible("unload-truck",11,((11,5), (11,7), (11,4), (11,4))).
action_possible("unload-truck",11,((11,5), (11,7), (11,3), (11,3))).
action_possible("drive-truck",11,((11,4), (11,8), (11,3), (11,7))).
action_possible("unload-truck",12,((12,5), (12,6), (12,4), (12,4))).
action_possible("load-truck",12,((12,5), (12,7), (12,4), (12,4))).
action_possible("drive-truck",12,((12,3), (12,8), (12,2), (12,6))).
action_possible("unload-truck",12,((12,5), (12,7), (12,2), (12,2))).
action_possible("walk",12,((12,8), (12,3), (12,0))).
action_possible("board-truck",12,((12,8), (12,7), (12,2))).
action_possible("drive-truck",12,((12,4), (12,8), (12,2), (12,6))).
action_possible("load-truck",12,((12,5), (12,7), (12,3), (12,3))).
action_possible("walk",12,((12,8), (12,4), (12,1))).
action_possible("disembark-truck",12,((12,8), (12,2), (12,7))).
action_possible("unload-truck",12,((12,5), (12,6), (12,3), (12,3))).
action_possible("board-truck",12,((12,8), (12,6), (12,2))).
action_possible("walk",12,((12,8), (12,3), (12,1))).
action_possible("board-truck",12,((12,8), (12,7), (12,3))).
action_possible("load-truck",12,((12,5), (12,6), (12,4), (12,4))).
action_possible("drive-truck",12,((12,3), (12,8), (12,2), (12,7))).
action_possible("drive-truck",12,((12,4), (12,8), (12,2), (12,7))).
action_possible("board-truck",12,((12,8), (12,7), (12,4))).
action_possible("drive-truck",12,((12,2), (12,8), (12,3), (12,6))).
action_possible("drive-truck",12,((12,2), (12,8), (12,4), (12,7))).
action_possible("unload-truck",12,((12,5), (12,7), (12,8), (12,2))).
action_possible("walk",12,((12,8), (12,2), (12,0))).
action_possible("load-truck",12,((12,5), (12,7), (12,2), (12,2))).
action_possible("disembark-truck",12,((12,8), (12,4), (12,6))).
action_possible("drive-truck",12,((12,3), (12,8), (12,4), (12,6))).
action_possible("walk",12,((12,8), (12,1), (12,3))).
action_possible("load-truck",12,((12,5), (12,6), (12,3), (12,3))).
action_possible("drive-truck",12,((12,2), (12,8), (12,3), (12,7))).
action_possible("unload-truck",12,((12,5), (12,7), (12,8), (12,3))).
action_possible("unload-truck",12,((12,5), (12,6), (12,2), (12,2))).
action_possible("unload-truck",12,((12,5), (12,6), (12,8), (12,2))).
action_possible("load-truck",12,((12,5), (12,7), (12,8), (12,2))).
action_possible("disembark-truck",12,((12,8), (12,4), (12,7))).
action_possible("drive-truck",12,((12,3), (12,8), (12,4), (12,7))).
action_possible("drive-truck",12,((12,4), (12,8), (12,3), (12,6))).
action_possible("unload-truck",12,((12,5), (12,7), (12,8), (12,4))).
action_possible("walk",12,((12,8), (12,1), (12,4))).
action_possible("walk",12,((12,8), (12,0), (12,2))).
action_possible("unload-truck",12,((12,5), (12,6), (12,8), (12,3))).
action_possible("board-truck",12,((12,8), (12,6), (12,3))).
action_possible("load-truck",12,((12,5), (12,7), (12,8), (12,3))).
action_possible("load-truck",12,((12,5), (12,6), (12,2), (12,2))).
action_possible("walk",12,((12,8), (12,0), (12,3))).
action_possible("board-truck",12,((12,8), (12,6), (12,4))).
action_possible("unload-truck",12,((12,5), (12,6), (12,8), (12,4))).
action_possible("load-truck",12,((12,5), (12,6), (12,8), (12,2))).
action_possible("disembark-truck",12,((12,8), (12,3), (12,6))).
action_possible("load-truck",12,((12,5), (12,7), (12,8), (12,4))).
action_possible("load-truck",12,((12,5), (12,6), (12,8), (12,3))).
action_possible("disembark-truck",12,((12,8), (12,3), (12,7))).
action_possible("unload-truck",12,((12,5), (12,7), (12,4), (12,4))).
action_possible("drive-truck",12,((12,2), (12,8), (12,4), (12,6))).
action_possible("load-truck",12,((12,5), (12,6), (12,8), (12,4))).
action_possible("unload-truck",12,((12,5), (12,7), (12,3), (12,3))).
action_possible("drive-truck",12,((12,4), (12,8), (12,3), (12,7))).
action_possible("disembark-truck",12,((12,8), (12,2), (12,6))).
action_possible("unload-truck",13,((13,5), (13,6), (13,4), (13,4))).
action_possible("drive-truck",13,((13,3), (13,8), (13,2), (13,6))).
action_possible("load-truck",13,((13,5), (13,7), (13,4), (13,4))).
action_possible("unload-truck",13,((13,5), (13,7), (13,2), (13,2))).
action_possible("walk",13,((13,8), (13,3), (13,0))).
action_possible("board-truck",13,((13,8), (13,7), (13,2))).
action_possible("drive-truck",13,((13,4), (13,8), (13,2), (13,6))).
action_possible("load-truck",13,((13,5), (13,7), (13,3), (13,3))).
action_possible("unload-truck",13,((13,5), (13,6), (13,3), (13,3))).
action_possible("disembark-truck",13,((13,8), (13,2), (13,7))).
action_possible("walk",13,((13,8), (13,4), (13,1))).
action_possible("board-truck",13,((13,8), (13,6), (13,2))).
action_possible("walk",13,((13,8), (13,3), (13,1))).
action_possible("board-truck",13,((13,8), (13,7), (13,3))).
action_possible("load-truck",13,((13,5), (13,6), (13,4), (13,4))).
action_possible("drive-truck",13,((13,3), (13,8), (13,2), (13,7))).
action_possible("drive-truck",13,((13,4), (13,8), (13,2), (13,7))).
action_possible("board-truck",13,((13,8), (13,7), (13,4))).
action_possible("drive-truck",13,((13,2), (13,8), (13,3), (13,6))).
action_possible("walk",13,((13,8), (13,2), (13,0))).
action_possible("drive-truck",13,((13,2), (13,8), (13,4), (13,7))).
action_possible("unload-truck",13,((13,5), (13,7), (13,8), (13,2))).
action_possible("load-truck",13,((13,5), (13,7), (13,2), (13,2))).
action_possible("disembark-truck",13,((13,8), (13,4), (13,6))).
action_possible("drive-truck",13,((13,3), (13,8), (13,4), (13,6))).
action_possible("load-truck",13,((13,5), (13,6), (13,3), (13,3))).
action_possible("walk",13,((13,8), (13,1), (13,3))).
action_possible("drive-truck",13,((13,2), (13,8), (13,3), (13,7))).
action_possible("unload-truck",13,((13,5), (13,7), (13,8), (13,3))).
action_possible("unload-truck",13,((13,5), (13,6), (13,2), (13,2))).
action_possible("unload-truck",13,((13,5), (13,6), (13,8), (13,2))).
action_possible("load-truck",13,((13,5), (13,7), (13,8), (13,2))).
action_possible("disembark-truck",13,((13,8), (13,4), (13,7))).
action_possible("drive-truck",13,((13,3), (13,8), (13,4), (13,7))).
action_possible("drive-truck",13,((13,4), (13,8), (13,3), (13,6))).
action_possible("unload-truck",13,((13,5), (13,7), (13,8), (13,4))).
action_possible("walk",13,((13,8), (13,1), (13,4))).
action_possible("walk",13,((13,8), (13,0), (13,2))).
action_possible("board-truck",13,((13,8), (13,6), (13,3))).
action_possible("unload-truck",13,((13,5), (13,6), (13,8), (13,3))).
action_possible("load-truck",13,((13,5), (13,7), (13,8), (13,3))).
action_possible("load-truck",13,((13,5), (13,6), (13,2), (13,2))).
action_possible("walk",13,((13,8), (13,0), (13,3))).
action_possible("unload-truck",13,((13,5), (13,6), (13,8), (13,4))).
action_possible("board-truck",13,((13,8), (13,6), (13,4))).
action_possible("load-truck",13,((13,5), (13,6), (13,8), (13,2))).
action_possible("disembark-truck",13,((13,8), (13,3), (13,6))).
action_possible("load-truck",13,((13,5), (13,7), (13,8), (13,4))).
action_possible("load-truck",13,((13,5), (13,6), (13,8), (13,3))).
action_possible("disembark-truck",13,((13,8), (13,3), (13,7))).
action_possible("unload-truck",13,((13,5), (13,7), (13,4), (13,4))).
action_possible("drive-truck",13,((13,2), (13,8), (13,4), (13,6))).
action_possible("unload-truck",13,((13,5), (13,7), (13,3), (13,3))).
action_possible("load-truck",13,((13,5), (13,6), (13,8), (13,4))).
action_possible("drive-truck",13,((13,4), (13,8), (13,3), (13,7))).
action_possible("disembark-truck",13,((13,8), (13,2), (13,6))).
action_possible("unload-truck",14,((14,5), (14,6), (14,4), (14,4))).
action_possible("load-truck",14,((14,5), (14,7), (14,4), (14,4))).
action_possible("drive-truck",14,((14,3), (14,8), (14,2), (14,6))).
action_possible("unload-truck",14,((14,5), (14,7), (14,2), (14,2))).
action_possible("walk",14,((14,8), (14,3), (14,0))).
action_possible("board-truck",14,((14,8), (14,7), (14,2))).
action_possible("drive-truck",14,((14,4), (14,8), (14,2), (14,6))).
action_possible("load-truck",14,((14,5), (14,7), (14,3), (14,3))).
action_possible("walk",14,((14,8), (14,4), (14,1))).
action_possible("disembark-truck",14,((14,8), (14,2), (14,7))).
action_possible("unload-truck",14,((14,5), (14,6), (14,3), (14,3))).
action_possible("board-truck",14,((14,8), (14,6), (14,2))).
action_possible("walk",14,((14,8), (14,3), (14,1))).
action_possible("board-truck",14,((14,8), (14,7), (14,3))).
action_possible("load-truck",14,((14,5), (14,6), (14,4), (14,4))).
action_possible("drive-truck",14,((14,3), (14,8), (14,2), (14,7))).
action_possible("drive-truck",14,((14,4), (14,8), (14,2), (14,7))).
action_possible("board-truck",14,((14,8), (14,7), (14,4))).
action_possible("drive-truck",14,((14,2), (14,8), (14,3), (14,6))).
action_possible("walk",14,((14,8), (14,2), (14,0))).
action_possible("drive-truck",14,((14,2), (14,8), (14,4), (14,7))).
action_possible("unload-truck",14,((14,5), (14,7), (14,8), (14,2))).
action_possible("load-truck",14,((14,5), (14,7), (14,2), (14,2))).
action_possible("disembark-truck",14,((14,8), (14,4), (14,6))).
action_possible("drive-truck",14,((14,3), (14,8), (14,4), (14,6))).
action_possible("walk",14,((14,8), (14,1), (14,3))).
action_possible("load-truck",14,((14,5), (14,6), (14,3), (14,3))).
action_possible("drive-truck",14,((14,2), (14,8), (14,3), (14,7))).
action_possible("unload-truck",14,((14,5), (14,7), (14,8), (14,3))).
action_possible("unload-truck",14,((14,5), (14,6), (14,2), (14,2))).
action_possible("unload-truck",14,((14,5), (14,6), (14,8), (14,2))).
action_possible("load-truck",14,((14,5), (14,7), (14,8), (14,2))).
action_possible("disembark-truck",14,((14,8), (14,4), (14,7))).
action_possible("drive-truck",14,((14,3), (14,8), (14,4), (14,7))).
action_possible("drive-truck",14,((14,4), (14,8), (14,3), (14,6))).
action_possible("unload-truck",14,((14,5), (14,7), (14,8), (14,4))).
action_possible("walk",14,((14,8), (14,1), (14,4))).
action_possible("walk",14,((14,8), (14,0), (14,2))).
action_possible("unload-truck",14,((14,5), (14,6), (14,8), (14,3))).
action_possible("board-truck",14,((14,8), (14,6), (14,3))).
action_possible("load-truck",14,((14,5), (14,7), (14,8), (14,3))).
action_possible("load-truck",14,((14,5), (14,6), (14,2), (14,2))).
action_possible("walk",14,((14,8), (14,0), (14,3))).
action_possible("board-truck",14,((14,8), (14,6), (14,4))).
action_possible("unload-truck",14,((14,5), (14,6), (14,8), (14,4))).
action_possible("load-truck",14,((14,5), (14,6), (14,8), (14,2))).
action_possible("disembark-truck",14,((14,8), (14,3), (14,6))).
action_possible("load-truck",14,((14,5), (14,7), (14,8), (14,4))).
action_possible("load-truck",14,((14,5), (14,6), (14,8), (14,3))).
action_possible("disembark-truck",14,((14,8), (14,3), (14,7))).
action_possible("unload-truck",14,((14,5), (14,7), (14,4), (14,4))).
action_possible("drive-truck",14,((14,2), (14,8), (14,4), (14,6))).
action_possible("load-truck",14,((14,5), (14,6), (14,8), (14,4))).
action_possible("unload-truck",14,((14,5), (14,7), (14,3), (14,3))).
action_possible("drive-truck",14,((14,4), (14,8), (14,3), (14,7))).
action_possible("disembark-truck",14,((14,8), (14,2), (14,6))).
action_possible("unload-truck",15,((15,5), (15,6), (15,4), (15,4))).
action_possible("drive-truck",15,((15,3), (15,8), (15,2), (15,6))).
action_possible("load-truck",15,((15,5), (15,7), (15,4), (15,4))).
action_possible("unload-truck",15,((15,5), (15,7), (15,2), (15,2))).
action_possible("walk",15,((15,8), (15,3), (15,0))).
action_possible("board-truck",15,((15,8), (15,7), (15,2))).
action_possible("drive-truck",15,((15,4), (15,8), (15,2), (15,6))).
action_possible("load-truck",15,((15,5), (15,7), (15,3), (15,3))).
action_possible("walk",15,((15,8), (15,4), (15,1))).
action_possible("disembark-truck",15,((15,8), (15,2), (15,7))).
action_possible("unload-truck",15,((15,5), (15,6), (15,3), (15,3))).
action_possible("board-truck",15,((15,8), (15,6), (15,2))).
action_possible("walk",15,((15,8), (15,3), (15,1))).
action_possible("board-truck",15,((15,8), (15,7), (15,3))).
action_possible("load-truck",15,((15,5), (15,6), (15,4), (15,4))).
action_possible("drive-truck",15,((15,3), (15,8), (15,2), (15,7))).
action_possible("drive-truck",15,((15,4), (15,8), (15,2), (15,7))).
action_possible("board-truck",15,((15,8), (15,7), (15,4))).
action_possible("load-truck",15,((15,5), (15,7), (15,2), (15,2))).
action_possible("walk",15,((15,8), (15,2), (15,0))).
action_possible("drive-truck",15,((15,2), (15,8), (15,4), (15,7))).
action_possible("unload-truck",15,((15,5), (15,7), (15,8), (15,2))).
action_possible("drive-truck",15,((15,2), (15,8), (15,3), (15,6))).
action_possible("disembark-truck",15,((15,8), (15,4), (15,6))).
action_possible("drive-truck",15,((15,3), (15,8), (15,4), (15,6))).
action_possible("walk",15,((15,8), (15,1), (15,3))).
action_possible("load-truck",15,((15,5), (15,6), (15,3), (15,3))).
action_possible("drive-truck",15,((15,2), (15,8), (15,3), (15,7))).
action_possible("unload-truck",15,((15,5), (15,6), (15,2), (15,2))).
action_possible("unload-truck",15,((15,5), (15,7), (15,8), (15,3))).
action_possible("unload-truck",15,((15,5), (15,6), (15,8), (15,2))).
action_possible("load-truck",15,((15,5), (15,7), (15,8), (15,2))).
action_possible("disembark-truck",15,((15,8), (15,4), (15,7))).
action_possible("drive-truck",15,((15,3), (15,8), (15,4), (15,7))).
action_possible("drive-truck",15,((15,4), (15,8), (15,3), (15,6))).
action_possible("unload-truck",15,((15,5), (15,7), (15,8), (15,4))).
action_possible("walk",15,((15,8), (15,1), (15,4))).
action_possible("walk",15,((15,8), (15,0), (15,2))).
action_possible("unload-truck",15,((15,5), (15,6), (15,8), (15,3))).
action_possible("board-truck",15,((15,8), (15,6), (15,3))).
action_possible("load-truck",15,((15,5), (15,7), (15,8), (15,3))).
action_possible("load-truck",15,((15,5), (15,6), (15,2), (15,2))).
action_possible("walk",15,((15,8), (15,0), (15,3))).
action_possible("unload-truck",15,((15,5), (15,6), (15,8), (15,4))).
action_possible("board-truck",15,((15,8), (15,6), (15,4))).
action_possible("load-truck",15,((15,5), (15,6), (15,8), (15,2))).
action_possible("disembark-truck",15,((15,8), (15,3), (15,6))).
action_possible("load-truck",15,((15,5), (15,7), (15,8), (15,4))).
action_possible("load-truck",15,((15,5), (15,6), (15,8), (15,3))).
action_possible("disembark-truck",15,((15,8), (15,3), (15,7))).
action_possible("unload-truck",15,((15,5), (15,7), (15,4), (15,4))).
action_possible("drive-truck",15,((15,2), (15,8), (15,4), (15,6))).
action_possible("unload-truck",15,((15,5), (15,7), (15,3), (15,3))).
action_possible("load-truck",15,((15,5), (15,6), (15,8), (15,4))).
action_possible("drive-truck",15,((15,4), (15,8), (15,3), (15,7))).
action_possible("disembark-truck",15,((15,8), (15,2), (15,6))).
action_possible("unload-truck",16,((16,5), (16,6), (16,4), (16,4))).
action_possible("drive-truck",16,((16,3), (16,8), (16,2), (16,6))).
action_possible("load-truck",16,((16,5), (16,7), (16,4), (16,4))).
action_possible("unload-truck",16,((16,5), (16,7), (16,2), (16,2))).
action_possible("walk",16,((16,8), (16,3), (16,0))).
action_possible("board-truck",16,((16,8), (16,7), (16,2))).
action_possible("drive-truck",16,((16,4), (16,8), (16,2), (16,6))).
action_possible("load-truck",16,((16,5), (16,7), (16,3), (16,3))).
action_possible("disembark-truck",16,((16,8), (16,2), (16,7))).
action_possible("walk",16,((16,8), (16,4), (16,1))).
action_possible("unload-truck",16,((16,5), (16,6), (16,3), (16,3))).
action_possible("board-truck",16,((16,8), (16,6), (16,2))).
action_possible("walk",16,((16,8), (16,3), (16,1))).
action_possible("board-truck",16,((16,8), (16,7), (16,3))).
action_possible("load-truck",16,((16,5), (16,6), (16,4), (16,4))).
action_possible("drive-truck",16,((16,3), (16,8), (16,2), (16,7))).
action_possible("drive-truck",16,((16,4), (16,8), (16,2), (16,7))).
action_possible("board-truck",16,((16,8), (16,7), (16,4))).
action_possible("load-truck",16,((16,5), (16,7), (16,2), (16,2))).
action_possible("unload-truck",16,((16,5), (16,7), (16,8), (16,2))).
action_possible("drive-truck",16,((16,2), (16,8), (16,4), (16,7))).
action_possible("walk",16,((16,8), (16,2), (16,0))).
action_possible("drive-truck",16,((16,2), (16,8), (16,3), (16,6))).
action_possible("disembark-truck",16,((16,8), (16,4), (16,6))).
action_possible("drive-truck",16,((16,3), (16,8), (16,4), (16,6))).
action_possible("walk",16,((16,8), (16,1), (16,3))).
action_possible("load-truck",16,((16,5), (16,6), (16,3), (16,3))).
action_possible("drive-truck",16,((16,2), (16,8), (16,3), (16,7))).
action_possible("unload-truck",16,((16,5), (16,6), (16,2), (16,2))).
action_possible("unload-truck",16,((16,5), (16,7), (16,8), (16,3))).
action_possible("unload-truck",16,((16,5), (16,6), (16,8), (16,2))).
action_possible("load-truck",16,((16,5), (16,7), (16,8), (16,2))).
action_possible("disembark-truck",16,((16,8), (16,4), (16,7))).
action_possible("drive-truck",16,((16,3), (16,8), (16,4), (16,7))).
action_possible("drive-truck",16,((16,4), (16,8), (16,3), (16,6))).
action_possible("unload-truck",16,((16,5), (16,7), (16,8), (16,4))).
action_possible("walk",16,((16,8), (16,1), (16,4))).
action_possible("walk",16,((16,8), (16,0), (16,2))).
action_possible("unload-truck",16,((16,5), (16,6), (16,8), (16,3))).
action_possible("board-truck",16,((16,8), (16,6), (16,3))).
action_possible("load-truck",16,((16,5), (16,7), (16,8), (16,3))).
action_possible("load-truck",16,((16,5), (16,6), (16,2), (16,2))).
action_possible("walk",16,((16,8), (16,0), (16,3))).
action_possible("unload-truck",16,((16,5), (16,6), (16,8), (16,4))).
action_possible("board-truck",16,((16,8), (16,6), (16,4))).
action_possible("load-truck",16,((16,5), (16,6), (16,8), (16,2))).
action_possible("disembark-truck",16,((16,8), (16,3), (16,6))).
action_possible("load-truck",16,((16,5), (16,7), (16,8), (16,4))).
action_possible("load-truck",16,((16,5), (16,6), (16,8), (16,3))).
action_possible("disembark-truck",16,((16,8), (16,3), (16,7))).
action_possible("unload-truck",16,((16,5), (16,7), (16,4), (16,4))).
action_possible("drive-truck",16,((16,2), (16,8), (16,4), (16,6))).
action_possible("unload-truck",16,((16,5), (16,7), (16,3), (16,3))).
action_possible("load-truck",16,((16,5), (16,6), (16,8), (16,4))).
action_possible("drive-truck",16,((16,4), (16,8), (16,3), (16,7))).
action_possible("disembark-truck",16,((16,8), (16,2), (16,6))).
action_possible("unload-truck",17,((17,5), (17,6), (17,4), (17,4))).
action_possible("drive-truck",17,((17,3), (17,8), (17,2), (17,6))).
action_possible("load-truck",17,((17,5), (17,7), (17,4), (17,4))).
action_possible("unload-truck",17,((17,5), (17,7), (17,2), (17,2))).
action_possible("walk",17,((17,8), (17,3), (17,0))).
action_possible("board-truck",17,((17,8), (17,7), (17,2))).
action_possible("drive-truck",17,((17,4), (17,8), (17,2), (17,6))).
action_possible("load-truck",17,((17,5), (17,7), (17,3), (17,3))).
action_possible("unload-truck",17,((17,5), (17,6), (17,3), (17,3))).
action_possible("walk",17,((17,8), (17,4), (17,1))).
action_possible("disembark-truck",17,((17,8), (17,2), (17,7))).
action_possible("board-truck",17,((17,8), (17,6), (17,2))).
action_possible("walk",17,((17,8), (17,3), (17,1))).
action_possible("board-truck",17,((17,8), (17,7), (17,3))).
action_possible("load-truck",17,((17,5), (17,6), (17,4), (17,4))).
action_possible("drive-truck",17,((17,3), (17,8), (17,2), (17,7))).
action_possible("drive-truck",17,((17,4), (17,8), (17,2), (17,7))).
action_possible("drive-truck",17,((17,2), (17,8), (17,3), (17,6))).
action_possible("load-truck",17,((17,5), (17,7), (17,2), (17,2))).
action_possible("walk",17,((17,8), (17,2), (17,0))).
action_possible("drive-truck",17,((17,2), (17,8), (17,4), (17,7))).
action_possible("unload-truck",17,((17,5), (17,7), (17,8), (17,2))).
action_possible("board-truck",17,((17,8), (17,7), (17,4))).
action_possible("disembark-truck",17,((17,8), (17,4), (17,6))).
action_possible("drive-truck",17,((17,3), (17,8), (17,4), (17,6))).
action_possible("walk",17,((17,8), (17,1), (17,3))).
action_possible("load-truck",17,((17,5), (17,6), (17,3), (17,3))).
action_possible("drive-truck",17,((17,2), (17,8), (17,3), (17,7))).
action_possible("unload-truck",17,((17,5), (17,6), (17,2), (17,2))).
action_possible("unload-truck",17,((17,5), (17,7), (17,8), (17,3))).
action_possible("unload-truck",17,((17,5), (17,6), (17,8), (17,2))).
action_possible("load-truck",17,((17,5), (17,7), (17,8), (17,2))).
action_possible("drive-truck",17,((17,4), (17,8), (17,3), (17,6))).
action_possible("drive-truck",17,((17,3), (17,8), (17,4), (17,7))).
action_possible("disembark-truck",17,((17,8), (17,4), (17,7))).
action_possible("unload-truck",17,((17,5), (17,7), (17,8), (17,4))).
action_possible("walk",17,((17,8), (17,1), (17,4))).
action_possible("walk",17,((17,8), (17,0), (17,2))).
action_possible("unload-truck",17,((17,5), (17,6), (17,8), (17,3))).
action_possible("board-truck",17,((17,8), (17,6), (17,3))).
action_possible("load-truck",17,((17,5), (17,7), (17,8), (17,3))).
action_possible("load-truck",17,((17,5), (17,6), (17,2), (17,2))).
action_possible("walk",17,((17,8), (17,0), (17,3))).
action_possible("unload-truck",17,((17,5), (17,6), (17,8), (17,4))).
action_possible("board-truck",17,((17,8), (17,6), (17,4))).
action_possible("load-truck",17,((17,5), (17,6), (17,8), (17,2))).
action_possible("disembark-truck",17,((17,8), (17,3), (17,6))).
action_possible("load-truck",17,((17,5), (17,7), (17,8), (17,4))).
action_possible("load-truck",17,((17,5), (17,6), (17,8), (17,3))).
action_possible("disembark-truck",17,((17,8), (17,3), (17,7))).
action_possible("unload-truck",17,((17,5), (17,7), (17,4), (17,4))).
action_possible("drive-truck",17,((17,2), (17,8), (17,4), (17,6))).
action_possible("load-truck",17,((17,5), (17,6), (17,8), (17,4))).
action_possible("unload-truck",17,((17,5), (17,7), (17,3), (17,3))).
action_possible("drive-truck",17,((17,4), (17,8), (17,3), (17,7))).
action_possible("disembark-truck",17,((17,8), (17,2), (17,6))).
