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
objects((0,9)).
obj_type(1,(0,9)).
objects((0,12)).
obj_type(1,(0,12)).
objects((0,3)).
obj_type(0,(0,3)).
objects((0,6)).
obj_type(0,(0,6)).
objects((0,11)).
obj_type(1,(0,11)).
objects((0,14)).
obj_type(1,(0,14)).
objects((0,8)).
obj_type(1,(0,8)).
objects((0,5)).
obj_type(0,(0,5)).
objects((0,2)).
obj_type(0,(0,2)).
objects((0,10)).
obj_type(1,(0,10)).
objects((0,13)).
obj_type(1,(0,13)).
objects((0,15)).
obj_type(1,(0,15)).
objects((0,0)).
obj_type(0,(0,0)).
objects((0,4)).
obj_type(0,(0,4)).
objects((0,16)).
obj_type(1,(0,16)).
objects((0,7)).
obj_type(0,(0,7)).
objects((1,3)).
obj_type(0,(1,3)).
objects((1,9)).
obj_type(1,(1,9)).
objects((1,8)).
obj_type(1,(1,8)).
objects((1,12)).
obj_type(1,(1,12)).
objects((1,2)).
obj_type(0,(1,2)).
objects((1,16)).
obj_type(1,(1,16)).
objects((1,13)).
obj_type(1,(1,13)).
objects((1,6)).
obj_type(0,(1,6)).
objects((1,11)).
obj_type(1,(1,11)).
objects((1,14)).
obj_type(1,(1,14)).
objects((1,5)).
obj_type(0,(1,5)).
objects((1,10)).
obj_type(1,(1,10)).
objects((1,0)).
obj_type(0,(1,0)).
objects((1,15)).
obj_type(1,(1,15)).
objects((1,1)).
obj_type(0,(1,1)).
objects((1,4)).
obj_type(0,(1,4)).
objects((1,7)).
obj_type(0,(1,7)).
objects((2,1)).
obj_type(0,(2,1)).
objects((2,9)).
obj_type(1,(2,9)).
objects((2,12)).
obj_type(1,(2,12)).
objects((2,3)).
obj_type(0,(2,3)).
objects((2,6)).
obj_type(0,(2,6)).
objects((2,11)).
obj_type(1,(2,11)).
objects((2,14)).
obj_type(1,(2,14)).
objects((2,8)).
obj_type(1,(2,8)).
objects((2,5)).
obj_type(0,(2,5)).
objects((2,2)).
obj_type(0,(2,2)).
objects((2,10)).
obj_type(1,(2,10)).
objects((2,13)).
obj_type(1,(2,13)).
objects((2,15)).
obj_type(1,(2,15)).
objects((2,0)).
obj_type(0,(2,0)).
objects((2,4)).
obj_type(0,(2,4)).
objects((2,16)).
obj_type(1,(2,16)).
objects((2,7)).
obj_type(0,(2,7)).
objects((3,1)).
obj_type(0,(3,1)).
objects((3,9)).
obj_type(1,(3,9)).
objects((3,12)).
obj_type(1,(3,12)).
objects((3,3)).
obj_type(0,(3,3)).
objects((3,6)).
obj_type(0,(3,6)).
objects((3,11)).
obj_type(1,(3,11)).
objects((3,14)).
obj_type(1,(3,14)).
objects((3,8)).
obj_type(1,(3,8)).
objects((3,5)).
obj_type(0,(3,5)).
objects((3,2)).
obj_type(0,(3,2)).
objects((3,10)).
obj_type(1,(3,10)).
objects((3,13)).
obj_type(1,(3,13)).
objects((3,15)).
obj_type(1,(3,15)).
objects((3,0)).
obj_type(0,(3,0)).
objects((3,4)).
obj_type(0,(3,4)).
objects((3,16)).
obj_type(1,(3,16)).
objects((3,7)).
obj_type(0,(3,7)).
objects((4,3)).
obj_type(0,(4,3)).
objects((4,9)).
obj_type(1,(4,9)).
objects((4,8)).
obj_type(1,(4,8)).
objects((4,12)).
obj_type(1,(4,12)).
objects((4,2)).
obj_type(0,(4,2)).
objects((4,16)).
obj_type(1,(4,16)).
objects((4,13)).
obj_type(1,(4,13)).
objects((4,5)).
obj_type(0,(4,5)).
objects((4,10)).
obj_type(1,(4,10)).
objects((4,0)).
obj_type(0,(4,0)).
objects((4,15)).
obj_type(1,(4,15)).
objects((4,4)).
obj_type(0,(4,4)).
objects((4,11)).
obj_type(1,(4,11)).
objects((4,14)).
obj_type(1,(4,14)).
objects((4,6)).
obj_type(0,(4,6)).
objects((4,1)).
obj_type(0,(4,1)).
objects((4,7)).
obj_type(0,(4,7)).
objects((5,1)).
obj_type(0,(5,1)).
objects((5,9)).
obj_type(1,(5,9)).
objects((5,12)).
obj_type(1,(5,12)).
objects((5,6)).
obj_type(0,(5,6)).
objects((5,10)).
obj_type(1,(5,10)).
objects((5,13)).
obj_type(1,(5,13)).
objects((5,8)).
obj_type(1,(5,8)).
objects((5,2)).
obj_type(0,(5,2)).
objects((5,3)).
obj_type(0,(5,3)).
objects((5,14)).
obj_type(1,(5,14)).
objects((5,15)).
obj_type(1,(5,15)).
objects((5,0)).
obj_type(0,(5,0)).
objects((5,11)).
obj_type(1,(5,11)).
objects((5,5)).
obj_type(0,(5,5)).
objects((5,4)).
obj_type(0,(5,4)).
objects((5,16)).
obj_type(1,(5,16)).
objects((5,7)).
obj_type(0,(5,7)).
types(0).
types(1).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
action_arity("move-right",3).
action_type_list("move-right",(Type0, Type1, Type2)) :- action_arg_type(Type0,("move-right",0)), action_arg_type(Type1,("move-right",1)), action_arg_type(Type2,("move-right",2)).
action_candidate("move-right",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("move-right",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("move-down",3).
action_type_list("move-down",(Type0, Type1, Type2)) :- action_arg_type(Type0,("move-down",0)), action_arg_type(Type1,("move-down",1)), action_arg_type(Type2,("move-down",2)).
action_candidate("move-down",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("move-down",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("move-up",3).
action_type_list("move-up",(Type0, Type1, Type2)) :- action_arg_type(Type0,("move-up",0)), action_arg_type(Type1,("move-up",1)), action_arg_type(Type2,("move-up",2)).
action_candidate("move-up",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("move-up",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arity("move-left",3).
action_type_list("move-left",(Type0, Type1, Type2)) :- action_arg_type(Type0,("move-left",0)), action_arg_type(Type1,("move-left",1)), action_arg_type(Type2,("move-left",2)).
action_candidate("move-left",Inst,(Obj0, Obj1, Obj2)):- instance(Inst),action_type_list("move-left",(Type0, Type1, Type2)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_), obj_type(Type2,(Obj2)),Obj2=(Inst,_).
action_arg_type(0,("move-right",0)).
action_arg_type(1,("move-right",1)).
action_arg_type(0,("move-down",0)).
action_arg_type(1,("move-down",1)).
action_arg_type(0,("move-up",0)).
action_arg_type(1,("move-up",1)).
action_arg_type(0,("move-left",0)).
action_arg_type(1,("move-left",1)).
action_arg_type(1,("move-left",2)).
action_arg_type(1,("move-up",2)).
action_arg_type(1,("move-right",2)).
action_arg_type(1,("move-down",2)).
action_possible("move-left",0,((0,1), (0,9), (0,12))).
action_possible("move-left",0,((0,3), (0,9), (0,12))).
action_possible("move-left",0,((0,6), (0,11), (0,14))).
action_possible("move-up",0,((0,1), (0,9), (0,8))).
action_possible("move-right",0,((0,5), (0,12), (0,9))).
action_possible("move-up",0,((0,2), (0,10), (0,9))).
action_possible("move-left",0,((0,2), (0,10), (0,13))).
action_possible("move-down",0,((0,3), (0,14), (0,15))).
action_possible("move-right",0,((0,0), (0,11), (0,8))).
action_possible("move-left",0,((0,5), (0,12), (0,15))).
action_possible("move-down",0,((0,4), (0,15), (0,16))).
action_possible("move-up",0,((0,5), (0,13), (0,12))).
action_possible("move-left",0,((0,5), (0,10), (0,13))).
action_possible("move-right",0,((0,3), (0,14), (0,11))).
action_possible("move-up",0,((0,3), (0,15), (0,14))).
action_possible("move-up",0,((0,7), (0,13), (0,12))).
action_possible("move-left",0,((0,3), (0,8), (0,11))).
action_possible("move-right",0,((0,4), (0,15), (0,12))).
action_possible("move-down",0,((0,6), (0,14), (0,15))).
action_possible("move-down",0,((0,5), (0,12), (0,13))).
action_possible("move-right",0,((0,6), (0,15), (0,12))).
action_possible("move-down",0,((0,4), (0,14), (0,15))).
action_possible("move-right",0,((0,3), (0,12), (0,9))).
action_possible("move-left",0,((0,4), (0,10), (0,13))).
action_possible("move-right",0,((0,4), (0,16), (0,13))).
action_possible("move-right",0,((0,2), (0,13), (0,10))).
action_possible("move-left",0,((0,5), (0,9), (0,12))).
action_possible("move-down",0,((0,5), (0,15), (0,16))).
action_possible("move-right",0,((0,1), (0,12), (0,9))).
action_possible("move-down",0,((0,3), (0,11), (0,12))).
action_possible("move-up",0,((0,6), (0,15), (0,14))).
action_possible("move-left",0,((0,7), (0,12), (0,15))).
action_possible("move-up",0,((0,4), (0,16), (0,15))).
action_possible("move-right",0,((0,6), (0,14), (0,11))).
action_possible("move-down",0,((0,2), (0,12), (0,13))).
action_possible("move-left",0,((0,4), (0,9), (0,12))).
action_possible("move-down",0,((0,1), (0,9), (0,10))).
action_possible("move-right",0,((0,3), (0,11), (0,8))).
action_possible("move-up",0,((0,2), (0,13), (0,12))).
action_possible("move-down",0,((0,7), (0,14), (0,15))).
action_possible("move-right",0,((0,5), (0,15), (0,12))).
action_possible("move-right",0,((0,5), (0,16), (0,13))).
action_possible("move-right",0,((0,7), (0,16), (0,13))).
action_possible("move-down",0,((0,0), (0,8), (0,9))).
action_possible("move-up",0,((0,5), (0,16), (0,15))).
action_possible("move-down",0,((0,4), (0,11), (0,12))).
action_possible("move-right",0,((0,4), (0,13), (0,10))).
action_possible("move-down",0,((0,4), (0,12), (0,13))).
action_possible("move-down",0,((0,7), (0,15), (0,16))).
action_possible("move-up",0,((0,4), (0,15), (0,14))).
action_possible("move-up",0,((0,7), (0,16), (0,15))).
action_possible("move-right",0,((0,5), (0,13), (0,10))).
action_possible("move-down",0,((0,1), (0,8), (0,9))).
action_possible("move-up",0,((0,4), (0,13), (0,12))).
action_possible("move-left",0,((0,0), (0,8), (0,11))).
action_possible("move-up",0,((0,0), (0,9), (0,8))).
action_possible("move-right",0,((0,4), (0,12), (0,9))).
action_possible("move-up",0,((0,3), (0,12), (0,11))).
action_possible("move-right",0,((0,7), (0,15), (0,12))).
action_possible("move-left",0,((0,4), (0,13), (0,16))).
action_possible("move-up",0,((0,1), (0,10), (0,9))).
action_possible("move-down",0,((0,7), (0,12), (0,13))).
action_possible("move-left",0,((0,5), (0,13), (0,16))).
action_possible("move-up",0,((0,4), (0,12), (0,11))).
action_possible("move-left",0,((0,4), (0,12), (0,15))).
action_possible("move-down",0,((0,2), (0,9), (0,10))).
action_possible("move-up",0,((0,7), (0,15), (0,14))).
action_possible("move-left",0,((0,7), (0,13), (0,16))).
action_possible("move-left",0,((0,3), (0,11), (0,14))).
action_possible("move-left",0,((0,6), (0,12), (0,15))).
action_possible("move-up",1,((1,3), (1,9), (1,8))).
action_possible("move-left",1,((1,3), (1,9), (1,12))).
action_possible("move-right",1,((1,2), (1,16), (1,13))).
action_possible("move-left",1,((1,6), (1,11), (1,14))).
action_possible("move-right",1,((1,5), (1,12), (1,9))).
action_possible("move-down",1,((1,5), (1,11), (1,12))).
action_possible("move-left",1,((1,2), (1,10), (1,13))).
action_possible("move-right",1,((1,0), (1,11), (1,8))).
action_possible("move-left",1,((1,5), (1,12), (1,15))).
action_possible("move-right",1,((1,1), (1,13), (1,10))).
action_possible("move-left",1,((1,2), (1,9), (1,12))).
action_possible("move-up",1,((1,5), (1,12), (1,11))).
action_possible("move-down",1,((1,6), (1,15), (1,16))).
action_possible("move-up",1,((1,5), (1,13), (1,12))).
action_possible("move-left",1,((1,4), (1,11), (1,14))).
action_possible("move-right",1,((1,5), (1,11), (1,8))).
action_possible("move-down",1,((1,2), (1,15), (1,16))).
action_possible("move-left",1,((1,2), (1,12), (1,15))).
action_possible("move-left",1,((1,5), (1,11), (1,14))).
action_possible("move-up",1,((1,0), (1,12), (1,11))).
action_possible("move-right",1,((1,6), (1,15), (1,12))).
action_possible("move-down",1,((1,6), (1,14), (1,15))).
action_possible("move-down",1,((1,5), (1,12), (1,13))).
action_possible("move-down",1,((1,4), (1,14), (1,15))).
action_possible("move-left",1,((1,5), (1,9), (1,12))).
action_possible("move-right",1,((1,3), (1,12), (1,9))).
action_possible("move-right",1,((1,2), (1,15), (1,12))).
action_possible("move-right",1,((1,2), (1,13), (1,10))).
action_possible("move-down",1,((1,5), (1,15), (1,16))).
action_possible("move-left",1,((1,4), (1,8), (1,11))).
action_possible("move-up",1,((1,6), (1,15), (1,14))).
action_possible("move-left",1,((1,7), (1,12), (1,15))).
action_possible("move-down",1,((1,2), (1,12), (1,13))).
action_possible("move-right",1,((1,6), (1,14), (1,11))).
action_possible("move-right",1,((1,4), (1,14), (1,11))).
action_possible("move-left",1,((1,4), (1,9), (1,12))).
action_possible("move-down",1,((1,1), (1,9), (1,10))).
action_possible("move-up",1,((1,2), (1,13), (1,12))).
action_possible("move-left",1,((1,2), (1,13), (1,16))).
action_possible("move-up",1,((1,2), (1,16), (1,15))).
action_possible("move-right",1,((1,2), (1,12), (1,9))).
action_possible("move-up",1,((1,6), (1,16), (1,15))).
action_possible("move-right",1,((1,5), (1,15), (1,12))).
action_possible("move-left",1,((1,1), (1,10), (1,13))).
action_possible("move-right",1,((1,7), (1,16), (1,13))).
action_possible("move-down",1,((1,0), (1,8), (1,9))).
action_possible("move-down",1,((1,5), (1,14), (1,15))).
action_possible("move-right",1,((1,5), (1,14), (1,11))).
action_possible("move-up",1,((1,5), (1,16), (1,15))).
action_possible("move-down",1,((1,4), (1,11), (1,12))).
action_possible("move-left",1,((1,5), (1,8), (1,11))).
action_possible("move-down",1,((1,7), (1,15), (1,16))).
action_possible("move-up",1,((1,4), (1,15), (1,14))).
action_possible("move-up",1,((1,7), (1,16), (1,15))).
action_possible("move-down",1,((1,3), (1,8), (1,9))).
action_possible("move-down",1,((1,3), (1,9), (1,10))).
action_possible("move-left",1,((1,0), (1,8), (1,11))).
action_possible("move-up",1,((1,0), (1,9), (1,8))).
action_possible("move-right",1,((1,4), (1,11), (1,8))).
action_possible("move-right",1,((1,4), (1,12), (1,9))).
action_possible("move-right",1,((1,7), (1,15), (1,12))).
action_possible("move-up",1,((1,1), (1,10), (1,9))).
action_possible("move-up",1,((1,3), (1,10), (1,9))).
action_possible("move-up",1,((1,4), (1,12), (1,11))).
action_possible("move-up",1,((1,5), (1,15), (1,14))).
action_possible("move-left",1,((1,7), (1,13), (1,16))).
action_possible("move-left",1,((1,6), (1,12), (1,15))).
action_possible("move-down",1,((1,0), (1,11), (1,12))).
action_possible("move-left",2,((2,1), (2,9), (2,12))).
action_possible("move-left",2,((2,3), (2,9), (2,12))).
action_possible("move-left",2,((2,6), (2,11), (2,14))).
action_possible("move-up",2,((2,1), (2,9), (2,8))).
action_possible("move-right",2,((2,5), (2,12), (2,9))).
action_possible("move-up",2,((2,2), (2,10), (2,9))).
action_possible("move-left",2,((2,2), (2,10), (2,13))).
action_possible("move-down",2,((2,3), (2,14), (2,15))).
action_possible("move-right",2,((2,0), (2,11), (2,8))).
action_possible("move-left",2,((2,5), (2,12), (2,15))).
action_possible("move-down",2,((2,4), (2,15), (2,16))).
action_possible("move-up",2,((2,5), (2,13), (2,12))).
action_possible("move-down",2,((2,6), (2,15), (2,16))).
action_possible("move-left",2,((2,4), (2,11), (2,14))).
action_possible("move-left",2,((2,5), (2,10), (2,13))).
action_possible("move-right",2,((2,3), (2,14), (2,11))).
action_possible("move-up",2,((2,3), (2,15), (2,14))).
action_possible("move-left",2,((2,3), (2,8), (2,11))).
action_possible("move-up",2,((2,0), (2,12), (2,11))).
action_possible("move-right",2,((2,4), (2,15), (2,12))).
action_possible("move-down",2,((2,6), (2,14), (2,15))).
action_possible("move-right",2,((2,6), (2,15), (2,12))).
action_possible("move-down",2,((2,5), (2,12), (2,13))).
action_possible("move-down",2,((2,4), (2,14), (2,15))).
action_possible("move-right",2,((2,3), (2,12), (2,9))).
action_possible("move-left",2,((2,5), (2,9), (2,12))).
action_possible("move-right",2,((2,2), (2,13), (2,10))).
action_possible("move-left",2,((2,4), (2,8), (2,11))).
action_possible("move-right",2,((2,1), (2,12), (2,9))).
action_possible("move-down",2,((2,3), (2,11), (2,12))).
action_possible("move-up",2,((2,6), (2,15), (2,14))).
action_possible("move-left",2,((2,7), (2,12), (2,15))).
action_possible("move-up",2,((2,4), (2,16), (2,15))).
action_possible("move-right",2,((2,6), (2,14), (2,11))).
action_possible("move-right",2,((2,4), (2,14), (2,11))).
action_possible("move-down",2,((2,5), (2,15), (2,16))).
action_possible("move-left",2,((2,4), (2,9), (2,12))).
action_possible("move-down",2,((2,1), (2,9), (2,10))).
action_possible("move-right",2,((2,3), (2,11), (2,8))).
action_possible("move-up",2,((2,6), (2,16), (2,15))).
action_possible("move-right",2,((2,5), (2,15), (2,12))).
action_possible("move-right",2,((2,5), (2,16), (2,13))).
action_possible("move-right",2,((2,7), (2,16), (2,13))).
action_possible("move-down",2,((2,0), (2,8), (2,9))).
action_possible("move-up",2,((2,5), (2,16), (2,15))).
action_possible("move-down",2,((2,4), (2,11), (2,12))).
action_possible("move-down",2,((2,4), (2,12), (2,13))).
action_possible("move-down",2,((2,7), (2,15), (2,16))).
action_possible("move-up",2,((2,4), (2,15), (2,14))).
action_possible("move-up",2,((2,7), (2,16), (2,15))).
action_possible("move-right",2,((2,5), (2,13), (2,10))).
action_possible("move-down",2,((2,1), (2,8), (2,9))).
action_possible("move-up",2,((2,4), (2,13), (2,12))).
action_possible("move-left",2,((2,0), (2,8), (2,11))).
action_possible("move-up",2,((2,0), (2,9), (2,8))).
action_possible("move-right",2,((2,4), (2,12), (2,9))).
action_possible("move-up",2,((2,3), (2,12), (2,11))).
action_possible("move-right",2,((2,7), (2,15), (2,12))).
action_possible("move-right",2,((2,4), (2,11), (2,8))).
action_possible("move-up",2,((2,1), (2,10), (2,9))).
action_possible("move-left",2,((2,5), (2,13), (2,16))).
action_possible("move-up",2,((2,4), (2,12), (2,11))).
action_possible("move-left",2,((2,4), (2,12), (2,15))).
action_possible("move-down",2,((2,2), (2,9), (2,10))).
action_possible("move-left",2,((2,7), (2,13), (2,16))).
action_possible("move-left",2,((2,3), (2,11), (2,14))).
action_possible("move-left",2,((2,6), (2,12), (2,15))).
action_possible("move-down",2,((2,0), (2,11), (2,12))).
action_possible("move-left",3,((3,1), (3,9), (3,12))).
action_possible("move-left",3,((3,3), (3,9), (3,12))).
action_possible("move-left",3,((3,6), (3,11), (3,14))).
action_possible("move-up",3,((3,1), (3,9), (3,8))).
action_possible("move-right",3,((3,5), (3,12), (3,9))).
action_possible("move-up",3,((3,2), (3,10), (3,9))).
action_possible("move-left",3,((3,2), (3,10), (3,13))).
action_possible("move-down",3,((3,3), (3,14), (3,15))).
action_possible("move-right",3,((3,0), (3,11), (3,8))).
action_possible("move-left",3,((3,5), (3,12), (3,15))).
action_possible("move-down",3,((3,4), (3,15), (3,16))).
action_possible("move-up",3,((3,5), (3,13), (3,12))).
action_possible("move-down",3,((3,6), (3,15), (3,16))).
action_possible("move-left",3,((3,4), (3,11), (3,14))).
action_possible("move-left",3,((3,5), (3,10), (3,13))).
action_possible("move-right",3,((3,3), (3,14), (3,11))).
action_possible("move-up",3,((3,3), (3,15), (3,14))).
action_possible("move-left",3,((3,3), (3,8), (3,11))).
action_possible("move-up",3,((3,0), (3,12), (3,11))).
action_possible("move-right",3,((3,4), (3,15), (3,12))).
action_possible("move-down",3,((3,6), (3,14), (3,15))).
action_possible("move-right",3,((3,6), (3,15), (3,12))).
action_possible("move-down",3,((3,5), (3,12), (3,13))).
action_possible("move-down",3,((3,4), (3,14), (3,15))).
action_possible("move-right",3,((3,3), (3,12), (3,9))).
action_possible("move-left",3,((3,5), (3,9), (3,12))).
action_possible("move-right",3,((3,2), (3,13), (3,10))).
action_possible("move-left",3,((3,4), (3,8), (3,11))).
action_possible("move-right",3,((3,1), (3,12), (3,9))).
action_possible("move-down",3,((3,3), (3,11), (3,12))).
action_possible("move-up",3,((3,6), (3,15), (3,14))).
action_possible("move-left",3,((3,7), (3,12), (3,15))).
action_possible("move-up",3,((3,4), (3,16), (3,15))).
action_possible("move-right",3,((3,6), (3,14), (3,11))).
action_possible("move-right",3,((3,4), (3,14), (3,11))).
action_possible("move-down",3,((3,5), (3,15), (3,16))).
action_possible("move-left",3,((3,4), (3,9), (3,12))).
action_possible("move-down",3,((3,1), (3,9), (3,10))).
action_possible("move-right",3,((3,3), (3,11), (3,8))).
action_possible("move-up",3,((3,6), (3,16), (3,15))).
action_possible("move-right",3,((3,5), (3,15), (3,12))).
action_possible("move-right",3,((3,5), (3,16), (3,13))).
action_possible("move-right",3,((3,7), (3,16), (3,13))).
action_possible("move-down",3,((3,0), (3,8), (3,9))).
action_possible("move-up",3,((3,5), (3,16), (3,15))).
action_possible("move-down",3,((3,4), (3,11), (3,12))).
action_possible("move-down",3,((3,4), (3,12), (3,13))).
action_possible("move-down",3,((3,7), (3,15), (3,16))).
action_possible("move-up",3,((3,4), (3,15), (3,14))).
action_possible("move-up",3,((3,7), (3,16), (3,15))).
action_possible("move-right",3,((3,5), (3,13), (3,10))).
action_possible("move-down",3,((3,1), (3,8), (3,9))).
action_possible("move-up",3,((3,4), (3,13), (3,12))).
action_possible("move-left",3,((3,0), (3,8), (3,11))).
action_possible("move-up",3,((3,0), (3,9), (3,8))).
action_possible("move-right",3,((3,4), (3,12), (3,9))).
action_possible("move-up",3,((3,3), (3,12), (3,11))).
action_possible("move-right",3,((3,7), (3,15), (3,12))).
action_possible("move-right",3,((3,4), (3,11), (3,8))).
action_possible("move-up",3,((3,1), (3,10), (3,9))).
action_possible("move-left",3,((3,5), (3,13), (3,16))).
action_possible("move-up",3,((3,4), (3,12), (3,11))).
action_possible("move-left",3,((3,4), (3,12), (3,15))).
action_possible("move-down",3,((3,2), (3,9), (3,10))).
action_possible("move-left",3,((3,7), (3,13), (3,16))).
action_possible("move-left",3,((3,3), (3,11), (3,14))).
action_possible("move-left",3,((3,6), (3,12), (3,15))).
action_possible("move-down",3,((3,0), (3,11), (3,12))).
action_possible("move-up",4,((4,3), (4,9), (4,8))).
action_possible("move-left",4,((4,3), (4,9), (4,12))).
action_possible("move-right",4,((4,2), (4,16), (4,13))).
action_possible("move-right",4,((4,5), (4,12), (4,9))).
action_possible("move-down",4,((4,5), (4,8), (4,9))).
action_possible("move-up",4,((4,2), (4,10), (4,9))).
action_possible("move-left",4,((4,2), (4,10), (4,13))).
action_possible("move-down",4,((4,0), (4,12), (4,13))).
action_possible("move-up",4,((4,0), (4,13), (4,12))).
action_possible("move-left",4,((4,0), (4,13), (4,16))).
action_possible("move-down",4,((4,5), (4,9), (4,10))).
action_possible("move-right",4,((4,3), (4,15), (4,12))).
action_possible("move-left",4,((4,2), (4,9), (4,12))).
action_possible("move-left",4,((4,5), (4,10), (4,13))).
action_possible("move-left",4,((4,4), (4,11), (4,14))).
action_possible("move-down",4,((4,4), (4,8), (4,9))).
action_possible("move-right",4,((4,3), (4,13), (4,10))).
action_possible("move-down",4,((4,3), (4,12), (4,13))).
action_possible("move-up",4,((4,5), (4,13), (4,12))).
action_possible("move-up",4,((4,5), (4,10), (4,9))).
action_possible("move-down",4,((4,6), (4,8), (4,9))).
action_possible("move-right",4,((4,2), (4,15), (4,12))).
action_possible("move-up",4,((4,1), (4,15), (4,14))).
action_possible("move-left",4,((4,5), (4,9), (4,12))).
action_possible("move-down",4,((4,5), (4,12), (4,13))).
action_possible("move-right",4,((4,3), (4,12), (4,9))).
action_possible("move-right",4,((4,2), (4,13), (4,10))).
action_possible("move-left",4,((4,4), (4,8), (4,11))).
action_possible("move-down",4,((4,3), (4,11), (4,12))).
action_possible("move-left",4,((4,7), (4,12), (4,15))).
action_possible("move-down",4,((4,2), (4,12), (4,13))).
action_possible("move-right",4,((4,4), (4,14), (4,11))).
action_possible("move-left",4,((4,6), (4,8), (4,11))).
action_possible("move-up",4,((4,4), (4,9), (4,8))).
action_possible("move-left",4,((4,4), (4,9), (4,12))).
action_possible("move-down",4,((4,7), (4,14), (4,15))).
action_possible("move-up",4,((4,2), (4,13), (4,12))).
action_possible("move-left",4,((4,2), (4,13), (4,16))).
action_possible("move-right",4,((4,2), (4,12), (4,9))).
action_possible("move-up",4,((4,6), (4,9), (4,8))).
action_possible("move-left",4,((4,6), (4,9), (4,12))).
action_possible("move-down",4,((4,0), (4,15), (4,16))).
action_possible("move-up",4,((4,3), (4,13), (4,12))).
action_possible("move-left",4,((4,3), (4,13), (4,16))).
action_possible("move-left",4,((4,1), (4,11), (4,14))).
action_possible("move-right",4,((4,0), (4,16), (4,13))).
action_possible("move-down",4,((4,4), (4,11), (4,12))).
action_possible("move-up",4,((4,5), (4,9), (4,8))).
action_possible("move-down",4,((4,7), (4,15), (4,16))).
action_possible("move-right",4,((4,5), (4,13), (4,10))).
action_possible("move-down",4,((4,3), (4,8), (4,9))).
action_possible("move-left",4,((4,3), (4,12), (4,15))).
action_possible("move-down",4,((4,3), (4,9), (4,10))).
action_possible("move-right",4,((4,4), (4,11), (4,8))).
action_possible("move-right",4,((4,4), (4,12), (4,9))).
action_possible("move-up",4,((4,3), (4,12), (4,11))).
action_possible("move-right",4,((4,7), (4,15), (4,12))).
action_possible("move-up",4,((4,0), (4,16), (4,15))).
action_possible("move-left",4,((4,3), (4,10), (4,13))).
action_possible("move-right",4,((4,6), (4,12), (4,9))).
action_possible("move-down",4,((4,1), (4,14), (4,15))).
action_possible("move-up",4,((4,3), (4,10), (4,9))).
action_possible("move-right",4,((4,3), (4,16), (4,13))).
action_possible("move-up",4,((4,4), (4,12), (4,11))).
action_possible("move-up",4,((4,7), (4,15), (4,14))).
action_possible("move-right",4,((4,1), (4,14), (4,11))).
action_possible("move-up",4,((4,7), (4,16), (4,15))).
action_possible("move-down",4,((4,2), (4,9), (4,10))).
action_possible("move-left",4,((4,2), (4,12), (4,15))).
action_possible("move-right",4,((4,6), (4,11), (4,8))).
action_possible("move-left",5,((5,1), (5,9), (5,12))).
action_possible("move-left",5,((5,6), (5,10), (5,13))).
action_possible("move-up",5,((5,6), (5,13), (5,12))).
action_possible("move-up",5,((5,1), (5,9), (5,8))).
action_possible("move-up",5,((5,2), (5,10), (5,9))).
action_possible("move-left",5,((5,2), (5,10), (5,13))).
action_possible("move-down",5,((5,3), (5,14), (5,15))).
action_possible("move-right",5,((5,0), (5,11), (5,8))).
action_possible("move-right",5,((5,1), (5,13), (5,10))).
action_possible("move-up",5,((5,2), (5,9), (5,8))).
action_possible("move-left",5,((5,2), (5,9), (5,12))).
action_possible("move-up",5,((5,5), (5,13), (5,12))).
action_possible("move-left",5,((5,4), (5,11), (5,14))).
action_possible("move-right",5,((5,0), (5,12), (5,9))).
action_possible("move-down",5,((5,4), (5,8), (5,9))).
action_possible("move-right",5,((5,3), (5,14), (5,11))).
action_possible("move-up",5,((5,3), (5,15), (5,14))).
action_possible("move-down",5,((5,1), (5,12), (5,13))).
action_possible("move-right",5,((5,6), (5,15), (5,12))).
action_possible("move-down",5,((5,5), (5,12), (5,13))).
action_possible("move-up",5,((5,6), (5,10), (5,9))).
action_possible("move-right",5,((5,2), (5,13), (5,10))).
action_possible("move-right",5,((5,6), (5,16), (5,13))).
action_possible("move-left",5,((5,4), (5,8), (5,11))).
action_possible("move-right",5,((5,1), (5,12), (5,9))).
action_possible("move-down",5,((5,1), (5,11), (5,12))).
action_possible("move-down",5,((5,5), (5,15), (5,16))).
action_possible("move-left",5,((5,7), (5,12), (5,15))).
action_possible("move-down",5,((5,2), (5,12), (5,13))).
action_possible("move-right",5,((5,4), (5,14), (5,11))).
action_possible("move-up",5,((5,4), (5,9), (5,8))).
action_possible("move-left",5,((5,1), (5,12), (5,15))).
action_possible("move-down",5,((5,1), (5,9), (5,10))).
action_possible("move-down",5,((5,7), (5,14), (5,15))).
action_possible("move-up",5,((5,2), (5,13), (5,12))).
action_possible("move-left",5,((5,4), (5,9), (5,12))).
action_possible("move-right",5,((5,2), (5,12), (5,9))).
action_possible("move-up",5,((5,1), (5,12), (5,11))).
action_possible("move-left",5,((5,6), (5,9), (5,12))).
action_possible("move-up",5,((5,1), (5,13), (5,12))).
action_possible("move-right",5,((5,5), (5,16), (5,13))).
action_possible("move-down",5,((5,0), (5,8), (5,9))).
action_possible("move-left",5,((5,1), (5,13), (5,16))).
action_possible("move-left",5,((5,1), (5,10), (5,13))).
action_possible("move-right",5,((5,6), (5,13), (5,10))).
action_possible("move-up",5,((5,5), (5,16), (5,15))).
action_possible("move-down",5,((5,4), (5,11), (5,12))).
action_possible("move-down",5,((5,7), (5,15), (5,16))).
action_possible("move-down",5,((5,6), (5,12), (5,13))).
action_possible("move-down",5,((5,1), (5,8), (5,9))).
action_possible("move-right",5,((5,4), (5,11), (5,8))).
action_possible("move-up",5,((5,0), (5,9), (5,8))).
action_possible("move-left",5,((5,0), (5,8), (5,11))).
action_possible("move-left",5,((5,0), (5,9), (5,12))).
action_possible("move-right",5,((5,7), (5,15), (5,12))).
action_possible("move-right",5,((5,4), (5,12), (5,9))).
action_possible("move-right",5,((5,1), (5,15), (5,12))).
action_possible("move-right",5,((5,6), (5,12), (5,9))).
action_possible("move-up",5,((5,1), (5,10), (5,9))).
action_possible("move-right",5,((5,1), (5,16), (5,13))).
action_possible("move-left",5,((5,5), (5,13), (5,16))).
action_possible("move-up",5,((5,4), (5,12), (5,11))).
action_possible("move-down",5,((5,2), (5,8), (5,9))).
action_possible("move-down",5,((5,2), (5,9), (5,10))).
action_possible("move-up",5,((5,7), (5,15), (5,14))).
action_possible("move-up",5,((5,7), (5,16), (5,15))).
action_possible("move-left",5,((5,3), (5,11), (5,14))).
action_possible("move-left",5,((5,6), (5,12), (5,15))).
action_possible("move-down",5,((5,6), (5,9), (5,10))).
action_possible("move-left",5,((5,6), (5,13), (5,16))).
