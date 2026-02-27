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
objects((0,3)).
obj_type(1,(0,3)).
objects((0,8)).
obj_type(0,(0,8)).
objects((0,9)).
obj_type(0,(0,9)).
objects((0,2)).
obj_type(1,(0,2)).
objects((0,7)).
obj_type(0,(0,7)).
objects((0,4)).
obj_type(1,(0,4)).
objects((1,3)).
obj_type(1,(1,3)).
objects((1,8)).
obj_type(0,(1,8)).
objects((1,1)).
obj_type(1,(1,1)).
objects((1,7)).
obj_type(0,(1,7)).
objects((1,9)).
obj_type(0,(1,9)).
objects((1,4)).
obj_type(1,(1,4)).
objects((1,2)).
obj_type(1,(1,2)).
objects((1,6)).
obj_type(0,(1,6)).
objects((2,4)).
obj_type(1,(2,4)).
objects((2,7)).
obj_type(0,(2,7)).
objects((2,2)).
obj_type(1,(2,2)).
objects((2,6)).
obj_type(0,(2,6)).
objects((2,8)).
obj_type(0,(2,8)).
objects((2,9)).
obj_type(0,(2,9)).
objects((2,1)).
obj_type(1,(2,1)).
objects((2,5)).
obj_type(0,(2,5)).
objects((3,3)).
obj_type(1,(3,3)).
objects((3,8)).
obj_type(0,(3,8)).
objects((3,9)).
obj_type(0,(3,9)).
objects((3,2)).
obj_type(1,(3,2)).
objects((3,7)).
obj_type(0,(3,7)).
objects((3,4)).
obj_type(1,(3,4)).
objects((3,1)).
obj_type(1,(3,1)).
objects((4,3)).
obj_type(1,(4,3)).
objects((4,8)).
obj_type(0,(4,8)).
objects((4,2)).
obj_type(1,(4,2)).
objects((4,6)).
obj_type(0,(4,6)).
objects((4,7)).
obj_type(0,(4,7)).
objects((4,9)).
obj_type(0,(4,9)).
objects((4,5)).
obj_type(0,(4,5)).
objects((4,1)).
obj_type(1,(4,1)).
objects((4,0)).
obj_type(1,(4,0)).
objects((5,3)).
obj_type(1,(5,3)).
objects((5,8)).
obj_type(0,(5,8)).
objects((5,1)).
obj_type(1,(5,1)).
objects((5,7)).
obj_type(0,(5,7)).
objects((5,9)).
obj_type(0,(5,9)).
objects((5,4)).
obj_type(1,(5,4)).
objects((5,6)).
obj_type(0,(5,6)).
objects((5,2)).
obj_type(1,(5,2)).
types(0).
types(1).
instance(0).
instance(1).
instance(2).
instance(3).
instance(4).
instance(5).
action_arity("move_up",2).
action_type_list("move_up",(Type0, Type1)) :- action_arg_type(Type0,("move_up",0)), action_arg_type(Type1,("move_up",1)).
action_candidate("move_up",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("move_up",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arity("unboard",2).
action_type_list("unboard",(Type0, Type1)) :- action_arg_type(Type0,("unboard",0)), action_arg_type(Type1,("unboard",1)).
action_candidate("unboard",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("unboard",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arity("board",2).
action_type_list("board",(Type0, Type1)) :- action_arg_type(Type0,("board",0)), action_arg_type(Type1,("board",1)).
action_candidate("board",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("board",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arity("move_down",2).
action_type_list("move_down",(Type0, Type1)) :- action_arg_type(Type0,("move_down",0)), action_arg_type(Type1,("move_down",1)).
action_candidate("move_down",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("move_down",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arg_type(0,("move_up",0)).
action_arg_type(1,("unboard",0)).
action_arg_type(1,("board",0)).
action_arg_type(0,("move_down",0)).
action_arg_type(0,("unboard",1)).
action_arg_type(0,("move_down",1)).
action_arg_type(0,("board",1)).
action_arg_type(0,("move_up",1)).
action_possible("unboard",0,((0,3), (0,8))).
action_possible("move_down",0,((0,8), (0,9))).
action_possible("board",0,((0,2), (0,8))).
action_possible("board",0,((0,3), (0,8))).
action_possible("unboard",0,((0,2), (0,8))).
action_possible("move_up",0,((0,8), (0,7))).
action_possible("move_up",0,((0,9), (0,8))).
action_possible("unboard",0,((0,4), (0,8))).
action_possible("unboard",0,((0,3), (0,9))).
action_possible("board",0,((0,3), (0,9))).
action_possible("move_down",0,((0,7), (0,8))).
action_possible("board",0,((0,4), (0,8))).
action_possible("board",0,((0,4), (0,9))).
action_possible("unboard",0,((0,4), (0,9))).
action_possible("unboard",1,((1,3), (1,8))).
action_possible("board",1,((1,3), (1,8))).
action_possible("board",1,((1,1), (1,7))).
action_possible("move_up",1,((1,8), (1,7))).
action_possible("unboard",1,((1,1), (1,7))).
action_possible("move_up",1,((1,9), (1,8))).
action_possible("unboard",1,((1,4), (1,8))).
action_possible("board",1,((1,4), (1,8))).
action_possible("unboard",1,((1,2), (1,7))).
action_possible("board",1,((1,2), (1,7))).
action_possible("move_up",1,((1,7), (1,6))).
action_possible("move_down",1,((1,8), (1,9))).
action_possible("board",1,((1,2), (1,8))).
action_possible("unboard",1,((1,2), (1,8))).
action_possible("move_down",1,((1,6), (1,7))).
action_possible("board",1,((1,2), (1,9))).
action_possible("move_down",1,((1,7), (1,8))).
action_possible("unboard",1,((1,2), (1,9))).
action_possible("unboard",2,((2,4), (2,7))).
action_possible("unboard",2,((2,2), (2,6))).
action_possible("board",2,((2,2), (2,6))).
action_possible("move_up",2,((2,8), (2,7))).
action_possible("move_up",2,((2,9), (2,8))).
action_possible("board",2,((2,1), (2,6))).
action_possible("unboard",2,((2,1), (2,6))).
action_possible("unboard",2,((2,2), (2,7))).
action_possible("board",2,((2,2), (2,7))).
action_possible("move_up",2,((2,7), (2,6))).
action_possible("move_down",2,((2,8), (2,9))).
action_possible("board",2,((2,2), (2,8))).
action_possible("unboard",2,((2,2), (2,8))).
action_possible("move_down",2,((2,5), (2,6))).
action_possible("move_down",2,((2,6), (2,7))).
action_possible("board",2,((2,2), (2,9))).
action_possible("move_down",2,((2,7), (2,8))).
action_possible("unboard",2,((2,2), (2,9))).
action_possible("board",2,((2,4), (2,7))).
action_possible("move_up",2,((2,6), (2,5))).
action_possible("unboard",3,((3,3), (3,8))).
action_possible("move_down",3,((3,8), (3,9))).
action_possible("board",3,((3,2), (3,8))).
action_possible("board",3,((3,3), (3,8))).
action_possible("unboard",3,((3,2), (3,8))).
action_possible("move_up",3,((3,8), (3,7))).
action_possible("move_up",3,((3,9), (3,8))).
action_possible("unboard",3,((3,3), (3,9))).
action_possible("unboard",3,((3,4), (3,8))).
action_possible("board",3,((3,3), (3,9))).
action_possible("move_down",3,((3,7), (3,8))).
action_possible("board",3,((3,4), (3,8))).
action_possible("board",3,((3,1), (3,8))).
action_possible("unboard",3,((3,1), (3,8))).
action_possible("board",3,((3,4), (3,9))).
action_possible("unboard",3,((3,4), (3,9))).
action_possible("unboard",4,((4,3), (4,8))).
action_possible("unboard",4,((4,2), (4,6))).
action_possible("board",4,((4,3), (4,8))).
action_possible("board",4,((4,2), (4,6))).
action_possible("move_up",4,((4,8), (4,7))).
action_possible("move_up",4,((4,9), (4,8))).
action_possible("board",4,((4,2), (4,5))).
action_possible("unboard",4,((4,2), (4,5))).
action_possible("unboard",4,((4,2), (4,7))).
action_possible("board",4,((4,2), (4,7))).
action_possible("board",4,((4,1), (4,8))).
action_possible("unboard",4,((4,1), (4,8))).
action_possible("move_up",4,((4,7), (4,6))).
action_possible("move_down",4,((4,8), (4,9))).
action_possible("board",4,((4,2), (4,8))).
action_possible("unboard",4,((4,2), (4,8))).
action_possible("move_down",4,((4,5), (4,6))).
action_possible("move_down",4,((4,6), (4,7))).
action_possible("move_down",4,((4,7), (4,8))).
action_possible("board",4,((4,0), (4,8))).
action_possible("unboard",4,((4,0), (4,8))).
action_possible("move_up",4,((4,6), (4,5))).
action_possible("unboard",5,((5,3), (5,8))).
action_possible("board",5,((5,3), (5,8))).
action_possible("board",5,((5,1), (5,7))).
action_possible("move_up",5,((5,8), (5,7))).
action_possible("unboard",5,((5,1), (5,7))).
action_possible("move_up",5,((5,9), (5,8))).
action_possible("unboard",5,((5,3), (5,9))).
action_possible("unboard",5,((5,4), (5,8))).
action_possible("board",5,((5,3), (5,9))).
action_possible("board",5,((5,4), (5,8))).
action_possible("board",5,((5,4), (5,9))).
action_possible("move_up",5,((5,7), (5,6))).
action_possible("unboard",5,((5,4), (5,9))).
action_possible("move_down",5,((5,8), (5,9))).
action_possible("board",5,((5,2), (5,8))).
action_possible("unboard",5,((5,2), (5,8))).
action_possible("move_down",5,((5,6), (5,7))).
action_possible("move_down",5,((5,7), (5,8))).
