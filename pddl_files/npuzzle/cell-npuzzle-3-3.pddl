(define (problem cell-npuzzle-3-3)
    (:domain cell-npuzzle)

    (:objects
        c_0_0 c_0_1 c_0_2 c_1_0 c_1_1 c_1_2 c_2_0 c_2_1 c_2_2
        t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8
    )

    (:init
        (cell c_0_0)
        (cell c_0_1)
        (cell c_0_2)
        (cell c_1_0)
        (cell c_1_1)
        (cell c_1_2)
        (cell c_2_0)
        (cell c_2_1)
        (cell c_2_2)
        (tile t_1)
        (tile t_2)
        (tile t_3)
        (tile t_4)
        (tile t_5)
        (tile t_6)
        (tile t_7)
        (tile t_8)
        (blank c_0_0)
        (at t_1 c_0_1)
        (at t_2 c_0_2)
        (at t_3 c_1_0)
        (at t_4 c_1_1)
        (at t_5 c_1_2)
        (at t_6 c_2_0)
        (at t_7 c_2_1)
        (at t_8 c_2_2)
        (above c_0_1 c_0_0)
        (above c_0_2 c_0_1)
        (above c_1_1 c_1_0)
        (above c_1_2 c_1_1)
        (above c_2_1 c_2_0)
        (above c_2_2 c_2_1)
        (right c_1_0 c_0_0)
        (right c_2_0 c_1_0)
        (right c_1_1 c_0_1)
        (right c_2_1 c_1_1)
        (right c_1_2 c_0_2)
        (right c_2_2 c_1_2)
    )

    (:goal
        (and (blank c_2_2))
    )

    
    
    
)
