(define (problem npuzzle-4-4)
    (:domain npuzzle)

    (:objects
        p_x_0 p_x_1 p_x_2 p_x_3 p_y_0 p_y_1 p_y_2 p_y_3
        t_1 t_2 t_3 t_4 t_5 t_6 t_7 t_8 t_9 t_10 t_11 t_12 t_13 t_14 t_15
    )

    (:init
        (position p_x_0)
        (position p_x_1)
        (position p_x_2)
        (position p_x_3)
        (position p_y_0)
        (position p_y_1)
        (position p_y_2)
        (position p_y_3)
        (tile t_1)
        (tile t_2)
        (tile t_3)
        (tile t_4)
        (tile t_5)
        (tile t_6)
        (tile t_7)
        (tile t_8)
        (tile t_9)
        (tile t_10)
        (tile t_11)
        (tile t_12)
        (tile t_13)
        (tile t_14)
        (tile t_15)
        (blank p_x_0 p_y_0)
        (at t_1 p_x_0 p_y_1)
        (at t_2 p_x_0 p_y_2)
        (at t_3 p_x_1 p_y_0)
        (at t_4 p_x_1 p_y_1)
        (at t_5 p_x_1 p_y_2)
        (at t_6 p_x_2 p_y_0)
        (at t_7 p_x_2 p_y_1)
        (at t_8 p_x_2 p_y_2)
        (at t_9 p_x_0 p_y_3)
        (at t_10 p_x_1 p_y_3)
        (at t_11 p_x_2 p_y_3)
        (at t_12 p_x_3 p_y_3)
        (at t_13 p_x_3 p_y_2)
        (at t_14 p_x_3 p_y_0)
        (at t_15 p_x_3 p_y_1)
        (inc p_x_0 p_x_1)
        (inc p_x_1 p_x_2)
        (inc p_x_2 p_x_3)
        (inc p_y_0 p_y_1)
        (inc p_y_1 p_y_2)
        (inc p_y_2 p_y_3)
    )

    (:goal
        (and (blank p_x_2 p_y_2))
    )

    
    
    
)
