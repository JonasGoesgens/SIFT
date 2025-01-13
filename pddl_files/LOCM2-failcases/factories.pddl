
(define (domain factories)
(:requirements :negative-preconditions :equality :strips)
(:predicates (resource ?x)
             (prod_a ?x)
             (prod_b ?x))

(:action produce-resource
:parameters (?this)
:precondition (and (not (resource ?this)))
:effect  (and (resource ?this))
 )
(:action produce-a
:parameters (?this)
:precondition (and (resource ?this) 
                   (not (prod_a ?this)))
:effect  (and (prod_a ?this)
              (not (resource ?this)))
 )
(:action produce-b
:parameters (?this)
:precondition (and (resource ?this) 
                   (not (prod_b ?this)))
:effect  (and (prod_b ?this)
              (not (resource ?this)))
 )
(:action consume-ab
:parameters (?this)
:precondition (and (prod_b ?this) 
                   (prod_a ?this))
:effect  (and (not (prod_a ?this))
              (not (prod_b ?this)))
 ))
