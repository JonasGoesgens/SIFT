(define (problem simple)
  (:domain sokoban-domain)
  (:objects s_1_1 s_1_2 s_2_2 s_3_1 s_3_2 s_3_3 s_3_4 s_4_1 s_4_2 s_4_3 s_4_4 s_5_1 s_5_2)
  (:init
     (adjacent s_1_1 s_1_2) 
     (adjacent s_1_2 s_2_2) 
     (adjacent s_1_2 s_1_1) 
     (adjacent s_2_2 s_3_2) 
     (adjacent s_2_2 s_1_2) 
     (adjacent s_3_1 s_4_1) 
     (adjacent s_3_1 s_3_2) 
     (adjacent s_3_2 s_4_2) 
     (adjacent s_3_2 s_3_3) 
     (adjacent s_3_2 s_2_2) 
     (adjacent s_3_2 s_3_1) 
     (adjacent s_3_3 s_4_3) 
     (adjacent s_3_3 s_3_4) 
     (adjacent s_3_3 s_3_2) 
     (adjacent s_3_4 s_4_4) 
     (adjacent s_3_4 s_3_3) 
     (adjacent s_4_1 s_5_1) 
     (adjacent s_4_1 s_4_2) 
     (adjacent s_4_1 s_3_1) 
     (adjacent s_4_2 s_5_2) 
     (adjacent s_4_2 s_4_3) 
     (adjacent s_4_2 s_3_2) 
     (adjacent s_4_2 s_4_1) 
     (adjacent s_4_3 s_4_4) 
     (adjacent s_4_3 s_3_3) 
     (adjacent s_4_3 s_4_2) 
     (adjacent s_4_4 s_3_4) 
     (adjacent s_4_4 s_4_3) 
     (adjacent s_5_1 s_5_2) 
     (adjacent s_5_1 s_4_1) 
     (adjacent s_5_2 s_4_2) 
     (adjacent s_5_2 s_5_1)
     (adjacent_2 s_1_1 s_3_1) 
     (adjacent_2 s_1_2 s_3_2) 
     (adjacent_2 s_2_2 s_4_2) 
     (adjacent_2 s_3_1 s_5_1) 
     (adjacent_2 s_3_1 s_3_3) 
     (adjacent_2 s_3_1 s_1_1) 
     (adjacent_2 s_3_2 s_5_2) 
     (adjacent_2 s_3_2 s_3_4) 
     (adjacent_2 s_3_2 s_1_2) 
     (adjacent_2 s_3_3 s_3_1) 
     (adjacent_2 s_3_4 s_3_2) 
     (adjacent_2 s_4_1 s_4_3) 
     (adjacent_2 s_4_2 s_4_4) 
     (adjacent_2 s_4_2 s_2_2) 
     (adjacent_2 s_4_3 s_4_1) 
     (adjacent_2 s_4_4 s_4_2) 
     (adjacent_2 s_5_1 s_3_1) 
     (adjacent_2 s_5_2 s_3_2)
     (has_player s_2_2)
     (has_box s_4_3))
  (:goal (and (has_box s_1_2)))
)
