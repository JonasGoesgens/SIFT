(define (problem delivery-3x3-2-2)
    (:domain delivery)

    (:objects
        c_1_1 c_1_2 c_1_3 c_1_4 c_2_1 c_2_2 c_2_3 c_2_4 c_3_1 c_3_2 c_3_3 c_3_4 c_4_1 c_4_2 c_4_3 c_4_4 - cell
        p1 p2 - package
        t1 t2 - truck
    )

    (:init

(adjacent c_1_1 c_1_2)
(adjacent c_1_2 c_1_1)
(adjacent c_1_2 c_1_3)
(adjacent c_1_3 c_1_2)
(adjacent c_1_3 c_1_4)
(adjacent c_1_4 c_1_3)
(adjacent c_2_1 c_2_2)
(adjacent c_2_2 c_2_1)
(adjacent c_2_2 c_2_3)
(adjacent c_2_3 c_2_2)
(adjacent c_2_3 c_2_4)
(adjacent c_2_4 c_2_3)
(adjacent c_3_1 c_3_2)
(adjacent c_3_2 c_3_1)
(adjacent c_3_2 c_3_3)
(adjacent c_3_3 c_3_2)
(adjacent c_3_3 c_3_4)
(adjacent c_3_4 c_3_3)
(adjacent c_4_1 c_4_2)
(adjacent c_4_2 c_4_1)
(adjacent c_4_2 c_4_3)
(adjacent c_4_3 c_4_2)
(adjacent c_4_3 c_4_4)
(adjacent c_4_4 c_4_3)
(adjacent c_1_1 c_2_1)
(adjacent c_2_1 c_1_1)
(adjacent c_1_2 c_2_2)
(adjacent c_2_2 c_1_2)
(adjacent c_1_3 c_2_3)
(adjacent c_2_3 c_1_3)
(adjacent c_1_4 c_2_4)
(adjacent c_2_4 c_1_4)
(adjacent c_2_1 c_3_1)
(adjacent c_3_1 c_2_1)
(adjacent c_2_2 c_3_2)
(adjacent c_3_2 c_2_2)
(adjacent c_2_3 c_3_3)
(adjacent c_3_3 c_2_3)
(adjacent c_2_4 c_3_4)
(adjacent c_3_4 c_2_4)
(adjacent c_3_1 c_4_1)
(adjacent c_4_1 c_3_1)
(adjacent c_3_2 c_4_2)
(adjacent c_4_2 c_3_2)
(adjacent c_3_3 c_4_3)
(adjacent c_4_3 c_3_3)
(adjacent c_3_4 c_4_4)
(adjacent c_4_4 c_3_4)

        (at t1 c_1_1)
        (at t2 c_3_3)
        
        (at p1 c_2_1)
        (at p2 c_1_2)
        
        (empty t1)
        (empty t2)
    )

    (:goal
        (and (at p1 c_2_1) (at p2 c_2_1))
    )

    
    
    
)
