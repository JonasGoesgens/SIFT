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
objects((0,6)).
obj_type(0,(0,6)).
objects((0,5)).
obj_type(0,(0,5)).
objects((0,3)).
obj_type(0,(0,3)).
objects((0,0)).
obj_type(0,(0,0)).
objects((0,1)).
obj_type(0,(0,1)).
objects((0,2)).
obj_type(0,(0,2)).
objects((0,4)).
obj_type(0,(0,4)).
objects((1,3)).
obj_type(0,(1,3)).
objects((1,2)).
obj_type(0,(1,2)).
objects((1,5)).
obj_type(0,(1,5)).
objects((1,0)).
obj_type(0,(1,0)).
objects((1,6)).
obj_type(0,(1,6)).
objects((1,1)).
obj_type(0,(1,1)).
objects((2,6)).
obj_type(0,(2,6)).
objects((2,3)).
obj_type(0,(2,3)).
objects((2,2)).
obj_type(0,(2,2)).
objects((2,5)).
obj_type(0,(2,5)).
objects((2,0)).
obj_type(0,(2,0)).
objects((2,1)).
obj_type(0,(2,1)).
objects((2,4)).
obj_type(0,(2,4)).
objects((3,2)).
obj_type(0,(3,2)).
objects((3,4)).
obj_type(0,(3,4)).
objects((3,6)).
obj_type(0,(3,6)).
objects((3,3)).
obj_type(0,(3,3)).
objects((3,5)).
obj_type(0,(3,5)).
objects((3,0)).
obj_type(0,(3,0)).
objects((3,1)).
obj_type(0,(3,1)).
objects((4,6)).
obj_type(0,(4,6)).
objects((4,4)).
obj_type(0,(4,4)).
objects((4,3)).
obj_type(0,(4,3)).
objects((4,0)).
obj_type(0,(4,0)).
objects((4,1)).
obj_type(0,(4,1)).
objects((4,5)).
obj_type(0,(4,5)).
objects((5,6)).
obj_type(0,(5,6)).
objects((5,5)).
obj_type(0,(5,5)).
objects((5,3)).
obj_type(0,(5,3)).
objects((5,0)).
obj_type(0,(5,0)).
objects((5,1)).
obj_type(0,(5,1)).
objects((5,2)).
obj_type(0,(5,2)).
objects((5,4)).
obj_type(0,(5,4)).
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
action_arity("pick-up",1).
action_type_list("pick-up",(Type0)) :- action_arg_type(Type0,("pick-up",0)).
action_candidate("pick-up",Inst,(Obj0)):- instance(Inst),action_type_list("pick-up",(Type0)),obj_type(Type0,(Obj0)),Obj0=(Inst,_).
action_arity("unstack",2).
action_type_list("unstack",(Type0, Type1)) :- action_arg_type(Type0,("unstack",0)), action_arg_type(Type1,("unstack",1)).
action_candidate("unstack",Inst,(Obj0, Obj1)):- instance(Inst),action_type_list("unstack",(Type0, Type1)),obj_type(Type0,(Obj0)),Obj0=(Inst,_), obj_type(Type1,(Obj1)),Obj1=(Inst,_).
action_arity("put-down",1).
action_type_list("put-down",(Type0)) :- action_arg_type(Type0,("put-down",0)).
action_candidate("put-down",Inst,(Obj0)):- instance(Inst),action_type_list("put-down",(Type0)),obj_type(Type0,(Obj0)),Obj0=(Inst,_).
action_arg_type(0,("stack",0)).
action_arg_type(0,("pick-up",0)).
action_arg_type(0,("unstack",0)).
action_arg_type(0,("stack",1)).
action_arg_type(0,("put-down",0)).
action_arg_type(0,("unstack",1)).
action_possible("put-down",0,((0,6))).
action_possible("stack",0,((0,5), (0,3))).
action_possible("pick-up",0,((0,0))).
action_possible("stack",0,((0,3), (0,1))).
action_possible("unstack",0,((0,1), (0,3))).
action_possible("put-down",0,((0,1))).
action_possible("stack",0,((0,6), (0,1))).
action_possible("put-down",0,((0,2))).
action_possible("stack",0,((0,6), (0,2))).
action_possible("stack",0,((0,5), (0,0))).
action_possible("stack",0,((0,1), (0,3))).
action_possible("unstack",0,((0,0), (0,3))).
action_possible("unstack",0,((0,4), (0,0))).
action_possible("unstack",0,((0,1), (0,5))).
action_possible("unstack",0,((0,2), (0,6))).
action_possible("put-down",0,((0,4))).
action_possible("unstack",0,((0,0), (0,4))).
action_possible("unstack",0,((0,5), (0,6))).
action_possible("unstack",0,((0,2), (0,1))).
action_possible("stack",0,((0,4), (0,0))).
action_possible("stack",0,((0,0), (0,3))).
action_possible("stack",0,((0,4), (0,1))).
action_possible("put-down",0,((0,0))).
action_possible("pick-up",0,((0,2))).
action_possible("stack",0,((0,0), (0,4))).
action_possible("unstack",0,((0,5), (0,2))).
action_possible("stack",0,((0,3), (0,4))).
action_possible("unstack",0,((0,3), (0,0))).
action_possible("unstack",0,((0,4), (0,6))).
action_possible("pick-up",0,((0,3))).
action_possible("unstack",0,((0,2), (0,4))).
action_possible("stack",0,((0,1), (0,2))).
action_possible("stack",0,((0,6), (0,4))).
action_possible("stack",0,((0,5), (0,2))).
action_possible("unstack",0,((0,4), (0,2))).
action_possible("stack",0,((0,3), (0,0))).
action_possible("unstack",0,((0,5), (0,4))).
action_possible("stack",0,((0,2), (0,4))).
action_possible("unstack",0,((0,3), (0,2))).
action_possible("unstack",0,((0,0), (0,6))).
action_possible("unstack",0,((0,2), (0,0))).
action_possible("unstack",0,((0,4), (0,3))).
action_possible("stack",0,((0,6), (0,0))).
action_possible("stack",0,((0,4), (0,2))).
action_possible("stack",0,((0,2), (0,5))).
action_possible("stack",0,((0,5), (0,4))).
action_possible("unstack",0,((0,5), (0,0))).
action_possible("unstack",0,((0,0), (0,2))).
action_possible("stack",0,((0,3), (0,2))).
action_possible("stack",0,((0,4), (0,3))).
action_possible("stack",0,((0,2), (0,0))).
action_possible("unstack",0,((0,1), (0,4))).
action_possible("unstack",0,((0,5), (0,1))).
action_possible("unstack",0,((0,4), (0,5))).
action_possible("put-down",0,((0,3))).
action_possible("pick-up",0,((0,5))).
action_possible("stack",0,((0,0), (0,2))).
action_possible("stack",0,((0,1), (0,4))).
action_possible("unstack",0,((0,1), (0,0))).
action_possible("stack",0,((0,6), (0,3))).
action_possible("pick-up",0,((0,6))).
action_possible("stack",0,((0,5), (0,1))).
action_possible("stack",0,((0,4), (0,5))).
action_possible("unstack",0,((0,1), (0,6))).
action_possible("stack",0,((0,1), (0,5))).
action_possible("unstack",0,((0,4), (0,1))).
action_possible("pick-up",0,((0,1))).
action_possible("unstack",0,((0,0), (0,5))).
action_possible("unstack",0,((0,3), (0,4))).
action_possible("stack",0,((0,1), (0,0))).
action_possible("stack",0,((0,2), (0,1))).
action_possible("unstack",0,((0,3), (0,5))).
action_possible("unstack",0,((0,1), (0,2))).
action_possible("unstack",0,((0,2), (0,3))).
action_possible("stack",0,((0,0), (0,5))).
action_possible("unstack",0,((0,0), (0,1))).
action_possible("unstack",0,((0,3), (0,6))).
action_possible("unstack",0,((0,5), (0,3))).
action_possible("pick-up",0,((0,4))).
action_possible("stack",0,((0,3), (0,5))).
action_possible("stack",0,((0,2), (0,3))).
action_possible("put-down",0,((0,5))).
action_possible("unstack",0,((0,3), (0,1))).
action_possible("stack",0,((0,0), (0,1))).
action_possible("unstack",0,((0,2), (0,5))).
action_possible("stack",0,((0,6), (0,5))).
action_possible("unstack",1,((1,3), (1,2))).
action_possible("stack",1,((1,5), (1,3))).
action_possible("stack",1,((1,0), (1,3))).
action_possible("unstack",1,((1,2), (1,0))).
action_possible("unstack",1,((1,0), (1,5))).
action_possible("pick-up",1,((1,0))).
action_possible("put-down",1,((1,0))).
action_possible("pick-up",1,((1,2))).
action_possible("put-down",1,((1,2))).
action_possible("unstack",1,((1,5), (1,0))).
action_possible("unstack",1,((1,0), (1,2))).
action_possible("unstack",1,((1,3), (1,5))).
action_possible("stack",1,((1,3), (1,2))).
action_possible("stack",1,((1,6), (1,1))).
action_possible("unstack",1,((1,2), (1,3))).
action_possible("stack",1,((1,2), (1,0))).
action_possible("unstack",1,((1,3), (1,0))).
action_possible("stack",1,((1,0), (1,5))).
action_possible("pick-up",1,((1,3))).
action_possible("stack",1,((1,5), (1,0))).
action_possible("put-down",1,((1,3))).
action_possible("pick-up",1,((1,5))).
action_possible("unstack",1,((1,0), (1,3))).
action_possible("stack",1,((1,1), (1,2))).
action_possible("unstack",1,((1,5), (1,3))).
action_possible("stack",1,((1,0), (1,2))).
action_possible("stack",1,((1,3), (1,5))).
action_possible("stack",1,((1,2), (1,3))).
action_possible("put-down",1,((1,5))).
action_possible("stack",1,((1,3), (1,0))).
action_possible("unstack",1,((1,1), (1,6))).
action_possible("unstack",1,((1,2), (1,1))).
action_possible("put-down",2,((2,6))).
action_possible("unstack",2,((2,3), (2,2))).
action_possible("stack",2,((2,5), (2,3))).
action_possible("unstack",2,((2,0), (2,6))).
action_possible("unstack",2,((2,2), (2,0))).
action_possible("stack",2,((2,6), (2,0))).
action_possible("pick-up",2,((2,0))).
action_possible("stack",2,((2,3), (2,1))).
action_possible("unstack",2,((2,1), (2,3))).
action_possible("put-down",2,((2,1))).
action_possible("stack",2,((2,2), (2,5))).
action_possible("unstack",2,((2,6), (2,2))).
action_possible("stack",2,((2,6), (2,1))).
action_possible("put-down",2,((2,2))).
action_possible("unstack",2,((2,5), (2,0))).
action_possible("unstack",2,((2,0), (2,2))).
action_possible("stack",2,((2,3), (2,2))).
action_possible("stack",2,((2,0), (2,6))).
action_possible("stack",2,((2,2), (2,0))).
action_possible("stack",2,((2,4), (2,3))).
action_possible("unstack",2,((2,6), (2,3))).
action_possible("stack",2,((2,6), (2,2))).
action_possible("unstack",2,((2,5), (2,1))).
action_possible("stack",2,((2,5), (2,0))).
action_possible("stack",2,((2,1), (2,3))).
action_possible("put-down",2,((2,3))).
action_possible("pick-up",2,((2,5))).
action_possible("unstack",2,((2,0), (2,3))).
action_possible("unstack",2,((2,2), (2,5))).
action_possible("stack",2,((2,0), (2,2))).
action_possible("unstack",2,((2,1), (2,5))).
action_possible("unstack",2,((2,2), (2,6))).
action_possible("unstack",2,((2,1), (2,0))).
action_possible("stack",2,((2,6), (2,3))).
action_possible("pick-up",2,((2,6))).
action_possible("stack",2,((2,5), (2,1))).
action_possible("unstack",2,((2,5), (2,6))).
action_possible("unstack",2,((2,1), (2,6))).
action_possible("unstack",2,((2,2), (2,1))).
action_possible("stack",2,((2,1), (2,5))).
action_possible("stack",2,((2,0), (2,3))).
action_possible("pick-up",2,((2,1))).
action_possible("unstack",2,((2,0), (2,5))).
action_possible("unstack",2,((2,3), (2,4))).
action_possible("stack",2,((2,2), (2,6))).
action_possible("stack",2,((2,1), (2,0))).
action_possible("stack",2,((2,1), (2,6))).
action_possible("stack",2,((2,2), (2,1))).
action_possible("put-down",2,((2,0))).
action_possible("pick-up",2,((2,2))).
action_possible("stack",2,((2,5), (2,6))).
action_possible("unstack",2,((2,5), (2,2))).
action_possible("unstack",2,((2,3), (2,5))).
action_possible("unstack",2,((2,1), (2,2))).
action_possible("unstack",2,((2,2), (2,3))).
action_possible("unstack",2,((2,3), (2,0))).
action_possible("stack",2,((2,0), (2,5))).
action_possible("pick-up",2,((2,3))).
action_possible("unstack",2,((2,0), (2,1))).
action_possible("unstack",2,((2,3), (2,6))).
action_possible("unstack",2,((2,6), (2,5))).
action_possible("stack",2,((2,1), (2,2))).
action_possible("unstack",2,((2,5), (2,3))).
action_possible("stack",2,((2,5), (2,2))).
action_possible("unstack",2,((2,6), (2,0))).
action_possible("stack",2,((2,3), (2,5))).
action_possible("put-down",2,((2,5))).
action_possible("stack",2,((2,2), (2,3))).
action_possible("unstack",2,((2,3), (2,1))).
action_possible("stack",2,((2,3), (2,0))).
action_possible("stack",2,((2,0), (2,1))).
action_possible("unstack",2,((2,6), (2,1))).
action_possible("stack",2,((2,3), (2,6))).
action_possible("stack",2,((2,6), (2,5))).
action_possible("stack",3,((3,2), (3,4))).
action_possible("put-down",3,((3,6))).
action_possible("unstack",3,((3,4), (3,3))).
action_possible("stack",3,((3,4), (3,2))).
action_possible("stack",3,((3,2), (3,5))).
action_possible("stack",3,((3,5), (3,4))).
action_possible("unstack",3,((3,6), (3,2))).
action_possible("put-down",3,((3,2))).
action_possible("stack",3,((3,6), (3,2))).
action_possible("unstack",3,((3,4), (3,5))).
action_possible("pick-up",3,((3,5))).
action_possible("unstack",3,((3,2), (3,6))).
action_possible("put-down",3,((3,4))).
action_possible("pick-up",3,((3,6))).
action_possible("unstack",3,((3,5), (3,6))).
action_possible("stack",3,((3,4), (3,5))).
action_possible("stack",3,((3,0), (3,3))).
action_possible("stack",3,((3,2), (3,6))).
action_possible("stack",3,((3,1), (3,6))).
action_possible("stack",3,((3,5), (3,6))).
action_possible("pick-up",3,((3,2))).
action_possible("unstack",3,((3,6), (3,4))).
action_possible("unstack",3,((3,5), (3,2))).
action_possible("stack",3,((3,3), (3,4))).
action_possible("unstack",3,((3,3), (3,0))).
action_possible("unstack",3,((3,4), (3,6))).
action_possible("unstack",3,((3,6), (3,5))).
action_possible("unstack",3,((3,2), (3,4))).
action_possible("stack",3,((3,6), (3,4))).
action_possible("stack",3,((3,5), (3,2))).
action_possible("pick-up",3,((3,4))).
action_possible("stack",3,((3,4), (3,6))).
action_possible("put-down",3,((3,5))).
action_possible("unstack",3,((3,4), (3,2))).
action_possible("unstack",3,((3,5), (3,4))).
action_possible("unstack",3,((3,6), (3,1))).
action_possible("unstack",3,((3,2), (3,5))).
action_possible("stack",3,((3,6), (3,5))).
action_possible("put-down",4,((4,6))).
action_possible("unstack",4,((4,4), (4,3))).
action_possible("unstack",4,((4,0), (4,6))).
action_possible("stack",4,((4,6), (4,0))).
action_possible("pick-up",4,((4,0))).
action_possible("put-down",4,((4,1))).
action_possible("stack",4,((4,5), (4,4))).
action_possible("stack",4,((4,6), (4,1))).
action_possible("unstack",4,((4,5), (4,0))).
action_possible("stack",4,((4,0), (4,6))).
action_possible("unstack",4,((4,1), (4,4))).
action_possible("unstack",4,((4,5), (4,1))).
action_possible("stack",4,((4,5), (4,0))).
action_possible("unstack",4,((4,4), (4,5))).
action_possible("pick-up",4,((4,5))).
action_possible("unstack",4,((4,4), (4,0))).
action_possible("unstack",4,((4,1), (4,5))).
action_possible("stack",4,((4,1), (4,4))).
action_possible("unstack",4,((4,1), (4,0))).
action_possible("put-down",4,((4,4))).
action_possible("pick-up",4,((4,6))).
action_possible("unstack",4,((4,0), (4,4))).
action_possible("stack",4,((4,5), (4,1))).
action_possible("unstack",4,((4,5), (4,6))).
action_possible("stack",4,((4,4), (4,5))).
action_possible("unstack",4,((4,1), (4,6))).
action_possible("stack",4,((4,1), (4,5))).
action_possible("unstack",4,((4,4), (4,1))).
action_possible("stack",4,((4,4), (4,0))).
action_possible("pick-up",4,((4,1))).
action_possible("unstack",4,((4,0), (4,5))).
action_possible("stack",4,((4,1), (4,0))).
action_possible("stack",4,((4,1), (4,6))).
action_possible("stack",4,((4,4), (4,1))).
action_possible("put-down",4,((4,0))).
action_possible("stack",4,((4,5), (4,6))).
action_possible("stack",4,((4,0), (4,4))).
action_possible("unstack",4,((4,6), (4,4))).
action_possible("stack",4,((4,3), (4,4))).
action_possible("stack",4,((4,0), (4,5))).
action_possible("unstack",4,((4,4), (4,6))).
action_possible("unstack",4,((4,0), (4,1))).
action_possible("unstack",4,((4,6), (4,5))).
action_possible("stack",4,((4,6), (4,4))).
action_possible("unstack",4,((4,6), (4,0))).
action_possible("pick-up",4,((4,4))).
action_possible("stack",4,((4,4), (4,6))).
action_possible("put-down",4,((4,5))).
action_possible("unstack",4,((4,5), (4,4))).
action_possible("stack",4,((4,0), (4,1))).
action_possible("unstack",4,((4,6), (4,1))).
action_possible("stack",4,((4,6), (4,5))).
action_possible("put-down",5,((5,6))).
action_possible("stack",5,((5,5), (5,3))).
action_possible("pick-up",5,((5,0))).
action_possible("stack",5,((5,3), (5,1))).
action_possible("unstack",5,((5,1), (5,3))).
action_possible("put-down",5,((5,1))).
action_possible("stack",5,((5,6), (5,1))).
action_possible("put-down",5,((5,2))).
action_possible("stack",5,((5,6), (5,2))).
action_possible("stack",5,((5,5), (5,0))).
action_possible("stack",5,((5,1), (5,3))).
action_possible("unstack",5,((5,0), (5,3))).
action_possible("unstack",5,((5,4), (5,0))).
action_possible("unstack",5,((5,1), (5,5))).
action_possible("unstack",5,((5,2), (5,6))).
action_possible("put-down",5,((5,4))).
action_possible("unstack",5,((5,0), (5,4))).
action_possible("unstack",5,((5,5), (5,6))).
action_possible("unstack",5,((5,2), (5,1))).
action_possible("stack",5,((5,4), (5,0))).
action_possible("stack",5,((5,0), (5,3))).
action_possible("stack",5,((5,4), (5,1))).
action_possible("put-down",5,((5,0))).
action_possible("pick-up",5,((5,2))).
action_possible("stack",5,((5,0), (5,4))).
action_possible("unstack",5,((5,5), (5,2))).
action_possible("stack",5,((5,3), (5,4))).
action_possible("unstack",5,((5,3), (5,0))).
action_possible("unstack",5,((5,4), (5,6))).
action_possible("pick-up",5,((5,3))).
action_possible("unstack",5,((5,2), (5,4))).
action_possible("stack",5,((5,1), (5,2))).
action_possible("stack",5,((5,6), (5,4))).
action_possible("stack",5,((5,5), (5,2))).
action_possible("unstack",5,((5,4), (5,2))).
action_possible("stack",5,((5,3), (5,0))).
action_possible("unstack",5,((5,5), (5,4))).
action_possible("stack",5,((5,2), (5,4))).
action_possible("unstack",5,((5,3), (5,2))).
action_possible("unstack",5,((5,0), (5,6))).
action_possible("unstack",5,((5,2), (5,0))).
action_possible("unstack",5,((5,4), (5,3))).
action_possible("stack",5,((5,6), (5,0))).
action_possible("stack",5,((5,4), (5,2))).
action_possible("stack",5,((5,2), (5,5))).
action_possible("stack",5,((5,5), (5,4))).
action_possible("unstack",5,((5,5), (5,0))).
action_possible("unstack",5,((5,0), (5,2))).
action_possible("stack",5,((5,3), (5,2))).
action_possible("stack",5,((5,4), (5,3))).
action_possible("stack",5,((5,2), (5,0))).
action_possible("unstack",5,((5,1), (5,4))).
action_possible("unstack",5,((5,5), (5,1))).
action_possible("unstack",5,((5,4), (5,5))).
action_possible("put-down",5,((5,3))).
action_possible("pick-up",5,((5,5))).
action_possible("stack",5,((5,0), (5,2))).
action_possible("stack",5,((5,1), (5,4))).
action_possible("unstack",5,((5,1), (5,0))).
action_possible("stack",5,((5,6), (5,3))).
action_possible("pick-up",5,((5,6))).
action_possible("stack",5,((5,5), (5,1))).
action_possible("stack",5,((5,4), (5,5))).
action_possible("unstack",5,((5,1), (5,6))).
action_possible("stack",5,((5,1), (5,5))).
action_possible("unstack",5,((5,4), (5,1))).
action_possible("pick-up",5,((5,1))).
action_possible("unstack",5,((5,0), (5,5))).
action_possible("unstack",5,((5,3), (5,4))).
action_possible("stack",5,((5,1), (5,0))).
action_possible("stack",5,((5,2), (5,1))).
action_possible("unstack",5,((5,3), (5,5))).
action_possible("unstack",5,((5,1), (5,2))).
action_possible("unstack",5,((5,2), (5,3))).
action_possible("stack",5,((5,0), (5,5))).
action_possible("unstack",5,((5,0), (5,1))).
action_possible("unstack",5,((5,3), (5,6))).
action_possible("unstack",5,((5,5), (5,3))).
action_possible("pick-up",5,((5,4))).
action_possible("stack",5,((5,3), (5,5))).
action_possible("stack",5,((5,2), (5,3))).
action_possible("put-down",5,((5,5))).
action_possible("unstack",5,((5,3), (5,1))).
action_possible("stack",5,((5,0), (5,1))).
action_possible("unstack",5,((5,2), (5,5))).
action_possible("stack",5,((5,6), (5,5))).
