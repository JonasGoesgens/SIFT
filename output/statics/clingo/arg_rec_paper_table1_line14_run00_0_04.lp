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
objects((0,s_2_3)).
obj_type(0,(0,s_2_3)).
objects((0,s_1_3)).
obj_type(0,(0,s_1_3)).
objects((0,s_3_3)).
obj_type(0,(0,s_3_3)).
objects((0,s_3_1)).
obj_type(0,(0,s_3_1)).
objects((0,s_2_1)).
obj_type(0,(0,s_2_1)).
objects((0,s_3_4)).
obj_type(0,(0,s_3_4)).
objects((0,s_4_4)).
obj_type(0,(0,s_4_4)).
objects((0,s_4_3)).
obj_type(0,(0,s_4_3)).
objects((0,s_3_2)).
obj_type(0,(0,s_3_2)).
objects((0,s_2_2)).
obj_type(0,(0,s_2_2)).
objects((0,s_2_4)).
obj_type(0,(0,s_2_4)).
objects((0,s_1_1)).
obj_type(0,(0,s_1_1)).
objects((0,s_1_4)).
obj_type(0,(0,s_1_4)).
objects((0,s_1_2)).
obj_type(0,(0,s_1_2)).
objects((0,s_4_2)).
obj_type(0,(0,s_4_2)).
objects((0,s_4_1)).
obj_type(0,(0,s_4_1)).
objects((1,s_2_3)).
obj_type(0,(1,s_2_3)).
objects((1,s_1_3)).
obj_type(0,(1,s_1_3)).
objects((1,s_3_3)).
obj_type(0,(1,s_3_3)).
objects((1,s_3_1)).
obj_type(0,(1,s_3_1)).
objects((1,s_2_1)).
obj_type(0,(1,s_2_1)).
objects((1,s_3_4)).
obj_type(0,(1,s_3_4)).
objects((1,s_4_4)).
obj_type(0,(1,s_4_4)).
objects((1,s_4_3)).
obj_type(0,(1,s_4_3)).
objects((1,s_3_2)).
obj_type(0,(1,s_3_2)).
objects((1,s_2_2)).
obj_type(0,(1,s_2_2)).
objects((1,s_2_4)).
obj_type(0,(1,s_2_4)).
objects((1,s_1_1)).
obj_type(0,(1,s_1_1)).
objects((1,s_1_4)).
obj_type(0,(1,s_1_4)).
objects((1,s_1_2)).
obj_type(0,(1,s_1_2)).
objects((1,s_4_2)).
obj_type(0,(1,s_4_2)).
objects((1,s_4_1)).
obj_type(0,(1,s_4_1)).
objects((2,s_3_3)).
obj_type(0,(2,s_3_3)).
objects((2,s_3_2)).
obj_type(0,(2,s_3_2)).
objects((2,s_3_1)).
obj_type(0,(2,s_3_1)).
objects((2,s_2_1)).
obj_type(0,(2,s_2_1)).
objects((2,s_3_4)).
obj_type(0,(2,s_3_4)).
objects((2,s_2_4)).
obj_type(0,(2,s_2_4)).
objects((2,s_2_3)).
obj_type(0,(2,s_2_3)).
objects((2,s_2_2)).
obj_type(0,(2,s_2_2)).
objects((2,s_4_3)).
obj_type(0,(2,s_4_3)).
objects((2,s_4_2)).
obj_type(0,(2,s_4_2)).
objects((2,s_1_4)).
obj_type(0,(2,s_1_4)).
objects((2,s_1_3)).
obj_type(0,(2,s_1_3)).
objects((2,s_1_2)).
obj_type(0,(2,s_1_2)).
objects((2,s_1_1)).
obj_type(0,(2,s_1_1)).
objects((3,s_3_3)).
obj_type(0,(3,s_3_3)).
objects((3,s_3_2)).
obj_type(0,(3,s_3_2)).
objects((3,s_3_1)).
obj_type(0,(3,s_3_1)).
objects((3,s_2_1)).
obj_type(0,(3,s_2_1)).
objects((3,s_3_4)).
obj_type(0,(3,s_3_4)).
objects((3,s_2_4)).
obj_type(0,(3,s_2_4)).
objects((3,s_2_3)).
obj_type(0,(3,s_2_3)).
objects((3,s_4_4)).
obj_type(0,(3,s_4_4)).
objects((3,s_4_3)).
obj_type(0,(3,s_4_3)).
objects((3,s_2_2)).
obj_type(0,(3,s_2_2)).
objects((3,s_4_2)).
obj_type(0,(3,s_4_2)).
objects((3,s_4_1)).
obj_type(0,(3,s_4_1)).
objects((3,s_1_4)).
obj_type(0,(3,s_1_4)).
objects((3,s_1_3)).
obj_type(0,(3,s_1_3)).
objects((3,s_1_2)).
obj_type(0,(3,s_1_2)).
objects((4,s_2_3)).
obj_type(0,(4,s_2_3)).
objects((4,s_1_3)).
obj_type(0,(4,s_1_3)).
objects((4,s_3_3)).
obj_type(0,(4,s_3_3)).
objects((4,s_3_1)).
obj_type(0,(4,s_3_1)).
objects((4,s_2_1)).
obj_type(0,(4,s_2_1)).
objects((4,s_3_4)).
obj_type(0,(4,s_3_4)).
objects((4,s_4_4)).
obj_type(0,(4,s_4_4)).
objects((4,s_4_3)).
obj_type(0,(4,s_4_3)).
objects((4,s_3_2)).
obj_type(0,(4,s_3_2)).
objects((4,s_2_2)).
obj_type(0,(4,s_2_2)).
objects((4,s_2_4)).
obj_type(0,(4,s_2_4)).
objects((4,s_1_1)).
obj_type(0,(4,s_1_1)).
objects((4,s_1_4)).
obj_type(0,(4,s_1_4)).
objects((4,s_1_2)).
obj_type(0,(4,s_1_2)).
objects((4,s_4_2)).
obj_type(0,(4,s_4_2)).
objects((4,s_4_1)).
obj_type(0,(4,s_4_1)).
objects((5,s_3_3)).
obj_type(0,(5,s_3_3)).
objects((5,s_3_2)).
obj_type(0,(5,s_3_2)).
objects((5,s_2_4)).
obj_type(0,(5,s_2_4)).
objects((5,s_3_4)).
obj_type(0,(5,s_3_4)).
objects((5,s_3_1)).
obj_type(0,(5,s_3_1)).
objects((5,s_2_1)).
obj_type(0,(5,s_2_1)).
objects((5,s_2_3)).
obj_type(0,(5,s_2_3)).
objects((5,s_4_4)).
obj_type(0,(5,s_4_4)).
objects((5,s_4_3)).
obj_type(0,(5,s_4_3)).
objects((5,s_2_2)).
obj_type(0,(5,s_2_2)).
objects((5,s_4_2)).
obj_type(0,(5,s_4_2)).
objects((5,s_1_4)).
obj_type(0,(5,s_1_4)).
objects((5,s_1_3)).
obj_type(0,(5,s_1_3)).
objects((5,s_1_2)).
obj_type(0,(5,s_1_2)).
types(0).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
action_arity("push-box",3).
action_type_list("push-box",(Type0, Type1, Type2)) :- action_arg_type(Type0,("push-box",0)), action_arg_type(Type1,("push-box",1)), action_arg_type(Type2,("push-box",2)).
action_candidate("push-box",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("push-box",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("move-player",2).
action_type_list("move-player",(Type0, Type1)) :- action_arg_type(Type0,("move-player",0)), action_arg_type(Type1,("move-player",1)).
action_candidate("move-player",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("move-player",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arg_type(0,("push-box",0)).
action_arg_type(0,("move-player",0)).
action_arg_type(0,("push-box",1)).
action_arg_type(0,("push-box",2)).
action_arg_type(0,("move-player",1)).
action_possible("push-box",0,((0,s_2_3), (0,s_1_3), (0,s_3_3))).
action_possible("move-player",0,((0,s_3_1), (0,s_2_1))).
action_possible("move-player",0,((0,s_3_3), (0,s_3_4))).
action_possible("move-player",0,((0,s_2_3), (0,s_3_3))).
action_possible("move-player",0,((0,s_4_4), (0,s_4_3))).
action_possible("move-player",0,((0,s_3_2), (0,s_2_2))).
action_possible("move-player",0,((0,s_2_2), (0,s_2_3))).
action_possible("push-box",0,((0,s_3_4), (0,s_2_4), (0,s_4_4))).
action_possible("push-box",0,((0,s_2_1), (0,s_1_1), (0,s_3_1))).
action_possible("move-player",0,((0,s_1_3), (0,s_1_4))).
action_possible("move-player",0,((0,s_1_3), (0,s_1_2))).
action_possible("push-box",0,((0,s_4_3), (0,s_4_4), (0,s_4_2))).
action_possible("push-box",0,((0,s_1_2), (0,s_1_3), (0,s_1_1))).
action_possible("push-box",0,((0,s_3_2), (0,s_3_3), (0,s_3_1))).
action_possible("move-player",0,((0,s_3_4), (0,s_2_4))).
action_possible("push-box",0,((0,s_1_3), (0,s_1_4), (0,s_1_2))).
action_possible("push-box",0,((0,s_4_3), (0,s_4_2), (0,s_4_4))).
action_possible("push-box",0,((0,s_1_3), (0,s_1_2), (0,s_1_4))).
action_possible("push-box",0,((0,s_2_2), (0,s_1_2), (0,s_3_2))).
action_possible("move-player",0,((0,s_4_2), (0,s_3_2))).
action_possible("move-player",0,((0,s_2_1), (0,s_2_2))).
action_possible("move-player",0,((0,s_2_1), (0,s_3_1))).
action_possible("push-box",0,((0,s_3_1), (0,s_4_1), (0,s_2_1))).
action_possible("move-player",0,((0,s_2_4), (0,s_2_3))).
action_possible("push-box",0,((0,s_2_2), (0,s_2_3), (0,s_2_1))).
action_possible("push-box",0,((0,s_3_3), (0,s_3_4), (0,s_3_2))).
action_possible("move-player",0,((0,s_2_2), (0,s_2_1))).
action_possible("move-player",0,((0,s_4_4), (0,s_3_4))).
action_possible("move-player",0,((0,s_1_4), (0,s_2_4))).
action_possible("move-player",0,((0,s_2_4), (0,s_1_4))).
action_possible("move-player",0,((0,s_4_2), (0,s_4_3))).
action_possible("move-player",0,((0,s_1_1), (0,s_2_1))).
action_possible("push-box",0,((0,s_3_2), (0,s_4_2), (0,s_2_2))).
action_possible("push-box",0,((0,s_3_4), (0,s_4_4), (0,s_2_4))).
action_possible("move-player",0,((0,s_3_3), (0,s_3_2))).
action_possible("push-box",0,((0,s_2_3), (0,s_2_2), (0,s_2_4))).
action_possible("move-player",0,((0,s_2_4), (0,s_3_4))).
action_possible("push-box",0,((0,s_2_2), (0,s_2_1), (0,s_2_3))).
action_possible("push-box",0,((0,s_4_2), (0,s_4_1), (0,s_4_3))).
action_possible("push-box",0,((0,s_2_1), (0,s_3_1), (0,s_1_1))).
action_possible("push-box",0,((0,s_1_2), (0,s_1_1), (0,s_1_3))).
action_possible("move-player",0,((0,s_4_3), (0,s_4_2))).
action_possible("move-player",0,((0,s_3_2), (0,s_3_3))).
action_possible("move-player",0,((0,s_4_2), (0,s_4_1))).
action_possible("move-player",0,((0,s_1_4), (0,s_1_3))).
action_possible("move-player",0,((0,s_4_1), (0,s_4_2))).
action_possible("push-box",0,((0,s_3_3), (0,s_2_3), (0,s_4_3))).
action_possible("move-player",0,((0,s_2_3), (0,s_2_4))).
action_possible("move-player",0,((0,s_2_2), (0,s_3_2))).
action_possible("move-player",0,((0,s_2_3), (0,s_2_2))).
action_possible("move-player",0,((0,s_3_1), (0,s_3_2))).
action_possible("move-player",0,((0,s_2_2), (0,s_1_2))).
action_possible("move-player",0,((0,s_3_4), (0,s_4_4))).
action_possible("move-player",0,((0,s_3_3), (0,s_4_3))).
action_possible("move-player",0,((0,s_2_3), (0,s_1_3))).
action_possible("move-player",0,((0,s_4_3), (0,s_3_3))).
action_possible("move-player",0,((0,s_1_3), (0,s_2_3))).
action_possible("push-box",0,((0,s_2_4), (0,s_1_4), (0,s_3_4))).
action_possible("move-player",0,((0,s_3_4), (0,s_3_3))).
action_possible("move-player",0,((0,s_1_1), (0,s_1_2))).
action_possible("move-player",0,((0,s_2_1), (0,s_1_1))).
action_possible("move-player",0,((0,s_1_2), (0,s_1_1))).
action_possible("move-player",0,((0,s_4_3), (0,s_4_4))).
action_possible("move-player",0,((0,s_1_2), (0,s_2_2))).
action_possible("move-player",0,((0,s_4_1), (0,s_3_1))).
action_possible("push-box",0,((0,s_3_2), (0,s_2_2), (0,s_4_2))).
action_possible("push-box",0,((0,s_3_1), (0,s_2_1), (0,s_4_1))).
action_possible("move-player",0,((0,s_1_2), (0,s_1_3))).
action_possible("push-box",0,((0,s_2_2), (0,s_3_2), (0,s_1_2))).
action_possible("push-box",0,((0,s_3_2), (0,s_3_1), (0,s_3_3))).
action_possible("push-box",0,((0,s_4_2), (0,s_4_3), (0,s_4_1))).
action_possible("move-player",0,((0,s_3_2), (0,s_4_2))).
action_possible("push-box",0,((0,s_2_3), (0,s_2_4), (0,s_2_2))).
action_possible("push-box",0,((0,s_2_3), (0,s_3_3), (0,s_1_3))).
action_possible("move-player",0,((0,s_3_2), (0,s_3_1))).
action_possible("push-box",0,((0,s_3_3), (0,s_3_2), (0,s_3_4))).
action_possible("move-player",0,((0,s_3_1), (0,s_4_1))).
action_possible("push-box",0,((0,s_2_4), (0,s_3_4), (0,s_1_4))).
action_possible("push-box",0,((0,s_3_3), (0,s_4_3), (0,s_2_3))).
action_possible("move-player",0,((0,s_3_3), (0,s_2_3))).
action_possible("push-box",1,((1,s_2_3), (1,s_1_3), (1,s_3_3))).
action_possible("move-player",1,((1,s_3_1), (1,s_2_1))).
action_possible("move-player",1,((1,s_3_3), (1,s_3_4))).
action_possible("move-player",1,((1,s_2_3), (1,s_3_3))).
action_possible("move-player",1,((1,s_4_4), (1,s_4_3))).
action_possible("move-player",1,((1,s_3_2), (1,s_2_2))).
action_possible("move-player",1,((1,s_2_2), (1,s_2_3))).
action_possible("push-box",1,((1,s_3_4), (1,s_2_4), (1,s_4_4))).
action_possible("push-box",1,((1,s_2_1), (1,s_1_1), (1,s_3_1))).
action_possible("move-player",1,((1,s_1_3), (1,s_1_4))).
action_possible("move-player",1,((1,s_1_3), (1,s_1_2))).
action_possible("push-box",1,((1,s_4_3), (1,s_4_4), (1,s_4_2))).
action_possible("push-box",1,((1,s_1_2), (1,s_1_3), (1,s_1_1))).
action_possible("push-box",1,((1,s_3_2), (1,s_3_3), (1,s_3_1))).
action_possible("push-box",1,((1,s_1_3), (1,s_1_4), (1,s_1_2))).
action_possible("move-player",1,((1,s_3_4), (1,s_2_4))).
action_possible("push-box",1,((1,s_4_3), (1,s_4_2), (1,s_4_4))).
action_possible("push-box",1,((1,s_1_3), (1,s_1_2), (1,s_1_4))).
action_possible("push-box",1,((1,s_2_2), (1,s_1_2), (1,s_3_2))).
action_possible("move-player",1,((1,s_4_2), (1,s_3_2))).
action_possible("move-player",1,((1,s_2_1), (1,s_2_2))).
action_possible("move-player",1,((1,s_2_1), (1,s_3_1))).
action_possible("push-box",1,((1,s_3_1), (1,s_4_1), (1,s_2_1))).
action_possible("move-player",1,((1,s_2_4), (1,s_2_3))).
action_possible("push-box",1,((1,s_2_2), (1,s_2_3), (1,s_2_1))).
action_possible("push-box",1,((1,s_3_3), (1,s_3_4), (1,s_3_2))).
action_possible("move-player",1,((1,s_2_2), (1,s_2_1))).
action_possible("move-player",1,((1,s_4_4), (1,s_3_4))).
action_possible("move-player",1,((1,s_1_4), (1,s_2_4))).
action_possible("move-player",1,((1,s_2_4), (1,s_1_4))).
action_possible("move-player",1,((1,s_4_2), (1,s_4_3))).
action_possible("push-box",1,((1,s_3_2), (1,s_4_2), (1,s_2_2))).
action_possible("move-player",1,((1,s_1_1), (1,s_2_1))).
action_possible("push-box",1,((1,s_3_4), (1,s_4_4), (1,s_2_4))).
action_possible("move-player",1,((1,s_3_3), (1,s_3_2))).
action_possible("push-box",1,((1,s_2_3), (1,s_2_2), (1,s_2_4))).
action_possible("move-player",1,((1,s_2_4), (1,s_3_4))).
action_possible("push-box",1,((1,s_2_2), (1,s_2_1), (1,s_2_3))).
action_possible("push-box",1,((1,s_4_2), (1,s_4_1), (1,s_4_3))).
action_possible("push-box",1,((1,s_2_1), (1,s_3_1), (1,s_1_1))).
action_possible("push-box",1,((1,s_1_2), (1,s_1_1), (1,s_1_3))).
action_possible("move-player",1,((1,s_4_3), (1,s_4_2))).
action_possible("move-player",1,((1,s_3_2), (1,s_3_3))).
action_possible("move-player",1,((1,s_4_2), (1,s_4_1))).
action_possible("move-player",1,((1,s_1_4), (1,s_1_3))).
action_possible("move-player",1,((1,s_4_1), (1,s_4_2))).
action_possible("push-box",1,((1,s_3_3), (1,s_2_3), (1,s_4_3))).
action_possible("move-player",1,((1,s_2_3), (1,s_2_4))).
action_possible("move-player",1,((1,s_2_2), (1,s_3_2))).
action_possible("move-player",1,((1,s_2_3), (1,s_2_2))).
action_possible("move-player",1,((1,s_3_1), (1,s_3_2))).
action_possible("move-player",1,((1,s_2_2), (1,s_1_2))).
action_possible("move-player",1,((1,s_3_4), (1,s_4_4))).
action_possible("move-player",1,((1,s_3_3), (1,s_4_3))).
action_possible("move-player",1,((1,s_2_3), (1,s_1_3))).
action_possible("move-player",1,((1,s_4_3), (1,s_3_3))).
action_possible("move-player",1,((1,s_1_3), (1,s_2_3))).
action_possible("push-box",1,((1,s_2_4), (1,s_1_4), (1,s_3_4))).
action_possible("move-player",1,((1,s_3_4), (1,s_3_3))).
action_possible("move-player",1,((1,s_1_1), (1,s_1_2))).
action_possible("move-player",1,((1,s_2_1), (1,s_1_1))).
action_possible("move-player",1,((1,s_1_2), (1,s_1_1))).
action_possible("move-player",1,((1,s_4_3), (1,s_4_4))).
action_possible("move-player",1,((1,s_1_2), (1,s_2_2))).
action_possible("move-player",1,((1,s_4_1), (1,s_3_1))).
action_possible("push-box",1,((1,s_3_2), (1,s_2_2), (1,s_4_2))).
action_possible("push-box",1,((1,s_3_1), (1,s_2_1), (1,s_4_1))).
action_possible("move-player",1,((1,s_1_2), (1,s_1_3))).
action_possible("push-box",1,((1,s_2_2), (1,s_3_2), (1,s_1_2))).
action_possible("push-box",1,((1,s_3_2), (1,s_3_1), (1,s_3_3))).
action_possible("push-box",1,((1,s_4_2), (1,s_4_3), (1,s_4_1))).
action_possible("move-player",1,((1,s_3_2), (1,s_4_2))).
action_possible("push-box",1,((1,s_2_3), (1,s_2_4), (1,s_2_2))).
action_possible("push-box",1,((1,s_2_3), (1,s_3_3), (1,s_1_3))).
action_possible("move-player",1,((1,s_3_2), (1,s_3_1))).
action_possible("push-box",1,((1,s_3_3), (1,s_3_2), (1,s_3_4))).
action_possible("move-player",1,((1,s_3_1), (1,s_4_1))).
action_possible("push-box",1,((1,s_2_4), (1,s_3_4), (1,s_1_4))).
action_possible("push-box",1,((1,s_3_3), (1,s_4_3), (1,s_2_3))).
action_possible("move-player",1,((1,s_3_3), (1,s_2_3))).
action_possible("move-player",2,((2,s_3_3), (2,s_3_2))).
action_possible("move-player",2,((2,s_3_1), (2,s_2_1))).
action_possible("move-player",2,((2,s_3_3), (2,s_3_4))).
action_possible("move-player",2,((2,s_2_4), (2,s_3_4))).
action_possible("move-player",2,((2,s_2_3), (2,s_3_3))).
action_possible("move-player",2,((2,s_3_2), (2,s_2_2))).
action_possible("move-player",2,((2,s_4_3), (2,s_4_2))).
action_possible("move-player",2,((2,s_3_2), (2,s_3_3))).
action_possible("move-player",2,((2,s_2_2), (2,s_2_3))).
action_possible("move-player",2,((2,s_1_4), (2,s_1_3))).
action_possible("move-player",2,((2,s_1_3), (2,s_1_4))).
action_possible("move-player",2,((2,s_1_3), (2,s_1_2))).
action_possible("move-player",2,((2,s_2_3), (2,s_2_4))).
action_possible("move-player",2,((2,s_2_2), (2,s_3_2))).
action_possible("move-player",2,((2,s_2_3), (2,s_2_2))).
action_possible("move-player",2,((2,s_3_1), (2,s_3_2))).
action_possible("move-player",2,((2,s_2_2), (2,s_1_2))).
action_possible("move-player",2,((2,s_3_3), (2,s_4_3))).
action_possible("move-player",2,((2,s_2_3), (2,s_1_3))).
action_possible("move-player",2,((2,s_3_4), (2,s_2_4))).
action_possible("move-player",2,((2,s_4_3), (2,s_3_3))).
action_possible("move-player",2,((2,s_1_3), (2,s_2_3))).
action_possible("move-player",2,((2,s_3_4), (2,s_3_3))).
action_possible("move-player",2,((2,s_4_2), (2,s_3_2))).
action_possible("move-player",2,((2,s_1_1), (2,s_1_2))).
action_possible("move-player",2,((2,s_2_1), (2,s_1_1))).
action_possible("move-player",2,((2,s_1_2), (2,s_1_1))).
action_possible("move-player",2,((2,s_2_1), (2,s_2_2))).
action_possible("move-player",2,((2,s_1_2), (2,s_2_2))).
action_possible("move-player",2,((2,s_2_1), (2,s_3_1))).
action_possible("move-player",2,((2,s_2_4), (2,s_2_3))).
action_possible("move-player",2,((2,s_2_2), (2,s_2_1))).
action_possible("move-player",2,((2,s_1_2), (2,s_1_3))).
action_possible("move-player",2,((2,s_1_4), (2,s_2_4))).
action_possible("move-player",2,((2,s_2_4), (2,s_1_4))).
action_possible("move-player",2,((2,s_3_2), (2,s_4_2))).
action_possible("move-player",2,((2,s_3_2), (2,s_3_1))).
action_possible("move-player",2,((2,s_4_2), (2,s_4_3))).
action_possible("move-player",2,((2,s_1_1), (2,s_2_1))).
action_possible("move-player",2,((2,s_3_3), (2,s_2_3))).
action_possible("move-player",3,((3,s_3_3), (3,s_3_2))).
action_possible("move-player",3,((3,s_3_1), (3,s_2_1))).
action_possible("move-player",3,((3,s_3_3), (3,s_3_4))).
action_possible("move-player",3,((3,s_2_4), (3,s_3_4))).
action_possible("move-player",3,((3,s_2_3), (3,s_3_3))).
action_possible("move-player",3,((3,s_4_4), (3,s_4_3))).
action_possible("move-player",3,((3,s_3_2), (3,s_2_2))).
action_possible("move-player",3,((3,s_4_3), (3,s_4_2))).
action_possible("move-player",3,((3,s_3_2), (3,s_3_3))).
action_possible("move-player",3,((3,s_4_2), (3,s_4_1))).
action_possible("move-player",3,((3,s_2_2), (3,s_2_3))).
action_possible("push-box",3,((3,s_3_4), (3,s_2_4), (3,s_4_4))).
action_possible("move-player",3,((3,s_1_4), (3,s_1_3))).
action_possible("move-player",3,((3,s_4_1), (3,s_4_2))).
action_possible("move-player",3,((3,s_1_3), (3,s_1_4))).
action_possible("move-player",3,((3,s_1_3), (3,s_1_2))).
action_possible("move-player",3,((3,s_2_3), (3,s_2_4))).
action_possible("move-player",3,((3,s_2_2), (3,s_3_2))).
action_possible("move-player",3,((3,s_2_3), (3,s_2_2))).
action_possible("move-player",3,((3,s_3_1), (3,s_3_2))).
action_possible("move-player",3,((3,s_2_2), (3,s_1_2))).
action_possible("move-player",3,((3,s_3_4), (3,s_4_4))).
action_possible("move-player",3,((3,s_3_3), (3,s_4_3))).
action_possible("move-player",3,((3,s_2_3), (3,s_1_3))).
action_possible("move-player",3,((3,s_3_4), (3,s_2_4))).
action_possible("move-player",3,((3,s_4_3), (3,s_3_3))).
action_possible("move-player",3,((3,s_1_3), (3,s_2_3))).
action_possible("push-box",3,((3,s_2_4), (3,s_1_4), (3,s_3_4))).
action_possible("move-player",3,((3,s_3_4), (3,s_3_3))).
action_possible("move-player",3,((3,s_4_2), (3,s_3_2))).
action_possible("move-player",3,((3,s_4_3), (3,s_4_4))).
action_possible("move-player",3,((3,s_2_1), (3,s_2_2))).
action_possible("move-player",3,((3,s_1_2), (3,s_2_2))).
action_possible("move-player",3,((3,s_4_1), (3,s_3_1))).
action_possible("move-player",3,((3,s_2_1), (3,s_3_1))).
action_possible("move-player",3,((3,s_2_4), (3,s_2_3))).
action_possible("move-player",3,((3,s_2_2), (3,s_2_1))).
action_possible("move-player",3,((3,s_1_2), (3,s_1_3))).
action_possible("move-player",3,((3,s_4_4), (3,s_3_4))).
action_possible("move-player",3,((3,s_1_4), (3,s_2_4))).
action_possible("move-player",3,((3,s_2_4), (3,s_1_4))).
action_possible("move-player",3,((3,s_3_2), (3,s_4_2))).
action_possible("move-player",3,((3,s_3_2), (3,s_3_1))).
action_possible("move-player",3,((3,s_4_2), (3,s_4_3))).
action_possible("move-player",3,((3,s_3_1), (3,s_4_1))).
action_possible("push-box",3,((3,s_2_4), (3,s_3_4), (3,s_1_4))).
action_possible("push-box",3,((3,s_3_4), (3,s_4_4), (3,s_2_4))).
action_possible("move-player",3,((3,s_3_3), (3,s_2_3))).
action_possible("push-box",4,((4,s_2_3), (4,s_1_3), (4,s_3_3))).
action_possible("move-player",4,((4,s_3_1), (4,s_2_1))).
action_possible("move-player",4,((4,s_3_3), (4,s_3_4))).
action_possible("move-player",4,((4,s_2_3), (4,s_3_3))).
action_possible("move-player",4,((4,s_4_4), (4,s_4_3))).
action_possible("move-player",4,((4,s_3_2), (4,s_2_2))).
action_possible("move-player",4,((4,s_2_2), (4,s_2_3))).
action_possible("push-box",4,((4,s_3_4), (4,s_2_4), (4,s_4_4))).
action_possible("push-box",4,((4,s_2_1), (4,s_1_1), (4,s_3_1))).
action_possible("move-player",4,((4,s_1_3), (4,s_1_4))).
action_possible("move-player",4,((4,s_1_3), (4,s_1_2))).
action_possible("push-box",4,((4,s_4_3), (4,s_4_4), (4,s_4_2))).
action_possible("push-box",4,((4,s_1_2), (4,s_1_3), (4,s_1_1))).
action_possible("push-box",4,((4,s_3_2), (4,s_3_3), (4,s_3_1))).
action_possible("move-player",4,((4,s_3_4), (4,s_2_4))).
action_possible("push-box",4,((4,s_1_3), (4,s_1_4), (4,s_1_2))).
action_possible("push-box",4,((4,s_4_3), (4,s_4_2), (4,s_4_4))).
action_possible("push-box",4,((4,s_1_3), (4,s_1_2), (4,s_1_4))).
action_possible("push-box",4,((4,s_2_2), (4,s_1_2), (4,s_3_2))).
action_possible("move-player",4,((4,s_4_2), (4,s_3_2))).
action_possible("move-player",4,((4,s_2_1), (4,s_2_2))).
action_possible("move-player",4,((4,s_2_1), (4,s_3_1))).
action_possible("push-box",4,((4,s_3_1), (4,s_4_1), (4,s_2_1))).
action_possible("move-player",4,((4,s_2_4), (4,s_2_3))).
action_possible("push-box",4,((4,s_2_2), (4,s_2_3), (4,s_2_1))).
action_possible("push-box",4,((4,s_3_3), (4,s_3_4), (4,s_3_2))).
action_possible("move-player",4,((4,s_2_2), (4,s_2_1))).
action_possible("move-player",4,((4,s_4_4), (4,s_3_4))).
action_possible("move-player",4,((4,s_1_4), (4,s_2_4))).
action_possible("move-player",4,((4,s_2_4), (4,s_1_4))).
action_possible("move-player",4,((4,s_4_2), (4,s_4_3))).
action_possible("move-player",4,((4,s_1_1), (4,s_2_1))).
action_possible("push-box",4,((4,s_3_2), (4,s_4_2), (4,s_2_2))).
action_possible("push-box",4,((4,s_3_4), (4,s_4_4), (4,s_2_4))).
action_possible("move-player",4,((4,s_3_3), (4,s_3_2))).
action_possible("push-box",4,((4,s_2_3), (4,s_2_2), (4,s_2_4))).
action_possible("move-player",4,((4,s_2_4), (4,s_3_4))).
action_possible("push-box",4,((4,s_2_2), (4,s_2_1), (4,s_2_3))).
action_possible("push-box",4,((4,s_4_2), (4,s_4_1), (4,s_4_3))).
action_possible("push-box",4,((4,s_2_1), (4,s_3_1), (4,s_1_1))).
action_possible("push-box",4,((4,s_1_2), (4,s_1_1), (4,s_1_3))).
action_possible("move-player",4,((4,s_4_3), (4,s_4_2))).
action_possible("move-player",4,((4,s_3_2), (4,s_3_3))).
action_possible("move-player",4,((4,s_4_2), (4,s_4_1))).
action_possible("move-player",4,((4,s_1_4), (4,s_1_3))).
action_possible("move-player",4,((4,s_4_1), (4,s_4_2))).
action_possible("push-box",4,((4,s_3_3), (4,s_2_3), (4,s_4_3))).
action_possible("move-player",4,((4,s_2_3), (4,s_2_4))).
action_possible("move-player",4,((4,s_2_2), (4,s_3_2))).
action_possible("move-player",4,((4,s_2_3), (4,s_2_2))).
action_possible("move-player",4,((4,s_3_1), (4,s_3_2))).
action_possible("move-player",4,((4,s_2_2), (4,s_1_2))).
action_possible("move-player",4,((4,s_3_4), (4,s_4_4))).
action_possible("move-player",4,((4,s_3_3), (4,s_4_3))).
action_possible("move-player",4,((4,s_2_3), (4,s_1_3))).
action_possible("move-player",4,((4,s_4_3), (4,s_3_3))).
action_possible("move-player",4,((4,s_1_3), (4,s_2_3))).
action_possible("push-box",4,((4,s_2_4), (4,s_1_4), (4,s_3_4))).
action_possible("move-player",4,((4,s_3_4), (4,s_3_3))).
action_possible("move-player",4,((4,s_1_1), (4,s_1_2))).
action_possible("move-player",4,((4,s_2_1), (4,s_1_1))).
action_possible("move-player",4,((4,s_1_2), (4,s_1_1))).
action_possible("move-player",4,((4,s_4_3), (4,s_4_4))).
action_possible("move-player",4,((4,s_1_2), (4,s_2_2))).
action_possible("move-player",4,((4,s_4_1), (4,s_3_1))).
action_possible("push-box",4,((4,s_3_2), (4,s_2_2), (4,s_4_2))).
action_possible("push-box",4,((4,s_3_1), (4,s_2_1), (4,s_4_1))).
action_possible("move-player",4,((4,s_1_2), (4,s_1_3))).
action_possible("push-box",4,((4,s_2_2), (4,s_3_2), (4,s_1_2))).
action_possible("push-box",4,((4,s_3_2), (4,s_3_1), (4,s_3_3))).
action_possible("push-box",4,((4,s_4_2), (4,s_4_3), (4,s_4_1))).
action_possible("move-player",4,((4,s_3_2), (4,s_4_2))).
action_possible("push-box",4,((4,s_2_3), (4,s_2_4), (4,s_2_2))).
action_possible("push-box",4,((4,s_2_3), (4,s_3_3), (4,s_1_3))).
action_possible("move-player",4,((4,s_3_2), (4,s_3_1))).
action_possible("push-box",4,((4,s_3_3), (4,s_3_2), (4,s_3_4))).
action_possible("move-player",4,((4,s_3_1), (4,s_4_1))).
action_possible("push-box",4,((4,s_2_4), (4,s_3_4), (4,s_1_4))).
action_possible("push-box",4,((4,s_3_3), (4,s_4_3), (4,s_2_3))).
action_possible("move-player",4,((4,s_3_3), (4,s_2_3))).
action_possible("move-player",5,((5,s_3_3), (5,s_3_2))).
action_possible("move-player",5,((5,s_2_4), (5,s_3_4))).
action_possible("move-player",5,((5,s_3_3), (5,s_3_4))).
action_possible("move-player",5,((5,s_3_1), (5,s_2_1))).
action_possible("move-player",5,((5,s_2_3), (5,s_3_3))).
action_possible("move-player",5,((5,s_4_4), (5,s_4_3))).
action_possible("move-player",5,((5,s_3_2), (5,s_2_2))).
action_possible("move-player",5,((5,s_4_3), (5,s_4_2))).
action_possible("move-player",5,((5,s_3_2), (5,s_3_3))).
action_possible("move-player",5,((5,s_2_2), (5,s_2_3))).
action_possible("move-player",5,((5,s_1_4), (5,s_1_3))).
action_possible("move-player",5,((5,s_1_3), (5,s_1_4))).
action_possible("move-player",5,((5,s_2_3), (5,s_2_4))).
action_possible("move-player",5,((5,s_1_3), (5,s_1_2))).
action_possible("move-player",5,((5,s_2_2), (5,s_3_2))).
action_possible("move-player",5,((5,s_2_3), (5,s_2_2))).
action_possible("move-player",5,((5,s_3_1), (5,s_3_2))).
action_possible("move-player",5,((5,s_2_2), (5,s_1_2))).
action_possible("move-player",5,((5,s_3_4), (5,s_4_4))).
action_possible("move-player",5,((5,s_3_3), (5,s_4_3))).
action_possible("move-player",5,((5,s_2_3), (5,s_1_3))).
action_possible("move-player",5,((5,s_3_4), (5,s_2_4))).
action_possible("move-player",5,((5,s_4_3), (5,s_3_3))).
action_possible("move-player",5,((5,s_1_3), (5,s_2_3))).
action_possible("move-player",5,((5,s_3_4), (5,s_3_3))).
action_possible("move-player",5,((5,s_4_2), (5,s_3_2))).
action_possible("move-player",5,((5,s_4_3), (5,s_4_4))).
action_possible("move-player",5,((5,s_2_1), (5,s_2_2))).
action_possible("move-player",5,((5,s_1_2), (5,s_2_2))).
action_possible("move-player",5,((5,s_2_1), (5,s_3_1))).
action_possible("move-player",5,((5,s_2_4), (5,s_2_3))).
action_possible("move-player",5,((5,s_1_2), (5,s_1_3))).
action_possible("move-player",5,((5,s_2_2), (5,s_2_1))).
action_possible("move-player",5,((5,s_4_4), (5,s_3_4))).
action_possible("move-player",5,((5,s_1_4), (5,s_2_4))).
action_possible("move-player",5,((5,s_2_4), (5,s_1_4))).
action_possible("move-player",5,((5,s_3_2), (5,s_4_2))).
action_possible("move-player",5,((5,s_3_2), (5,s_3_1))).
action_possible("move-player",5,((5,s_4_2), (5,s_4_3))).
action_possible("move-player",5,((5,s_3_3), (5,s_2_3))).
