max_arity(3).
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
objects((0,8)).
obj_type(0,(0,8)).
objects((0,5)).
obj_type(0,(0,5)).
objects((0,7)).
obj_type(0,(0,7)).
objects((0,9)).
obj_type(0,(0,9)).
objects((0,10)).
obj_type(0,(0,10)).
objects((0,6)).
obj_type(0,(0,6)).
objects((1,8)).
obj_type(0,(1,8)).
objects((1,5)).
obj_type(0,(1,5)).
objects((1,7)).
obj_type(0,(1,7)).
objects((1,6)).
obj_type(0,(1,6)).
objects((1,4)).
obj_type(0,(1,4)).
objects((1,10)).
obj_type(0,(1,10)).
objects((1,9)).
obj_type(0,(1,9)).
objects((2,8)).
obj_type(0,(2,8)).
objects((2,5)).
obj_type(0,(2,5)).
objects((2,7)).
obj_type(0,(2,7)).
objects((2,9)).
obj_type(0,(2,9)).
objects((2,10)).
obj_type(0,(2,10)).
objects((2,6)).
obj_type(0,(2,6)).
objects((3,8)).
obj_type(0,(3,8)).
objects((3,5)).
obj_type(0,(3,5)).
objects((3,7)).
obj_type(0,(3,7)).
objects((3,9)).
obj_type(0,(3,9)).
objects((3,10)).
obj_type(0,(3,10)).
objects((3,6)).
obj_type(0,(3,6)).
objects((4,8)).
obj_type(0,(4,8)).
objects((4,5)).
obj_type(0,(4,5)).
objects((4,7)).
obj_type(0,(4,7)).
objects((4,10)).
obj_type(0,(4,10)).
objects((4,9)).
obj_type(0,(4,9)).
objects((4,6)).
obj_type(0,(4,6)).
objects((5,8)).
obj_type(0,(5,8)).
objects((5,5)).
obj_type(0,(5,5)).
objects((5,7)).
obj_type(0,(5,7)).
objects((5,10)).
obj_type(0,(5,10)).
objects((5,9)).
obj_type(0,(5,9)).
objects((5,4)).
obj_type(0,(5,4)).
objects((5,6)).
obj_type(0,(5,6)).
types(0).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
action_arity("move",3).
action_type_list("move",(Type0, Type1, Type2)) :- action_arg_type(Type0,("move",0)), action_arg_type(Type1,("move",1)), action_arg_type(Type2,("move",2)).
action_candidate("move",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("move",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arg_type(0,("move",0)).
action_arg_type(0,("move",1)).
action_arg_type(0,("move",2)).
action_possible("move",0,((0,8), (0,5), (0,7))).
action_possible("move",0,((0,7), (0,9), (0,10))).
action_possible("move",0,((0,7), (0,10), (0,5))).
action_possible("move",0,((0,8), (0,7), (0,9))).
action_possible("move",0,((0,8), (0,9), (0,6))).
action_possible("move",0,((0,8), (0,6), (0,10))).
action_possible("move",0,((0,7), (0,6), (0,9))).
action_possible("move",0,((0,8), (0,10), (0,9))).
action_possible("move",0,((0,6), (0,9), (0,5))).
action_possible("move",0,((0,8), (0,9), (0,7))).
action_possible("move",0,((0,7), (0,10), (0,6))).
action_possible("move",0,((0,8), (0,10), (0,6))).
action_possible("move",0,((0,8), (0,6), (0,7))).
action_possible("move",0,((0,8), (0,7), (0,6))).
action_possible("move",0,((0,8), (0,6), (0,5))).
action_possible("move",0,((0,7), (0,9), (0,6))).
action_possible("move",0,((0,7), (0,6), (0,10))).
action_possible("move",0,((0,8), (0,7), (0,5))).
action_possible("move",0,((0,6), (0,5), (0,9))).
action_possible("move",0,((0,7), (0,10), (0,9))).
action_possible("move",0,((0,7), (0,9), (0,5))).
action_possible("move",0,((0,8), (0,5), (0,6))).
action_possible("move",0,((0,7), (0,5), (0,10))).
action_possible("move",0,((0,8), (0,9), (0,10))).
action_possible("move",0,((0,7), (0,5), (0,9))).
action_possible("move",0,((0,6), (0,5), (0,10))).
action_possible("move",0,((0,6), (0,10), (0,5))).
action_possible("move",0,((0,8), (0,10), (0,7))).
action_possible("move",0,((0,8), (0,6), (0,9))).
action_possible("move",0,((0,8), (0,7), (0,10))).
action_possible("move",1,((1,8), (1,5), (1,7))).
action_possible("move",1,((1,8), (1,6), (1,4))).
action_possible("move",1,((1,8), (1,4), (1,5))).
action_possible("move",1,((1,7), (1,10), (1,5))).
action_possible("move",1,((1,7), (1,5), (1,6))).
action_possible("move",1,((1,8), (1,7), (1,9))).
action_possible("move",1,((1,8), (1,6), (1,10))).
action_possible("move",1,((1,8), (1,7), (1,4))).
action_possible("move",1,((1,8), (1,4), (1,6))).
action_possible("move",1,((1,7), (1,6), (1,9))).
action_possible("move",1,((1,6), (1,4), (1,10))).
action_possible("move",1,((1,7), (1,4), (1,5))).
action_possible("move",1,((1,8), (1,6), (1,5))).
action_possible("move",1,((1,8), (1,6), (1,7))).
action_possible("move",1,((1,8), (1,7), (1,6))).
action_possible("move",1,((1,5), (1,9), (1,4))).
action_possible("move",1,((1,5), (1,4), (1,9))).
action_possible("move",1,((1,7), (1,6), (1,4))).
action_possible("move",1,((1,8), (1,7), (1,5))).
action_possible("move",1,((1,8), (1,4), (1,7))).
action_possible("move",1,((1,8), (1,10), (1,6))).
action_possible("move",1,((1,7), (1,9), (1,6))).
action_possible("move",1,((1,8), (1,5), (1,9))).
action_possible("move",1,((1,7), (1,4), (1,6))).
action_possible("move",1,((1,8), (1,5), (1,4))).
action_possible("move",1,((1,8), (1,5), (1,6))).
action_possible("move",1,((1,7), (1,6), (1,5))).
action_possible("move",1,((1,7), (1,5), (1,10))).
action_possible("move",1,((1,6), (1,5), (1,10))).
action_possible("move",1,((1,8), (1,9), (1,5))).
action_possible("move",1,((1,6), (1,10), (1,5))).
action_possible("move",1,((1,8), (1,10), (1,7))).
action_possible("move",1,((1,6), (1,10), (1,4))).
action_possible("move",1,((1,7), (1,5), (1,4))).
action_possible("move",1,((1,8), (1,9), (1,7))).
action_possible("move",1,((1,8), (1,7), (1,10))).
action_possible("move",2,((2,8), (2,5), (2,7))).
action_possible("move",2,((2,7), (2,9), (2,10))).
action_possible("move",2,((2,8), (2,7), (2,9))).
action_possible("move",2,((2,7), (2,5), (2,6))).
action_possible("move",2,((2,8), (2,9), (2,6))).
action_possible("move",2,((2,8), (2,6), (2,10))).
action_possible("move",2,((2,7), (2,6), (2,9))).
action_possible("move",2,((2,8), (2,10), (2,9))).
action_possible("move",2,((2,8), (2,9), (2,7))).
action_possible("move",2,((2,8), (2,6), (2,5))).
action_possible("move",2,((2,7), (2,10), (2,6))).
action_possible("move",2,((2,8), (2,6), (2,7))).
action_possible("move",2,((2,8), (2,7), (2,6))).
action_possible("move",2,((2,8), (2,5), (2,9))).
action_possible("move",2,((2,7), (2,9), (2,6))).
action_possible("move",2,((2,8), (2,7), (2,5))).
action_possible("move",2,((2,7), (2,6), (2,10))).
action_possible("move",2,((2,7), (2,10), (2,9))).
action_possible("move",2,((2,7), (2,9), (2,5))).
action_possible("move",2,((2,8), (2,5), (2,6))).
action_possible("move",2,((2,7), (2,6), (2,5))).
action_possible("move",2,((2,8), (2,9), (2,10))).
action_possible("move",2,((2,7), (2,5), (2,9))).
action_possible("move",2,((2,6), (2,5), (2,10))).
action_possible("move",2,((2,6), (2,10), (2,5))).
action_possible("move",2,((2,8), (2,10), (2,7))).
action_possible("move",2,((2,8), (2,6), (2,9))).
action_possible("move",2,((2,8), (2,9), (2,5))).
action_possible("move",2,((2,8), (2,10), (2,6))).
action_possible("move",2,((2,8), (2,7), (2,10))).
action_possible("move",3,((3,8), (3,5), (3,7))).
action_possible("move",3,((3,7), (3,9), (3,10))).
action_possible("move",3,((3,8), (3,7), (3,9))).
action_possible("move",3,((3,7), (3,5), (3,6))).
action_possible("move",3,((3,8), (3,9), (3,6))).
action_possible("move",3,((3,8), (3,6), (3,10))).
action_possible("move",3,((3,7), (3,6), (3,9))).
action_possible("move",3,((3,8), (3,10), (3,9))).
action_possible("move",3,((3,8), (3,9), (3,7))).
action_possible("move",3,((3,8), (3,6), (3,5))).
action_possible("move",3,((3,7), (3,10), (3,6))).
action_possible("move",3,((3,8), (3,7), (3,6))).
action_possible("move",3,((3,8), (3,6), (3,7))).
action_possible("move",3,((3,8), (3,5), (3,9))).
action_possible("move",3,((3,7), (3,9), (3,6))).
action_possible("move",3,((3,8), (3,7), (3,5))).
action_possible("move",3,((3,7), (3,6), (3,10))).
action_possible("move",3,((3,7), (3,10), (3,9))).
action_possible("move",3,((3,7), (3,9), (3,5))).
action_possible("move",3,((3,8), (3,5), (3,6))).
action_possible("move",3,((3,7), (3,6), (3,5))).
action_possible("move",3,((3,8), (3,9), (3,10))).
action_possible("move",3,((3,7), (3,5), (3,9))).
action_possible("move",3,((3,6), (3,5), (3,10))).
action_possible("move",3,((3,6), (3,10), (3,5))).
action_possible("move",3,((3,8), (3,10), (3,7))).
action_possible("move",3,((3,8), (3,6), (3,9))).
action_possible("move",3,((3,8), (3,9), (3,5))).
action_possible("move",3,((3,8), (3,10), (3,6))).
action_possible("move",3,((3,8), (3,7), (3,10))).
action_possible("move",4,((4,8), (4,5), (4,7))).
action_possible("move",4,((4,7), (4,10), (4,5))).
action_possible("move",4,((4,8), (4,7), (4,9))).
action_possible("move",4,((4,7), (4,5), (4,6))).
action_possible("move",4,((4,8), (4,9), (4,6))).
action_possible("move",4,((4,8), (4,6), (4,10))).
action_possible("move",4,((4,6), (4,9), (4,10))).
action_possible("move",4,((4,8), (4,5), (4,10))).
action_possible("move",4,((4,7), (4,6), (4,9))).
action_possible("move",4,((4,8), (4,9), (4,7))).
action_possible("move",4,((4,8), (4,6), (4,5))).
action_possible("move",4,((4,8), (4,10), (4,6))).
action_possible("move",4,((4,8), (4,6), (4,7))).
action_possible("move",4,((4,8), (4,7), (4,6))).
action_possible("move",4,((4,6), (4,10), (4,9))).
action_possible("move",4,((4,8), (4,5), (4,9))).
action_possible("move",4,((4,7), (4,10), (4,6))).
action_possible("move",4,((4,8), (4,7), (4,5))).
action_possible("move",4,((4,7), (4,6), (4,10))).
action_possible("move",4,((4,7), (4,9), (4,6))).
action_possible("move",4,((4,7), (4,9), (4,5))).
action_possible("move",4,((4,7), (4,5), (4,10))).
action_possible("move",4,((4,7), (4,6), (4,5))).
action_possible("move",4,((4,8), (4,5), (4,6))).
action_possible("move",4,((4,8), (4,10), (4,5))).
action_possible("move",4,((4,7), (4,5), (4,9))).
action_possible("move",4,((4,8), (4,10), (4,7))).
action_possible("move",4,((4,8), (4,9), (4,5))).
action_possible("move",4,((4,8), (4,6), (4,9))).
action_possible("move",4,((4,8), (4,7), (4,10))).
action_possible("move",5,((5,8), (5,5), (5,7))).
action_possible("move",5,((5,7), (5,10), (5,5))).
action_possible("move",5,((5,8), (5,7), (5,9))).
action_possible("move",5,((5,8), (5,4), (5,5))).
action_possible("move",5,((5,7), (5,5), (5,6))).
action_possible("move",5,((5,8), (5,9), (5,6))).
action_possible("move",5,((5,8), (5,6), (5,10))).
action_possible("move",5,((5,5), (5,10), (5,4))).
action_possible("move",5,((5,8), (5,5), (5,10))).
action_possible("move",5,((5,6), (5,9), (5,10))).
action_possible("move",5,((5,8), (5,7), (5,4))).
action_possible("move",5,((5,6), (5,9), (5,5))).
action_possible("move",5,((5,8), (5,9), (5,7))).
action_possible("move",5,((5,7), (5,10), (5,6))).
action_possible("move",5,((5,8), (5,6), (5,5))).
action_possible("move",5,((5,8), (5,6), (5,7))).
action_possible("move",5,((5,8), (5,7), (5,6))).
action_possible("move",5,((5,6), (5,10), (5,9))).
action_possible("move",5,((5,7), (5,6), (5,4))).
action_possible("move",5,((5,8), (5,7), (5,5))).
action_possible("move",5,((5,7), (5,6), (5,10))).
action_possible("move",5,((5,8), (5,4), (5,7))).
action_possible("move",5,((5,6), (5,5), (5,9))).
action_possible("move",5,((5,7), (5,4), (5,6))).
action_possible("move",5,((5,7), (5,9), (5,5))).
action_possible("move",5,((5,8), (5,5), (5,4))).
action_possible("move",5,((5,7), (5,5), (5,10))).
action_possible("move",5,((5,7), (5,6), (5,5))).
action_possible("move",5,((5,8), (5,5), (5,6))).
action_possible("move",5,((5,5), (5,4), (5,10))).
action_possible("move",5,((5,8), (5,10), (5,5))).
action_possible("move",5,((5,7), (5,5), (5,9))).
action_possible("move",5,((5,8), (5,10), (5,7))).
action_possible("move",5,((5,8), (5,6), (5,9))).
action_possible("move",5,((5,8), (5,10), (5,6))).
action_possible("move",5,((5,8), (5,7), (5,10))).
