(define (problem cell-npuzzle-inf)
    (:domain cell-npuzzle)
;   ;   c 4 b
;   ;   1 3 5
;   ;   b 2 x
    (:objects
        c_0_0 c_0_1 c_1_0 c_1_1 c_1_2 c_2_1 c_2_2
        t_1 t_2 t_3 t_4 t_5
    )

    (:init
        (cell c_0_0)
        (cell c_0_1)
        (cell c_1_0)
        (cell c_1_1)
        (cell c_1_2)
        (cell c_2_1)
        (cell c_2_2)
        (tile t_1)
        (tile t_2)
        (tile t_3)
        (tile t_4)
        (tile t_5)
        (blank c_0_0)
        (blank c_2_2)
        (at t_1 c_0_1)
        (at t_2 c_1_0)
        (at t_3 c_1_1)
        (at t_4 c_1_2)
        (at t_5 c_2_1)
        (above c_0_1 c_0_0)
        (above c_1_2 c_1_1)
        (above c_1_1 c_1_0)
        (above c_2_2 c_2_1)
        (right c_1_0 c_0_0)
        (right c_2_1 c_1_1)
        (right c_1_1 c_0_1)
        (right c_2_2 c_1_2)
    )

    (:goal
        (and (blank c_1_1))
    )

    
    
    
)
