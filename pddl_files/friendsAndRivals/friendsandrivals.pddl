(define (domain friendsandrivals)
	(:requirements :negative-preconditions)
	(:predicates
		(rival_of ?x ?y)
		(friend_of ?x ?y)
		(has_no_rival ?x)
		(has_no_friend ?x)
		(eq ?x ?y)
	)
	(:action make-friend
		:parameters (?x ?y)
		:precondition
			(and
				(has_no_friend ?x)
				(has_no_friend ?y)
				(not (eq ?x ?y))
			)
		:effect
			(and
				(friend_of ?x ?y)
				(friend_of ?y ?x)
				(not(has_no_friend ?x))
				(not(has_no_friend ?y))
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
				(has_no_friend ?x)
				(has_no_friend ?y)
			)
	)
	(:action make-rival
		:parameters (?x ?y)
		:precondition
			(and
				(has_no_rival ?x)
				(has_no_rival ?y)
				(not (eq ?x ?y))
			)
		:effect
			(and
				(rival_of ?x ?y)
				(rival_of ?y ?x)
				(not(has_no_rival ?x))
				(not(has_no_rival ?y))
			)
	)
	(:action forget-rival
		:parameters (?x ?y)
		:precondition
			(and
				(rival_of ?x ?y)
				(not (eq ?x ?y))
			)
		:effect
			(and
				(not(rival_of ?x ?y))
				(not(rival_of ?y ?x))
				(has_no_rival ?x)
				(has_no_rival ?y)
			)
	)
)
