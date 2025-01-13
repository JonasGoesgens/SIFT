(define (domain blocksworld)
(:requirements :negative-preconditions :typing)
(:predicates (clear ?x)
             (on-table ?x)
             (on ?x ?y)
             (eq ?x ?y))

(:action STACK
  :parameters (?bm ?bt)
  :precondition (and (clear ?bm) (clear ?bt) (on-table ?bm) (not (eq ?bm ?bt)))
  :effect (and (not (clear ?bt)) (not (on-table ?bm))
               (on ?bm ?bt)))
               
(:action NEWTOWER
  :parameters (?bm ?bf)
  :precondition (and (clear ?bm) (on ?bm ?bf) (not (eq ?bm ?bf)))
  :effect (and (not (on ?bm ?bf))
               (on-table ?bm) (clear ?bf)))

(:action MOVE
  :parameters (?bm ?bf ?bt)
  :precondition (and (clear ?bm) (clear ?bt) (on ?bm ?bf) (not (eq ?bm ?bt)) (not (eq ?bm ?bf)) (not (eq ?bf ?bt)))
  :effect (and (not (clear ?bt)) (not (on ?bm ?bf))
               (on ?bm ?bt) (clear ?bf))))
