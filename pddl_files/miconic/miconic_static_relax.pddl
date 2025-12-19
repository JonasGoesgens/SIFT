(define (domain miconic)
(:predicates (person ?x) (floor ?x) (lift_pos ?x) (in_lift ?x) (in_floor ?x ?y) (above ?x ?y))
	(:action unboard
		:parameters (?x ?y)
		:precondition (and (lift_pos ?y) (in_lift ?x))
		:effect (and (in_floor ?x ?y) (not (in_lift ?x))))
	(:action board
		:parameters (?x ?y)
		:precondition (and (lift_pos ?y) (in_floor ?x ?y))
		:effect (and (in_lift ?x) (not (in_floor ?x ?y))))
	(:action move_up
		:parameters (?x ?y)
		:precondition (and (lift_pos ?x))
		:effect (and (lift_pos ?y) (not (lift_pos ?x))))
	(:action move_down
		:parameters (?x ?y)
		:precondition (and (lift_pos ?x))
		:effect (and (lift_pos ?y) (not (lift_pos ?x)))))
