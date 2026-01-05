
(define (domain hanoi)
(:requirements :negative-preconditions :equality :strips)
(:predicates (clear ?x)
             (on ?x ?y)
             (smaller ?x ?y))

(:action move
:parameters (?disc ?from ?to)
:precondition (and (on ?disc ?from) 
                   (clear ?disc) 
                   (clear ?to))
:effect  (and (clear ?from) 
              (on ?disc ?to) 
              (not (on ?disc ?from))  
              (not (clear ?to)))
 )) 
