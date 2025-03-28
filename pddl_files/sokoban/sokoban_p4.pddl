; ;                  s_1_3   s_1_4
; ;                  b_2_3   s_2_4
; ;  s_3_1   b_3_2   s_3_3   s_3_4   p_3_5
; ;  s_4_1   s_4_2   s_4_3   s_4_4   s_4_5
; ;          b_5_2   s_5_3   s_5_4
; ;          s_6_2   s_6_3
(define (problem simple)
  (:domain sokoban-domain)
  (:objects s_1_3 s_1_4 s_2_3 s_2_4 s_3_1 s_3_2 s_3_3 s_3_4 s_3_5 s_4_1 s_4_2 s_4_3 s_4_4 s_4_5 s_5_2 s_5_3 s_5_4 s_6_2 s_6_3)
  (:init
     (adjacent s_1_3 s_2_3) (adjacent s_1_3 s_1_4) (adjacent s_1_4 s_2_4) (adjacent s_1_4 s_1_3) (adjacent s_2_3 s_3_3) (adjacent s_2_3 s_2_4) (adjacent s_2_3 s_1_3) (adjacent s_2_4 s_3_4) (adjacent s_2_4 s_1_4) (adjacent s_2_4 s_2_3) (adjacent s_3_1 s_4_1) (adjacent s_3_1 s_3_2) (adjacent s_3_2 s_4_2) (adjacent s_3_2 s_3_3) (adjacent s_3_2 s_3_1) (adjacent s_3_3 s_4_3) (adjacent s_3_3 s_3_4) (adjacent s_3_3 s_2_3) (adjacent s_3_3 s_3_2) (adjacent s_3_4 s_4_4) (adjacent s_3_4 s_3_5) (adjacent s_3_4 s_2_4) (adjacent s_3_4 s_3_3) (adjacent s_3_5 s_4_5) (adjacent s_3_5 s_3_4) (adjacent s_4_1 s_4_2) (adjacent s_4_1 s_3_1) (adjacent s_4_2 s_5_2) (adjacent s_4_2 s_4_3) (adjacent s_4_2 s_3_2) (adjacent s_4_2 s_4_1) (adjacent s_4_3 s_5_3) (adjacent s_4_3 s_4_4) (adjacent s_4_3 s_3_3) (adjacent s_4_3 s_4_2) (adjacent s_4_4 s_5_4) (adjacent s_4_4 s_4_5) (adjacent s_4_4 s_3_4) (adjacent s_4_4 s_4_3) (adjacent s_4_5 s_3_5) (adjacent s_4_5 s_4_4) (adjacent s_5_2 s_6_2) (adjacent s_5_2 s_5_3) (adjacent s_5_2 s_4_2) (adjacent s_5_3 s_6_3) (adjacent s_5_3 s_5_4) (adjacent s_5_3 s_4_3) (adjacent s_5_3 s_5_2) (adjacent s_5_4 s_4_4) (adjacent s_5_4 s_5_3) (adjacent s_6_2 s_6_3) (adjacent s_6_2 s_5_2) (adjacent s_6_3 s_5_3) (adjacent s_6_3 s_6_2)
     (adjacent_2 s_1_3 s_3_3) (adjacent_2 s_1_4 s_3_4) (adjacent_2 s_2_3 s_4_3) (adjacent_2 s_2_4 s_4_4) (adjacent_2 s_3_1 s_3_3) (adjacent_2 s_3_2 s_5_2) (adjacent_2 s_3_2 s_3_4) (adjacent_2 s_3_3 s_5_3) (adjacent_2 s_3_3 s_3_5) (adjacent_2 s_3_3 s_1_3) (adjacent_2 s_3_3 s_3_1) (adjacent_2 s_3_4 s_5_4) (adjacent_2 s_3_4 s_1_4) (adjacent_2 s_3_4 s_3_2) (adjacent_2 s_3_5 s_3_3) (adjacent_2 s_4_1 s_4_3) (adjacent_2 s_4_2 s_6_2) (adjacent_2 s_4_2 s_4_4) (adjacent_2 s_4_3 s_6_3) (adjacent_2 s_4_3 s_4_5) (adjacent_2 s_4_3 s_2_3) (adjacent_2 s_4_3 s_4_1) (adjacent_2 s_4_4 s_2_4) (adjacent_2 s_4_4 s_4_2) (adjacent_2 s_4_5 s_4_3) (adjacent_2 s_5_2 s_5_4) (adjacent_2 s_5_2 s_3_2) (adjacent_2 s_5_3 s_3_3) (adjacent_2 s_5_4 s_3_4) (adjacent_2 s_5_4 s_5_2) (adjacent_2 s_6_2 s_4_2) (adjacent_2 s_6_3 s_4_3)
     (has_player s_3_5)
     (has_box s_2_3) (has_box s_3_2) (has_box s_5_2))
  (:goal (and (has_box s_4_2) (has_box s_4_3) (has_box s_4_4)))
)
