max_arity(2).
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
objects((0,7)).
obj_type(1,(0,7)).
objects((0,0)).
obj_type(0,(0,0)).
objects((0,6)).
obj_type(1,(0,6)).
objects((0,4)).
obj_type(0,(0,4)).
objects((0,5)).
obj_type(1,(0,5)).
objects((0,2)).
obj_type(0,(0,2)).
objects((0,9)).
obj_type(1,(0,9)).
objects((0,3)).
obj_type(0,(0,3)).
objects((0,1)).
obj_type(0,(0,1)).
objects((0,8)).
obj_type(1,(0,8)).
objects((1,7)).
obj_type(1,(1,7)).
objects((1,0)).
obj_type(0,(1,0)).
objects((1,2)).
obj_type(0,(1,2)).
objects((1,1)).
obj_type(0,(1,1)).
objects((1,3)).
obj_type(0,(1,3)).
objects((1,5)).
obj_type(1,(1,5)).
objects((1,4)).
obj_type(0,(1,4)).
objects((1,8)).
obj_type(1,(1,8)).
objects((1,9)).
obj_type(1,(1,9)).
objects((1,6)).
obj_type(1,(1,6)).
objects((2,7)).
obj_type(1,(2,7)).
objects((2,0)).
obj_type(0,(2,0)).
objects((2,6)).
obj_type(1,(2,6)).
objects((2,4)).
obj_type(0,(2,4)).
objects((2,5)).
obj_type(1,(2,5)).
objects((2,2)).
obj_type(0,(2,2)).
objects((2,9)).
obj_type(1,(2,9)).
objects((2,3)).
obj_type(0,(2,3)).
objects((2,1)).
obj_type(0,(2,1)).
objects((2,8)).
obj_type(1,(2,8)).
objects((3,7)).
obj_type(1,(3,7)).
objects((3,0)).
obj_type(0,(3,0)).
objects((3,6)).
obj_type(1,(3,6)).
objects((3,4)).
obj_type(0,(3,4)).
objects((3,5)).
obj_type(1,(3,5)).
objects((3,2)).
obj_type(0,(3,2)).
objects((3,9)).
obj_type(1,(3,9)).
objects((3,3)).
obj_type(0,(3,3)).
objects((3,1)).
obj_type(0,(3,1)).
objects((3,8)).
obj_type(1,(3,8)).
objects((4,7)).
obj_type(1,(4,7)).
objects((4,0)).
obj_type(0,(4,0)).
objects((4,6)).
obj_type(1,(4,6)).
objects((4,4)).
obj_type(0,(4,4)).
objects((4,5)).
obj_type(1,(4,5)).
objects((4,2)).
obj_type(0,(4,2)).
objects((4,9)).
obj_type(1,(4,9)).
objects((4,3)).
obj_type(0,(4,3)).
objects((4,1)).
obj_type(0,(4,1)).
objects((4,8)).
obj_type(1,(4,8)).
objects((5,5)).
obj_type(1,(5,5)).
objects((5,2)).
obj_type(0,(5,2)).
objects((5,7)).
obj_type(1,(5,7)).
objects((5,1)).
obj_type(0,(5,1)).
objects((5,3)).
obj_type(0,(5,3)).
objects((5,8)).
obj_type(1,(5,8)).
objects((5,0)).
obj_type(0,(5,0)).
objects((5,6)).
obj_type(1,(5,6)).
objects((5,4)).
obj_type(0,(5,4)).
objects((5,9)).
obj_type(1,(5,9)).
types(0).
types(1).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
action_arity("sail",2).
action_type_list("sail",(Type0, Type1)) :- action_arg_type(Type0,("sail",0)), action_arg_type(Type1,("sail",1)).
action_candidate("sail",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("sail",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arity("board",2).
action_type_list("board",(Type0, Type1)) :- action_arg_type(Type0,("board",0)), action_arg_type(Type1,("board",1)).
action_candidate("board",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("board",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arity("debark",2).
action_type_list("debark",(Type0, Type1)) :- action_arg_type(Type0,("debark",0)), action_arg_type(Type1,("debark",1)).
action_candidate("debark",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("debark",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arg_type(0,("sail",0)).
action_arg_type(1,("board",0)).
action_arg_type(0,("board",1)).
action_arg_type(1,("debark",0)).
action_arg_type(0,("debark",1)).
action_arg_type(0,("sail",1)).
action_possible("board",0,((0,7), (0,0))).
action_possible("debark",0,((0,6), (0,4))).
action_possible("debark",0,((0,5), (0,2))).
action_possible("debark",0,((0,7), (0,2))).
action_possible("board",0,((0,9), (0,3))).
action_possible("sail",0,((0,1), (0,2))).
action_possible("sail",0,((0,2), (0,3))).
action_possible("debark",0,((0,9), (0,0))).
action_possible("board",0,((0,8), (0,3))).
action_possible("board",0,((0,9), (0,4))).
action_possible("board",0,((0,7), (0,1))).
action_possible("board",0,((0,6), (0,4))).
action_possible("debark",0,((0,5), (0,3))).
action_possible("sail",0,((0,3), (0,0))).
action_possible("debark",0,((0,6), (0,0))).
action_possible("sail",0,((0,2), (0,4))).
action_possible("sail",0,((0,0), (0,1))).
action_possible("board",0,((0,5), (0,2))).
action_possible("board",0,((0,7), (0,2))).
action_possible("debark",0,((0,5), (0,4))).
action_possible("sail",0,((0,3), (0,1))).
action_possible("debark",0,((0,8), (0,4))).
action_possible("sail",0,((0,4), (0,2))).
action_possible("debark",0,((0,6), (0,1))).
action_possible("debark",0,((0,9), (0,1))).
action_possible("debark",0,((0,9), (0,2))).
action_possible("board",0,((0,5), (0,3))).
action_possible("board",0,((0,9), (0,0))).
action_possible("board",0,((0,6), (0,0))).
action_possible("sail",0,((0,3), (0,2))).
action_possible("debark",0,((0,6), (0,2))).
action_possible("sail",0,((0,2), (0,0))).
action_possible("debark",0,((0,5), (0,0))).
action_possible("board",0,((0,5), (0,4))).
action_possible("board",0,((0,9), (0,1))).
action_possible("sail",0,((0,4), (0,3))).
action_possible("board",0,((0,6), (0,1))).
action_possible("debark",0,((0,7), (0,3))).
action_possible("debark",0,((0,8), (0,0))).
action_possible("board",0,((0,8), (0,4))).
action_possible("sail",0,((0,1), (0,3))).
action_possible("board",0,((0,9), (0,2))).
action_possible("debark",0,((0,6), (0,3))).
action_possible("debark",0,((0,7), (0,4))).
action_possible("debark",0,((0,5), (0,1))).
action_possible("sail",0,((0,0), (0,2))).
action_possible("board",0,((0,6), (0,2))).
action_possible("board",0,((0,7), (0,3))).
action_possible("sail",0,((0,1), (0,4))).
action_possible("debark",0,((0,8), (0,1))).
action_possible("board",0,((0,5), (0,0))).
action_possible("sail",0,((0,0), (0,3))).
action_possible("board",0,((0,8), (0,0))).
action_possible("board",0,((0,6), (0,3))).
action_possible("board",0,((0,7), (0,4))).
action_possible("board",0,((0,5), (0,1))).
action_possible("debark",0,((0,8), (0,2))).
action_possible("sail",0,((0,4), (0,0))).
action_possible("debark",0,((0,9), (0,3))).
action_possible("debark",0,((0,7), (0,0))).
action_possible("board",0,((0,8), (0,1))).
action_possible("sail",0,((0,1), (0,0))).
action_possible("sail",0,((0,2), (0,1))).
action_possible("debark",0,((0,8), (0,3))).
action_possible("sail",0,((0,4), (0,1))).
action_possible("sail",0,((0,0), (0,4))).
action_possible("debark",0,((0,7), (0,1))).
action_possible("board",0,((0,8), (0,2))).
action_possible("debark",0,((0,9), (0,4))).
action_possible("sail",0,((0,3), (0,4))).
action_possible("board",1,((1,7), (1,0))).
action_possible("debark",1,((1,7), (1,2))).
action_possible("sail",1,((1,1), (1,2))).
action_possible("sail",1,((1,2), (1,3))).
action_possible("board",1,((1,7), (1,1))).
action_possible("debark",1,((1,5), (1,3))).
action_possible("sail",1,((1,3), (1,0))).
action_possible("sail",1,((1,2), (1,4))).
action_possible("sail",1,((1,0), (1,1))).
action_possible("board",1,((1,7), (1,2))).
action_possible("sail",1,((1,3), (1,1))).
action_possible("debark",1,((1,8), (1,4))).
action_possible("sail",1,((1,4), (1,2))).
action_possible("debark",1,((1,9), (1,2))).
action_possible("board",1,((1,5), (1,3))).
action_possible("sail",1,((1,3), (1,2))).
action_possible("sail",1,((1,2), (1,0))).
action_possible("sail",1,((1,4), (1,3))).
action_possible("debark",1,((1,7), (1,3))).
action_possible("board",1,((1,8), (1,4))).
action_possible("sail",1,((1,1), (1,3))).
action_possible("board",1,((1,9), (1,2))).
action_possible("debark",1,((1,6), (1,3))).
action_possible("debark",1,((1,7), (1,4))).
action_possible("sail",1,((1,0), (1,2))).
action_possible("sail",1,((1,1), (1,4))).
action_possible("board",1,((1,7), (1,3))).
action_possible("sail",1,((1,0), (1,3))).
action_possible("board",1,((1,6), (1,3))).
action_possible("board",1,((1,7), (1,4))).
action_possible("sail",1,((1,4), (1,0))).
action_possible("debark",1,((1,7), (1,0))).
action_possible("sail",1,((1,1), (1,0))).
action_possible("sail",1,((1,2), (1,1))).
action_possible("sail",1,((1,4), (1,1))).
action_possible("sail",1,((1,0), (1,4))).
action_possible("debark",1,((1,7), (1,1))).
action_possible("sail",1,((1,3), (1,4))).
action_possible("board",2,((2,7), (2,0))).
action_possible("debark",2,((2,6), (2,4))).
action_possible("debark",2,((2,5), (2,2))).
action_possible("debark",2,((2,7), (2,2))).
action_possible("board",2,((2,9), (2,3))).
action_possible("sail",2,((2,1), (2,2))).
action_possible("sail",2,((2,2), (2,3))).
action_possible("debark",2,((2,9), (2,0))).
action_possible("board",2,((2,8), (2,3))).
action_possible("board",2,((2,9), (2,4))).
action_possible("board",2,((2,7), (2,1))).
action_possible("board",2,((2,6), (2,4))).
action_possible("debark",2,((2,5), (2,3))).
action_possible("sail",2,((2,3), (2,0))).
action_possible("debark",2,((2,6), (2,0))).
action_possible("sail",2,((2,2), (2,4))).
action_possible("sail",2,((2,0), (2,1))).
action_possible("board",2,((2,5), (2,2))).
action_possible("board",2,((2,7), (2,2))).
action_possible("debark",2,((2,5), (2,4))).
action_possible("sail",2,((2,3), (2,1))).
action_possible("debark",2,((2,8), (2,4))).
action_possible("sail",2,((2,4), (2,2))).
action_possible("debark",2,((2,6), (2,1))).
action_possible("debark",2,((2,9), (2,1))).
action_possible("debark",2,((2,9), (2,2))).
action_possible("board",2,((2,5), (2,3))).
action_possible("board",2,((2,9), (2,0))).
action_possible("board",2,((2,6), (2,0))).
action_possible("sail",2,((2,3), (2,2))).
action_possible("debark",2,((2,6), (2,2))).
action_possible("sail",2,((2,2), (2,0))).
action_possible("debark",2,((2,5), (2,0))).
action_possible("board",2,((2,5), (2,4))).
action_possible("board",2,((2,9), (2,1))).
action_possible("sail",2,((2,4), (2,3))).
action_possible("board",2,((2,6), (2,1))).
action_possible("debark",2,((2,7), (2,3))).
action_possible("debark",2,((2,8), (2,0))).
action_possible("board",2,((2,8), (2,4))).
action_possible("sail",2,((2,1), (2,3))).
action_possible("board",2,((2,9), (2,2))).
action_possible("debark",2,((2,6), (2,3))).
action_possible("debark",2,((2,7), (2,4))).
action_possible("debark",2,((2,5), (2,1))).
action_possible("sail",2,((2,0), (2,2))).
action_possible("board",2,((2,6), (2,2))).
action_possible("board",2,((2,7), (2,3))).
action_possible("sail",2,((2,1), (2,4))).
action_possible("debark",2,((2,8), (2,1))).
action_possible("board",2,((2,5), (2,0))).
action_possible("sail",2,((2,0), (2,3))).
action_possible("board",2,((2,8), (2,0))).
action_possible("board",2,((2,6), (2,3))).
action_possible("board",2,((2,7), (2,4))).
action_possible("board",2,((2,5), (2,1))).
action_possible("debark",2,((2,8), (2,2))).
action_possible("sail",2,((2,4), (2,0))).
action_possible("debark",2,((2,9), (2,3))).
action_possible("debark",2,((2,7), (2,0))).
action_possible("board",2,((2,8), (2,1))).
action_possible("sail",2,((2,1), (2,0))).
action_possible("sail",2,((2,2), (2,1))).
action_possible("debark",2,((2,8), (2,3))).
action_possible("sail",2,((2,4), (2,1))).
action_possible("sail",2,((2,0), (2,4))).
action_possible("debark",2,((2,7), (2,1))).
action_possible("board",2,((2,8), (2,2))).
action_possible("debark",2,((2,9), (2,4))).
action_possible("sail",2,((2,3), (2,4))).
action_possible("board",3,((3,7), (3,0))).
action_possible("debark",3,((3,6), (3,4))).
action_possible("debark",3,((3,5), (3,2))).
action_possible("debark",3,((3,7), (3,2))).
action_possible("board",3,((3,9), (3,3))).
action_possible("sail",3,((3,1), (3,2))).
action_possible("sail",3,((3,2), (3,3))).
action_possible("debark",3,((3,9), (3,0))).
action_possible("board",3,((3,8), (3,3))).
action_possible("board",3,((3,9), (3,4))).
action_possible("board",3,((3,7), (3,1))).
action_possible("board",3,((3,6), (3,4))).
action_possible("debark",3,((3,5), (3,3))).
action_possible("sail",3,((3,3), (3,0))).
action_possible("debark",3,((3,6), (3,0))).
action_possible("sail",3,((3,2), (3,4))).
action_possible("sail",3,((3,0), (3,1))).
action_possible("board",3,((3,5), (3,2))).
action_possible("board",3,((3,7), (3,2))).
action_possible("debark",3,((3,5), (3,4))).
action_possible("sail",3,((3,3), (3,1))).
action_possible("debark",3,((3,8), (3,4))).
action_possible("sail",3,((3,4), (3,2))).
action_possible("debark",3,((3,6), (3,1))).
action_possible("debark",3,((3,9), (3,1))).
action_possible("debark",3,((3,9), (3,2))).
action_possible("board",3,((3,5), (3,3))).
action_possible("board",3,((3,9), (3,0))).
action_possible("board",3,((3,6), (3,0))).
action_possible("sail",3,((3,3), (3,2))).
action_possible("debark",3,((3,6), (3,2))).
action_possible("sail",3,((3,2), (3,0))).
action_possible("debark",3,((3,5), (3,0))).
action_possible("board",3,((3,5), (3,4))).
action_possible("board",3,((3,9), (3,1))).
action_possible("sail",3,((3,4), (3,3))).
action_possible("board",3,((3,6), (3,1))).
action_possible("debark",3,((3,7), (3,3))).
action_possible("debark",3,((3,8), (3,0))).
action_possible("board",3,((3,8), (3,4))).
action_possible("sail",3,((3,1), (3,3))).
action_possible("board",3,((3,9), (3,2))).
action_possible("debark",3,((3,6), (3,3))).
action_possible("debark",3,((3,7), (3,4))).
action_possible("debark",3,((3,5), (3,1))).
action_possible("sail",3,((3,0), (3,2))).
action_possible("board",3,((3,6), (3,2))).
action_possible("board",3,((3,7), (3,3))).
action_possible("board",3,((3,5), (3,0))).
action_possible("sail",3,((3,1), (3,4))).
action_possible("debark",3,((3,8), (3,1))).
action_possible("sail",3,((3,0), (3,3))).
action_possible("board",3,((3,8), (3,0))).
action_possible("board",3,((3,6), (3,3))).
action_possible("board",3,((3,7), (3,4))).
action_possible("board",3,((3,5), (3,1))).
action_possible("debark",3,((3,8), (3,2))).
action_possible("sail",3,((3,4), (3,0))).
action_possible("debark",3,((3,9), (3,3))).
action_possible("debark",3,((3,7), (3,0))).
action_possible("board",3,((3,8), (3,1))).
action_possible("sail",3,((3,1), (3,0))).
action_possible("sail",3,((3,2), (3,1))).
action_possible("debark",3,((3,8), (3,3))).
action_possible("sail",3,((3,4), (3,1))).
action_possible("sail",3,((3,0), (3,4))).
action_possible("debark",3,((3,7), (3,1))).
action_possible("board",3,((3,8), (3,2))).
action_possible("debark",3,((3,9), (3,4))).
action_possible("sail",3,((3,3), (3,4))).
action_possible("board",4,((4,7), (4,0))).
action_possible("debark",4,((4,6), (4,4))).
action_possible("debark",4,((4,5), (4,2))).
action_possible("debark",4,((4,7), (4,2))).
action_possible("board",4,((4,9), (4,3))).
action_possible("sail",4,((4,1), (4,2))).
action_possible("sail",4,((4,2), (4,3))).
action_possible("debark",4,((4,9), (4,0))).
action_possible("board",4,((4,8), (4,3))).
action_possible("board",4,((4,9), (4,4))).
action_possible("board",4,((4,7), (4,1))).
action_possible("board",4,((4,6), (4,4))).
action_possible("debark",4,((4,5), (4,3))).
action_possible("sail",4,((4,3), (4,0))).
action_possible("debark",4,((4,6), (4,0))).
action_possible("sail",4,((4,2), (4,4))).
action_possible("sail",4,((4,0), (4,1))).
action_possible("board",4,((4,5), (4,2))).
action_possible("board",4,((4,7), (4,2))).
action_possible("debark",4,((4,9), (4,1))).
action_possible("sail",4,((4,3), (4,1))).
action_possible("debark",4,((4,5), (4,4))).
action_possible("sail",4,((4,4), (4,2))).
action_possible("debark",4,((4,6), (4,1))).
action_possible("debark",4,((4,8), (4,4))).
action_possible("debark",4,((4,9), (4,2))).
action_possible("board",4,((4,9), (4,0))).
action_possible("board",4,((4,5), (4,3))).
action_possible("board",4,((4,6), (4,0))).
action_possible("sail",4,((4,3), (4,2))).
action_possible("debark",4,((4,6), (4,2))).
action_possible("sail",4,((4,2), (4,0))).
action_possible("debark",4,((4,5), (4,0))).
action_possible("board",4,((4,9), (4,1))).
action_possible("board",4,((4,5), (4,4))).
action_possible("sail",4,((4,4), (4,3))).
action_possible("board",4,((4,6), (4,1))).
action_possible("debark",4,((4,7), (4,3))).
action_possible("debark",4,((4,8), (4,0))).
action_possible("board",4,((4,8), (4,4))).
action_possible("sail",4,((4,1), (4,3))).
action_possible("board",4,((4,9), (4,2))).
action_possible("debark",4,((4,6), (4,3))).
action_possible("debark",4,((4,7), (4,4))).
action_possible("debark",4,((4,5), (4,1))).
action_possible("sail",4,((4,0), (4,2))).
action_possible("board",4,((4,6), (4,2))).
action_possible("sail",4,((4,1), (4,4))).
action_possible("board",4,((4,5), (4,0))).
action_possible("debark",4,((4,8), (4,1))).
action_possible("board",4,((4,7), (4,3))).
action_possible("board",4,((4,8), (4,0))).
action_possible("sail",4,((4,0), (4,3))).
action_possible("board",4,((4,6), (4,3))).
action_possible("board",4,((4,7), (4,4))).
action_possible("board",4,((4,5), (4,1))).
action_possible("debark",4,((4,8), (4,2))).
action_possible("sail",4,((4,4), (4,0))).
action_possible("debark",4,((4,9), (4,3))).
action_possible("debark",4,((4,7), (4,0))).
action_possible("board",4,((4,8), (4,1))).
action_possible("sail",4,((4,1), (4,0))).
action_possible("sail",4,((4,2), (4,1))).
action_possible("debark",4,((4,8), (4,3))).
action_possible("sail",4,((4,0), (4,4))).
action_possible("sail",4,((4,4), (4,1))).
action_possible("debark",4,((4,7), (4,1))).
action_possible("board",4,((4,8), (4,2))).
action_possible("debark",4,((4,9), (4,4))).
action_possible("sail",4,((4,3), (4,4))).
action_possible("debark",5,((5,5), (5,2))).
action_possible("debark",5,((5,7), (5,2))).
action_possible("sail",5,((5,1), (5,2))).
action_possible("sail",5,((5,2), (5,3))).
action_possible("board",5,((5,8), (5,3))).
action_possible("sail",5,((5,3), (5,0))).
action_possible("debark",5,((5,6), (5,0))).
action_possible("sail",5,((5,2), (5,4))).
action_possible("sail",5,((5,0), (5,1))).
action_possible("board",5,((5,5), (5,2))).
action_possible("board",5,((5,7), (5,2))).
action_possible("debark",5,((5,9), (5,1))).
action_possible("sail",5,((5,3), (5,1))).
action_possible("debark",5,((5,8), (5,4))).
action_possible("sail",5,((5,4), (5,2))).
action_possible("board",5,((5,6), (5,0))).
action_possible("sail",5,((5,3), (5,2))).
action_possible("sail",5,((5,2), (5,0))).
action_possible("board",5,((5,9), (5,1))).
action_possible("sail",5,((5,4), (5,3))).
action_possible("debark",5,((5,8), (5,0))).
action_possible("board",5,((5,8), (5,4))).
action_possible("sail",5,((5,1), (5,3))).
action_possible("sail",5,((5,0), (5,2))).
action_possible("sail",5,((5,1), (5,4))).
action_possible("debark",5,((5,8), (5,1))).
action_possible("sail",5,((5,0), (5,3))).
action_possible("board",5,((5,8), (5,0))).
action_possible("debark",5,((5,8), (5,2))).
action_possible("sail",5,((5,4), (5,0))).
action_possible("board",5,((5,8), (5,1))).
action_possible("sail",5,((5,1), (5,0))).
action_possible("sail",5,((5,2), (5,1))).
action_possible("debark",5,((5,8), (5,3))).
action_possible("sail",5,((5,4), (5,1))).
action_possible("sail",5,((5,0), (5,4))).
action_possible("board",5,((5,8), (5,2))).
action_possible("sail",5,((5,3), (5,4))).
