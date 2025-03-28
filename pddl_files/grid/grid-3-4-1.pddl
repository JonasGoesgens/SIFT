(define (problem strips-grid-y-4)
   (:domain grid)
   (:objects 
        s_1_1 s_1_2 s_1_3
        s_2_1 s_2_2 s_2_3
        s_3_1 s_3_2 s_3_3 
        s_4_1 s_4_2 s_4_3
        square circle 
        key0 key1 key2 key3)
   (:init 
        (arm-empty)

        (shape square)
        (shape circle)
        ( place s_1_1)
        ( place s_1_2)
        ( place s_1_3)
        ( place s_2_1)
        ( place s_2_2)
        ( place s_2_3)
        ( place s_3_1)
        ( place s_3_2)
        ( place s_3_3)
        ( place s_4_1)
        ( place s_4_2)
        ( place s_4_3)

        (conn s_1_1 s_1_2)
        (conn s_1_2 s_1_1)
        (conn s_1_2 s_1_3)
        (conn s_1_3 s_1_2)
        (conn s_2_1 s_2_2)
        (conn s_2_2 s_2_1)
        (conn s_2_2 s_2_3)
        (conn s_2_3 s_2_2)
        (conn s_3_1 s_3_2)
        (conn s_3_2 s_3_1)
        (conn s_3_2 s_3_3)
        (conn s_3_3 s_3_2)
        (conn s_4_1 s_4_2)
        (conn s_4_2 s_4_1)
        (conn s_4_2 s_4_3)
        (conn s_4_3 s_4_2)
        (conn s_1_1 s_2_1)
        (conn s_2_1 s_1_1)
        (conn s_1_2 s_2_2)
        (conn s_2_2 s_1_2)
        (conn s_1_3 s_2_3)
        (conn s_2_3 s_1_3)
        (conn s_2_1 s_3_1)
        (conn s_3_1 s_2_1)
        (conn s_2_2 s_3_2)
        (conn s_3_2 s_2_2)
        (conn s_2_3 s_3_3)
        (conn s_3_3 s_2_3)
        (conn s_3_1 s_4_1)
        (conn s_4_1 s_3_1)
        (conn s_3_2 s_4_2)
        (conn s_4_2 s_3_2)
        (conn s_3_3 s_4_3)
        (conn s_4_3 s_3_3)

        (at-robot s_1_2)
      
        (open s_1_1)
        (open s_1_2)
        (open s_1_3)
        (open s_4_1)
        (open s_4_2)
        (open s_4_3)

        (locked s_2_1)
        (locked s_2_2)
        (locked s_2_3)
        (lock-shape s_2_1 square)
        (lock-shape s_2_2 square)
        (lock-shape s_2_3 circle)

        (locked s_3_1)
        (locked s_3_2)
        (locked s_3_3)
        (lock-shape s_3_1 circle)
        (lock-shape s_3_2 square)
        (lock-shape s_3_3 circle)

        (key key0)
        (key-shape key0 square)
        (at key0 s_1_1)

        (key key1)
        (key-shape key1 square)
        (at key1 s_4_3)

        (key key2)
        (key-shape key2 circle)
        (at key2 s_1_3)

        (key key3)
        (key-shape key3 circle)
        (at key3 s_4_1)
        )
   (:goal (and (at key0 s_4_2))))
