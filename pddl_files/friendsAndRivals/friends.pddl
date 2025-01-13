(define (domain friends)
	(:requirements :negative-preconditions)
	(:predicates
		(friend_of ?x ?y)
		(eq ?x ?y)
	)
	(:action make-friend
		:parameters (?x ?y)
		:precondition
			(and
                (not (friend_of ?x ?y))
				(not (eq ?x ?y))
			)
		:effect
			(and
				(friend_of ?x ?y)
				(friend_of ?y ?x)
			)
	)
	(:action forget-friend
		:parameters (?x ?y)
		:precondition
			(and
				(friend_of ?x ?y)
				(not (eq ?x ?y))
			)
		:effect
			(and
				(not(friend_of ?x ?y))
				(not(friend_of ?y ?x))
			)
	)
)
