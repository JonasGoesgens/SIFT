(define (problem npuzzle-2-3)
    (:domain npuzzle)

    (:objects
        p_x_0 p_x_1 p_y_0 p_y_1 p_y_2
        t_1 t_2 t_3 t_4 t_5
    )

    (:init
        (position p_x_0)
        (position p_x_1)
        (position p_y_0)
        (position p_y_1)
        (position p_y_2)
        (tile t_1)
        (tile t_2)
        (tile t_3)
        (tile t_4)
        (tile t_5)
        (blank p_x_0 p_y_0)
        (at t_1 p_x_0 p_y_1)
        (at t_2 p_x_0 p_y_2)
        (at t_3 p_x_1 p_y_0)
        (at t_4 p_x_1 p_y_1)
        (at t_5 p_x_1 p_y_2)
        (inc p_x_0 p_x_1)
        (inc p_y_0 p_y_1)
        (inc p_y_1 p_y_2)
    )

    (:goal
        (and (blank p_x_1 p_y_2))
    )

    
    
    
)
