(define (problem delivery-3x3-2-2)
    (:domain delivery)

    (:objects
        c_0_0 c_0_1 c_0_2 c_1_0 c_1_1 c_1_2 c_2_0 c_2_1 c_2_2 - cell
        p1 p2 p3 - package
        t1 t2 - truck
    )

    (:init
        (adjacent c_0_2 c_1_2)
        (adjacent c_1_0 c_0_0)
        (adjacent c_2_2 c_1_2)
        (adjacent c_0_1 c_1_1)
        (adjacent c_2_1 c_2_0)
        (adjacent c_1_2 c_1_1)
        (adjacent c_2_0 c_1_0)
        (adjacent c_1_1 c_0_1)
        (adjacent c_2_0 c_2_1)
        (adjacent c_0_0 c_1_0)
        (adjacent c_2_1 c_1_1)
        (adjacent c_2_2 c_2_1)
        (adjacent c_1_0 c_2_0)
        (adjacent c_1_1 c_1_2)
        (adjacent c_1_0 c_1_1)
        (adjacent c_0_1 c_0_0)
        (adjacent c_1_1 c_1_0)
        (adjacent c_1_1 c_2_1)
        (adjacent c_1_2 c_2_2)
        (adjacent c_2_1 c_2_2)
        (adjacent c_0_2 c_0_1)
        (adjacent c_0_1 c_0_2)
        (adjacent c_1_2 c_0_2)
        (adjacent c_0_0 c_0_1)
        (at t1 c_1_0)
        (at t2 c_1_1)
        (at p1 c_2_0)
        (at p2 c_0_1)
        (at p3 c_0_0)
        (empty t1)
        (empty t2)
    )

    (:goal
        (and (at p1 c_2_1) (at p2 c_2_1))
    )

    
    
    
)
