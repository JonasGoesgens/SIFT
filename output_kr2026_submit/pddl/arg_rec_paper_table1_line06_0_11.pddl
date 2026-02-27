(define (domain gripper)
  (:requirements :typing :strips)
  (:types
    Type0 - object
    Type1 - object
    Type2 - object
  )
  (:predicates
    (Feature_0_v0_s0 ?Arg0 - Type1)
    (Feature_0_v0_s1 ?Arg0 - Type1)
    (Feature_1_v0_s0 ?Arg0 - Type2)
    (Feature_1_v0_s1 ?Arg0 - Type2)
    (Feature_2_v0_s0 ?Arg0 - Type0 ?Arg1 - Type2)
    (Feature_2_v0_s1 ?Arg0 - Type0 ?Arg1 - Type2)
    (Feature_3_v0_s0 ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2)
    (Feature_3_v0_s1 ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2)
    (Static_pick ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type2)
    (Static_drop ?Arg0 - Type1 ?Arg1 - Type2 ?Arg2 - Type0 ?Arg3 - Type2)
    (Static_move ?Arg0 - Type2 ?Arg1 - Type2)
  )
  (:action pick
    :parameters (?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type2)
    :precondition (and
      (Feature_0_v0_s0 ?Arg1) (Feature_2_v0_s1 ?Arg0 ?Arg3) (Feature_3_v0_s1 ?Arg0 ?Arg1 ?Arg2) (Feature_1_v0_s1 ?Arg2)
      (Feature_3_v0_s1 ?Arg0 ?Arg1 ?Arg3) (Static_pick ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_3_v0_s0 ?Arg0 ?Arg1 ?Arg3) (Feature_0_v0_s1 ?Arg1) (Feature_3_v0_s0 ?Arg0 ?Arg1 ?Arg2) (Feature_2_v0_s0 ?Arg0 ?Arg3)
      (not (Feature_0_v0_s0 ?Arg1)) (not (Feature_3_v0_s1 ?Arg0 ?Arg1 ?Arg2)) (not (Feature_2_v0_s1 ?Arg0 ?Arg3)) (not (Feature_3_v0_s1 ?Arg0 ?Arg1 ?Arg3))
    )
  )
  (:action drop
    :parameters (?Arg0 - Type1 ?Arg1 - Type2 ?Arg2 - Type0 ?Arg3 - Type2)
    :precondition (and
      (Feature_3_v0_s0 ?Arg2 ?Arg0 ?Arg1) (Feature_1_v0_s1 ?Arg1) (Feature_0_v0_s1 ?Arg0) (Feature_2_v0_s0 ?Arg2 ?Arg3)
      (Feature_3_v0_s0 ?Arg2 ?Arg0 ?Arg3) (Static_drop ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_3_v0_s1 ?Arg2 ?Arg0 ?Arg3) (Feature_2_v0_s1 ?Arg2 ?Arg3) (Feature_3_v0_s1 ?Arg2 ?Arg0 ?Arg1) (Feature_0_v0_s0 ?Arg0)
      (not (Feature_3_v0_s0 ?Arg2 ?Arg0 ?Arg1)) (not (Feature_2_v0_s0 ?Arg2 ?Arg3)) (not (Feature_3_v0_s0 ?Arg2 ?Arg0 ?Arg3)) (not (Feature_0_v0_s1 ?Arg0))
    )
  )
  (:action move
    :parameters (?Arg0 - Type2 ?Arg1 - Type2)
    :precondition (and
      (Feature_1_v0_s0 ?Arg0) (Feature_1_v0_s1 ?Arg1) (Static_move ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_1_v0_s0 ?Arg1) (Feature_1_v0_s1 ?Arg0)
      (not (Feature_1_v0_s0 ?Arg0)) (not (Feature_1_v0_s1 ?Arg1))
    )
  )
)

