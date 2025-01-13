
(define (problem ferry-01)
 (:domain ferry)
 (:objects 
    car1 car2 car3 car4 - car
    loc1 loc2 loc3 loc4 - location
 )
 (:init 
    (empty-ferry)
    (at-ferry loc2)
    (at car1 loc1)
    (at car2 loc1)
    (at car3 loc2)
    (at car4 loc2)
    (eq loc1 loc1)
    (eq loc2 loc2)
    (eq loc3 loc3)
    (eq loc4 loc4)
)
 (:goal  (and (at car1 loc3)
    (at car2 loc3))))
