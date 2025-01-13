(define (domain storage-ring)
	(:requirements :negative-preconditions)
	(:predicates (at ?x) (data ?x) (next ?x ?y))
	(:action shuffle
		:parameters (?x ?y)
		:precondition (and (at ?x) (next ?x ?y))
		:effect (and (at ?y) (not (at ?x))))
	(:action shuffleexchange0
		:parameters (?x ?y)
		:precondition (and (at ?x) (next ?x ?y) (not (data ?x)))
		:effect (and (at ?y) (not (at ?x)) (data ?x)))
	(:action shuffleexchange1
		:parameters (?x ?y)
		:precondition (and (at ?x) (next ?x ?y) (data ?x))
		:effect (and (at ?y) (not (at ?x)) (not (data ?x)))))

