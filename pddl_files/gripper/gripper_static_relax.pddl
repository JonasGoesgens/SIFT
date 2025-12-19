(define (domain gripper-strips)
   (:requirements :negative-preconditions :typing)
   (:predicates (room ?r)
		(ball ?b)
		(gripper ?g)
		(at-robby ?r)
		(at ?b ?r)
		(free ?g)
		(carry ?o ?g)
        (eq ?r1 ?r2))

   (:action move
       :parameters  (?from ?to)
       :precondition (and (at-robby ?from))
       :effect (and  (at-robby ?to)
		     (not (at-robby ?from))))


   (:action pick
       :parameters (?obj ?room ?gripper)
       :precondition  (and (at ?obj ?room) (at-robby ?room) (free ?gripper))
       :effect (and (carry ?obj ?gripper)
		    (not (at ?obj ?room)) 
		    (not (free ?gripper))))


   (:action drop
       :parameters  (?obj  ?room ?gripper)
       :precondition  (and (carry ?obj ?gripper) (at-robby ?room))
       :effect (and (at ?obj ?room)
		    (free ?gripper)
		    (not (carry ?obj ?gripper)))))
