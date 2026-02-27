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
objects((0,1)).
obj_type(0,(0,1)).
objects((0,4)).
obj_type(0,(0,4)).
objects((0,0)).
obj_type(0,(0,0)).
objects((0,2)).
obj_type(0,(0,2)).
objects((0,3)).
obj_type(0,(0,3)).
objects((0,5)).
obj_type(0,(0,5)).
objects((1,2)).
obj_type(0,(1,2)).
objects((1,0)).
obj_type(0,(1,0)).
objects((1,3)).
obj_type(0,(1,3)).
objects((1,1)).
obj_type(0,(1,1)).
objects((1,5)).
obj_type(0,(1,5)).
objects((2,0)).
obj_type(0,(2,0)).
objects((2,3)).
obj_type(0,(2,3)).
objects((2,5)).
obj_type(0,(2,5)).
objects((2,1)).
obj_type(0,(2,1)).
objects((2,4)).
obj_type(0,(2,4)).
objects((2,2)).
obj_type(0,(2,2)).
objects((3,4)).
obj_type(0,(3,4)).
objects((3,2)).
obj_type(0,(3,2)).
objects((3,0)).
obj_type(0,(3,0)).
objects((3,5)).
obj_type(0,(3,5)).
objects((3,3)).
obj_type(0,(3,3)).
objects((4,0)).
obj_type(0,(4,0)).
objects((4,1)).
obj_type(0,(4,1)).
objects((4,2)).
obj_type(0,(4,2)).
objects((4,5)).
obj_type(0,(4,5)).
objects((4,3)).
obj_type(0,(4,3)).
objects((5,1)).
obj_type(0,(5,1)).
objects((5,4)).
obj_type(0,(5,4)).
objects((5,0)).
obj_type(0,(5,0)).
objects((5,5)).
obj_type(0,(5,5)).
objects((5,2)).
obj_type(0,(5,2)).
objects((5,3)).
obj_type(0,(5,3)).
types(0).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
action_arity("stack",2).
action_type_list("stack",(Type0, Type1)) :- action_arg_type(Type0,("stack",0)), action_arg_type(Type1,("stack",1)).
action_candidate("stack",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("stack",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arity("newtower",2).
action_type_list("newtower",(Type0, Type1)) :- action_arg_type(Type0,("newtower",0)), action_arg_type(Type1,("newtower",1)).
action_candidate("newtower",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("newtower",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arity("move",3).
action_type_list("move",(Type0, Type1, Type2)) :- action_arg_type(Type0,("move",0)), action_arg_type(Type1,("move",1)), action_arg_type(Type2,("move",2)).
action_candidate("move",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("move",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arg_type(0,("stack",0)).
action_arg_type(0,("stack",1)).
action_arg_type(0,("newtower",0)).
action_arg_type(0,("move",0)).
action_arg_type(0,("move",1)).
action_arg_type(0,("move",2)).
action_arg_type(0,("newtower",1)).
action_possible("stack",0,((0,1), (0,4))).
action_possible("stack",0,((0,0), (0,2))).
action_possible("move",0,((0,0), (0,2), (0,3))).
action_possible("move",0,((0,2), (0,4), (0,0))).
action_possible("move",0,((0,0), (0,1), (0,3))).
action_possible("move",0,((0,0), (0,2), (0,4))).
action_possible("move",0,((0,1), (0,4), (0,2))).
action_possible("move",0,((0,2), (0,0), (0,4))).
action_possible("stack",0,((0,1), (0,0))).
action_possible("newtower",0,((0,1), (0,3))).
action_possible("move",0,((0,0), (0,5), (0,4))).
action_possible("move",0,((0,2), (0,3), (0,4))).
action_possible("move",0,((0,1), (0,3), (0,0))).
action_possible("move",0,((0,1), (0,2), (0,4))).
action_possible("stack",0,((0,0), (0,5))).
action_possible("newtower",0,((0,0), (0,2))).
action_possible("move",0,((0,0), (0,3), (0,2))).
action_possible("move",0,((0,1), (0,0), (0,2))).
action_possible("move",0,((0,1), (0,5), (0,4))).
action_possible("move",0,((0,2), (0,3), (0,0))).
action_possible("newtower",0,((0,0), (0,3))).
action_possible("stack",0,((0,2), (0,3))).
action_possible("newtower",0,((0,1), (0,5))).
action_possible("move",0,((0,0), (0,1), (0,4))).
action_possible("move",0,((0,1), (0,2), (0,0))).
action_possible("stack",0,((0,0), (0,1))).
action_possible("move",0,((0,1), (0,3), (0,2))).
action_possible("newtower",0,((0,0), (0,4))).
action_possible("move",0,((0,1), (0,4), (0,3))).
action_possible("newtower",0,((0,2), (0,1))).
action_possible("move",0,((0,1), (0,5), (0,0))).
action_possible("move",0,((0,2), (0,4), (0,3))).
action_possible("move",0,((0,1), (0,4), (0,5))).
action_possible("stack",0,((0,1), (0,3))).
action_possible("move",0,((0,0), (0,3), (0,4))).
action_possible("move",0,((0,2), (0,1), (0,4))).
action_possible("newtower",0,((0,2), (0,4))).
action_possible("move",0,((0,0), (0,3), (0,5))).
action_possible("move",0,((0,0), (0,1), (0,2))).
action_possible("move",0,((0,2), (0,0), (0,3))).
action_possible("move",0,((0,1), (0,0), (0,4))).
action_possible("move",0,((0,1), (0,5), (0,3))).
action_possible("move",0,((0,0), (0,4), (0,2))).
action_possible("move",0,((0,1), (0,4), (0,0))).
action_possible("move",0,((0,0), (0,5), (0,3))).
action_possible("stack",0,((0,0), (0,3))).
action_possible("move",0,((0,1), (0,0), (0,5))).
action_possible("move",0,((0,1), (0,3), (0,4))).
action_possible("stack",0,((0,1), (0,5))).
action_possible("newtower",0,((0,2), (0,0))).
action_possible("move",0,((0,2), (0,1), (0,0))).
action_possible("move",0,((0,0), (0,4), (0,3))).
action_possible("move",0,((0,0), (0,3), (0,1))).
action_possible("move",0,((0,1), (0,2), (0,3))).
action_possible("stack",0,((0,0), (0,4))).
action_possible("move",0,((0,1), (0,3), (0,5))).
action_possible("stack",0,((0,2), (0,1))).
action_possible("move",0,((0,0), (0,2), (0,5))).
action_possible("newtower",0,((0,1), (0,4))).
action_possible("stack",0,((0,1), (0,2))).
action_possible("move",0,((0,1), (0,2), (0,5))).
action_possible("move",0,((0,2), (0,4), (0,1))).
action_possible("newtower",0,((0,1), (0,0))).
action_possible("move",0,((0,0), (0,5), (0,1))).
action_possible("stack",0,((0,2), (0,4))).
action_possible("move",0,((0,0), (0,1), (0,5))).
action_possible("move",0,((0,2), (0,3), (0,1))).
action_possible("move",0,((0,0), (0,5), (0,2))).
action_possible("newtower",0,((0,0), (0,5))).
action_possible("move",0,((0,0), (0,4), (0,5))).
action_possible("move",0,((0,0), (0,2), (0,1))).
action_possible("move",0,((0,2), (0,0), (0,1))).
action_possible("stack",0,((0,2), (0,0))).
action_possible("newtower",0,((0,1), (0,2))).
action_possible("move",0,((0,2), (0,1), (0,3))).
action_possible("newtower",0,((0,2), (0,3))).
action_possible("move",0,((0,1), (0,5), (0,2))).
action_possible("newtower",0,((0,0), (0,1))).
action_possible("move",0,((0,1), (0,0), (0,3))).
action_possible("move",0,((0,0), (0,4), (0,1))).
action_possible("move",1,((1,2), (1,0), (1,3))).
action_possible("newtower",1,((1,3), (1,1))).
action_possible("stack",1,((1,5), (1,1))).
action_possible("move",1,((1,1), (1,5), (1,3))).
action_possible("move",1,((1,2), (1,1), (1,5))).
action_possible("move",1,((1,5), (1,3), (1,1))).
action_possible("newtower",1,((1,2), (1,5))).
action_possible("newtower",1,((1,3), (1,2))).
action_possible("move",1,((1,2), (1,1), (1,0))).
action_possible("stack",1,((1,1), (1,5))).
action_possible("newtower",1,((1,2), (1,0))).
action_possible("move",1,((1,5), (1,3), (1,2))).
action_possible("move",1,((1,3), (1,5), (1,2))).
action_possible("move",1,((1,1), (1,2), (1,3))).
action_possible("newtower",1,((1,1), (1,3))).
action_possible("move",1,((1,1), (1,3), (1,5))).
action_possible("stack",1,((1,2), (1,1))).
action_possible("move",1,((1,5), (1,2), (1,1))).
action_possible("newtower",1,((1,5), (1,1))).
action_possible("move",1,((1,2), (1,3), (1,5))).
action_possible("stack",1,((1,1), (1,2))).
action_possible("stack",1,((1,5), (1,2))).
action_possible("move",1,((1,2), (1,3), (1,0))).
action_possible("stack",1,((1,3), (1,5))).
action_possible("move",1,((1,3), (1,1), (1,2))).
action_possible("stack",1,((1,2), (1,3))).
action_possible("move",1,((1,1), (1,2), (1,5))).
action_possible("newtower",1,((1,1), (1,5))).
action_possible("move",1,((1,2), (1,5), (1,3))).
action_possible("move",1,((1,1), (1,3), (1,2))).
action_possible("move",1,((1,2), (1,0), (1,5))).
action_possible("stack",1,((1,5), (1,3))).
action_possible("newtower",1,((1,2), (1,1))).
action_possible("move",1,((1,2), (1,3), (1,1))).
action_possible("stack",1,((1,3), (1,1))).
action_possible("stack",1,((1,2), (1,5))).
action_possible("move",1,((1,3), (1,5), (1,1))).
action_possible("move",1,((1,3), (1,2), (1,5))).
action_possible("move",1,((1,2), (1,5), (1,0))).
action_possible("stack",1,((1,3), (1,2))).
action_possible("move",1,((1,2), (1,0), (1,1))).
action_possible("stack",1,((1,2), (1,0))).
action_possible("newtower",1,((1,3), (1,5))).
action_possible("newtower",1,((1,1), (1,2))).
action_possible("move",1,((1,3), (1,1), (1,5))).
action_possible("newtower",1,((1,2), (1,3))).
action_possible("move",1,((1,2), (1,1), (1,3))).
action_possible("newtower",1,((1,5), (1,2))).
action_possible("move",1,((1,5), (1,1), (1,2))).
action_possible("stack",1,((1,1), (1,3))).
action_possible("move",1,((1,5), (1,2), (1,3))).
action_possible("move",1,((1,1), (1,5), (1,2))).
action_possible("move",1,((1,5), (1,1), (1,3))).
action_possible("move",1,((1,2), (1,5), (1,1))).
action_possible("move",1,((1,3), (1,2), (1,1))).
action_possible("newtower",1,((1,5), (1,3))).
action_possible("move",2,((2,0), (2,3), (2,5))).
action_possible("newtower",2,((2,3), (2,1))).
action_possible("move",2,((2,4), (2,5), (2,0))).
action_possible("stack",2,((2,4), (2,5))).
action_possible("move",2,((2,0), (2,5), (2,3))).
action_possible("newtower",2,((2,5), (2,4))).
action_possible("move",2,((2,0), (2,1), (2,3))).
action_possible("stack",2,((2,0), (2,3))).
action_possible("stack",2,((2,4), (2,0))).
action_possible("move",2,((2,0), (2,4), (2,3))).
action_possible("move",2,((2,0), (2,3), (2,1))).
action_possible("move",2,((2,3), (2,4), (2,0))).
action_possible("newtower",2,((2,4), (2,3))).
action_possible("stack",2,((2,0), (2,4))).
action_possible("move",2,((2,0), (2,5), (2,4))).
action_possible("newtower",2,((2,5), (2,0))).
action_possible("stack",2,((2,3), (2,4))).
action_possible("move",2,((2,4), (2,0), (2,3))).
action_possible("move",2,((2,3), (2,4), (2,1))).
action_possible("stack",2,((2,5), (2,0))).
action_possible("stack",2,((2,0), (2,5))).
action_possible("move",2,((2,0), (2,3), (2,4))).
action_possible("stack",2,((2,1), (2,2))).
action_possible("newtower",2,((2,4), (2,5))).
action_possible("move",2,((2,4), (2,5), (2,3))).
action_possible("newtower",2,((2,4), (2,0))).
action_possible("newtower",2,((2,0), (2,3))).
action_possible("stack",2,((2,3), (2,0))).
action_possible("move",2,((2,0), (2,1), (2,4))).
action_possible("stack",2,((2,0), (2,1))).
action_possible("move",2,((2,5), (2,4), (2,0))).
action_possible("move",2,((2,3), (2,0), (2,1))).
action_possible("move",2,((2,4), (2,0), (2,5))).
action_possible("newtower",2,((2,0), (2,4))).
action_possible("move",2,((2,4), (2,3), (2,5))).
action_possible("stack",2,((2,3), (2,1))).
action_possible("move",2,((2,5), (2,0), (2,4))).
action_possible("newtower",2,((2,0), (2,5))).
action_possible("newtower",2,((2,3), (2,4))).
action_possible("stack",2,((2,5), (2,4))).
action_possible("move",2,((2,3), (2,1), (2,4))).
action_possible("move",2,((2,0), (2,4), (2,5))).
action_possible("move",2,((2,4), (2,3), (2,0))).
action_possible("stack",2,((2,4), (2,3))).
action_possible("newtower",2,((2,1), (2,2))).
action_possible("newtower",2,((2,0), (2,1))).
action_possible("newtower",2,((2,3), (2,0))).
action_possible("move",2,((2,3), (2,1), (2,0))).
action_possible("move",2,((2,0), (2,4), (2,1))).
action_possible("move",2,((2,3), (2,0), (2,4))).
action_possible("move",3,((3,4), (3,2), (3,0))).
action_possible("move",3,((3,5), (3,2), (3,4))).
action_possible("move",3,((3,0), (3,2), (3,3))).
action_possible("stack",3,((3,4), (3,5))).
action_possible("move",3,((3,2), (3,4), (3,0))).
action_possible("move",3,((3,4), (3,5), (3,0))).
action_possible("newtower",3,((3,2), (3,5))).
action_possible("move",3,((3,5), (3,0), (3,2))).
action_possible("move",3,((3,0), (3,2), (3,4))).
action_possible("move",3,((3,2), (3,0), (3,4))).
action_possible("move",3,((3,5), (3,3), (3,2))).
action_possible("newtower",3,((3,4), (3,3))).
action_possible("move",3,((3,5), (3,2), (3,0))).
action_possible("move",3,((3,0), (3,5), (3,4))).
action_possible("move",3,((3,2), (3,3), (3,4))).
action_possible("stack",3,((3,0), (3,5))).
action_possible("move",3,((3,4), (3,5), (3,2))).
action_possible("newtower",3,((3,0), (3,2))).
action_possible("move",3,((3,0), (3,3), (3,2))).
action_possible("move",3,((3,4), (3,5), (3,3))).
action_possible("move",3,((3,2), (3,3), (3,0))).
action_possible("newtower",3,((3,0), (3,3))).
action_possible("newtower",3,((3,4), (3,0))).
action_possible("stack",3,((3,2), (3,3))).
action_possible("move",3,((3,5), (3,4), (3,0))).
action_possible("newtower",3,((3,0), (3,4))).
action_possible("stack",3,((3,5), (3,3))).
action_possible("move",3,((3,4), (3,3), (3,5))).
action_possible("move",3,((3,4), (3,2), (3,3))).
action_possible("move",3,((3,5), (3,0), (3,4))).
action_possible("move",3,((3,2), (3,4), (3,3))).
action_possible("move",3,((3,4), (3,3), (3,0))).
action_possible("move",3,((3,5), (3,2), (3,3))).
action_possible("move",3,((3,0), (3,3), (3,4))).
action_possible("move",3,((3,4), (3,2), (3,5))).
action_possible("newtower",3,((3,2), (3,4))).
action_possible("move",3,((3,5), (3,3), (3,0))).
action_possible("move",3,((3,0), (3,3), (3,5))).
action_possible("move",3,((3,2), (3,0), (3,3))).
action_possible("newtower",3,((3,4), (3,2))).
action_possible("move",3,((3,0), (3,4), (3,2))).
action_possible("newtower",3,((3,5), (3,4))).
action_possible("move",3,((3,0), (3,5), (3,3))).
action_possible("stack",3,((3,0), (3,3))).
action_possible("stack",3,((3,4), (3,0))).
action_possible("newtower",3,((3,2), (3,0))).
action_possible("move",3,((3,0), (3,4), (3,3))).
action_possible("stack",3,((3,0), (3,4))).
action_possible("move",3,((3,5), (3,4), (3,3))).
action_possible("move",3,((3,0), (3,2), (3,5))).
action_possible("newtower",3,((3,5), (3,0))).
action_possible("move",3,((3,4), (3,0), (3,3))).
action_possible("move",3,((3,2), (3,4), (3,5))).
action_possible("move",3,((3,2), (3,3), (3,5))).
action_possible("newtower",3,((3,4), (3,5))).
action_possible("stack",3,((3,5), (3,2))).
action_possible("move",3,((3,2), (3,5), (3,3))).
action_possible("move",3,((3,5), (3,0), (3,3))).
action_possible("move",3,((3,2), (3,0), (3,5))).
action_possible("move",3,((3,4), (3,0), (3,5))).
action_possible("stack",3,((3,2), (3,4))).
action_possible("move",3,((3,2), (3,5), (3,4))).
action_possible("move",3,((3,0), (3,5), (3,2))).
action_possible("stack",3,((3,4), (3,2))).
action_possible("newtower",3,((3,0), (3,5))).
action_possible("stack",3,((3,2), (3,5))).
action_possible("stack",3,((3,5), (3,4))).
action_possible("move",3,((3,0), (3,4), (3,5))).
action_possible("move",3,((3,5), (3,3), (3,4))).
action_possible("move",3,((3,2), (3,5), (3,0))).
action_possible("stack",3,((3,4), (3,3))).
action_possible("stack",3,((3,2), (3,0))).
action_possible("newtower",3,((3,2), (3,3))).
action_possible("move",3,((3,4), (3,0), (3,2))).
action_possible("newtower",3,((3,5), (3,2))).
action_possible("move",3,((3,5), (3,4), (3,2))).
action_possible("stack",3,((3,5), (3,0))).
action_possible("stack",3,((3,0), (3,2))).
action_possible("newtower",3,((3,5), (3,3))).
action_possible("move",3,((3,4), (3,3), (3,2))).
action_possible("move",4,((4,0), (4,1), (4,2))).
action_possible("move",4,((4,5), (4,0), (4,1))).
action_possible("move",4,((4,2), (4,5), (4,1))).
action_possible("move",4,((4,2), (4,1), (4,5))).
action_possible("stack",4,((4,5), (4,1))).
action_possible("move",4,((4,5), (4,3), (4,1))).
action_possible("newtower",4,((4,2), (4,5))).
action_possible("move",4,((4,5), (4,0), (4,2))).
action_possible("move",4,((4,1), (4,0), (4,5))).
action_possible("move",4,((4,2), (4,1), (4,0))).
action_possible("stack",4,((4,1), (4,5))).
action_possible("newtower",4,((4,2), (4,0))).
action_possible("move",4,((4,5), (4,3), (4,2))).
action_possible("stack",4,((4,1), (4,0))).
action_possible("move",4,((4,5), (4,2), (4,0))).
action_possible("move",4,((4,5), (4,1), (4,0))).
action_possible("stack",4,((4,2), (4,1))).
action_possible("move",4,((4,0), (4,2), (4,5))).
action_possible("newtower",4,((4,5), (4,0))).
action_possible("stack",4,((4,0), (4,5))).
action_possible("newtower",4,((4,0), (4,2))).
action_possible("newtower",4,((4,5), (4,1))).
action_possible("newtower",4,((4,5), (4,3))).
action_possible("stack",4,((4,1), (4,2))).
action_possible("stack",4,((4,5), (4,2))).
action_possible("move",4,((4,1), (4,0), (4,2))).
action_possible("move",4,((4,1), (4,2), (4,5))).
action_possible("newtower",4,((4,1), (4,5))).
action_possible("move",4,((4,5), (4,0), (4,3))).
action_possible("move",4,((4,1), (4,2), (4,0))).
action_possible("stack",4,((4,0), (4,1))).
action_possible("newtower",4,((4,1), (4,0))).
action_possible("move",4,((4,0), (4,5), (4,1))).
action_possible("move",4,((4,2), (4,0), (4,5))).
action_possible("stack",4,((4,5), (4,3))).
action_possible("newtower",4,((4,2), (4,1))).
action_possible("move",4,((4,0), (4,1), (4,5))).
action_possible("move",4,((4,1), (4,5), (4,0))).
action_possible("move",4,((4,0), (4,5), (4,2))).
action_possible("newtower",4,((4,0), (4,5))).
action_possible("stack",4,((4,2), (4,5))).
action_possible("move",4,((4,2), (4,5), (4,0))).
action_possible("move",4,((4,2), (4,0), (4,1))).
action_possible("move",4,((4,0), (4,2), (4,1))).
action_possible("stack",4,((4,2), (4,0))).
action_possible("newtower",4,((4,1), (4,2))).
action_possible("newtower",4,((4,5), (4,2))).
action_possible("move",4,((4,5), (4,2), (4,3))).
action_possible("move",4,((4,1), (4,5), (4,2))).
action_possible("newtower",4,((4,0), (4,1))).
action_possible("move",4,((4,5), (4,1), (4,3))).
action_possible("stack",4,((4,5), (4,0))).
action_possible("stack",4,((4,0), (4,2))).
action_possible("move",4,((4,5), (4,3), (4,0))).
action_possible("stack",5,((5,1), (5,4))).
action_possible("move",5,((5,1), (5,0), (5,4))).
action_possible("move",5,((5,4), (5,5), (5,0))).
action_possible("stack",5,((5,4), (5,5))).
action_possible("newtower",5,((5,5), (5,4))).
action_possible("stack",5,((5,4), (5,0))).
action_possible("move",5,((5,1), (5,4), (5,2))).
action_possible("stack",5,((5,1), (5,0))).
action_possible("stack",5,((5,0), (5,4))).
action_possible("move",5,((5,4), (5,5), (5,1))).
action_possible("move",5,((5,0), (5,5), (5,4))).
action_possible("move",5,((5,5), (5,4), (5,3))).
action_possible("stack",5,((5,4), (5,1))).
action_possible("move",5,((5,4), (5,1), (5,5))).
action_possible("newtower",5,((5,5), (5,0))).
action_possible("move",5,((5,1), (5,2), (5,4))).
action_possible("stack",5,((5,0), (5,5))).
action_possible("newtower",5,((5,1), (5,4))).
action_possible("move",5,((5,4), (5,1), (5,0))).
action_possible("newtower",5,((5,5), (5,3))).
action_possible("stack",5,((5,1), (5,2))).
action_possible("newtower",5,((5,4), (5,5))).
action_possible("move",5,((5,1), (5,0), (5,2))).
action_possible("newtower",5,((5,4), (5,0))).
action_possible("move",5,((5,0), (5,1), (5,4))).
action_possible("move",5,((5,5), (5,0), (5,3))).
action_possible("move",5,((5,1), (5,2), (5,0))).
action_possible("stack",5,((5,0), (5,1))).
action_possible("newtower",5,((5,1), (5,0))).
action_possible("move",5,((5,0), (5,5), (5,1))).
action_possible("move",5,((5,5), (5,4), (5,0))).
action_possible("newtower",5,((5,0), (5,4))).
action_possible("move",5,((5,4), (5,0), (5,5))).
action_possible("stack",5,((5,5), (5,3))).
action_possible("move",5,((5,0), (5,1), (5,5))).
action_possible("newtower",5,((5,4), (5,1))).
action_possible("move",5,((5,5), (5,0), (5,4))).
action_possible("newtower",5,((5,0), (5,5))).
action_possible("stack",5,((5,5), (5,4))).
action_possible("move",5,((5,0), (5,4), (5,5))).
action_possible("move",5,((5,5), (5,3), (5,4))).
action_possible("move",5,((5,4), (5,0), (5,1))).
action_possible("newtower",5,((5,1), (5,2))).
action_possible("newtower",5,((5,0), (5,1))).
action_possible("move",5,((5,1), (5,4), (5,0))).
action_possible("stack",5,((5,5), (5,0))).
action_possible("move",5,((5,0), (5,4), (5,1))).
action_possible("move",5,((5,5), (5,3), (5,0))).
