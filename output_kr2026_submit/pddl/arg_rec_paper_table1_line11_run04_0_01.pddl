(define (domain npuzzle)
  (:requirements :typing :strips)
  (:types
    Type0 - object
    Type1 - object
    Type2 - object
  )
  (:predicates
    (Feature_0_v0_s0 ?Arg0 - Type1 ?Arg1 - Type2)
    (Feature_0_v0_s1 ?Arg0 - Type1 ?Arg1 - Type2)
    (Feature_1_v0_s0 ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2)
    (Feature_1_v0_s1 ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2)
    (Static_move-down ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type1)
    (Static_move-left ?Arg0 - Type0 ?Arg1 - Type2 ?Arg2 - Type2 ?Arg3 - Type1)
    (Static_move-right ?Arg0 - Type0 ?Arg1 - Type2 ?Arg2 - Type2 ?Arg3 - Type1)
    (Static_move-up ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type1)
  )
  (:action move-down
    :parameters (?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type1)
    :precondition (and
      (Feature_1_v0_s0 ?Arg0 ?Arg1 ?Arg2) (Feature_0_v0_s0 ?Arg3 ?Arg2) (Feature_0_v0_s1 ?Arg1 ?Arg2) (Feature_1_v0_s1 ?Arg0 ?Arg3 ?Arg2)
      (Static_move-down ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_1_v0_s0 ?Arg0 ?Arg3 ?Arg2) (Feature_0_v0_s0 ?Arg1 ?Arg2) (Feature_0_v0_s1 ?Arg3 ?Arg2) (Feature_1_v0_s1 ?Arg0 ?Arg1 ?Arg2)
      (not (Feature_1_v0_s0 ?Arg0 ?Arg1 ?Arg2)) (not (Feature_0_v0_s0 ?Arg3 ?Arg2)) (not (Feature_0_v0_s1 ?Arg1 ?Arg2)) (not (Feature_1_v0_s1 ?Arg0 ?Arg3 ?Arg2))
    )
  )
  (:action move-left
    :parameters (?Arg0 - Type0 ?Arg1 - Type2 ?Arg2 - Type2 ?Arg3 - Type1)
    :precondition (and
      (Feature_1_v0_s0 ?Arg0 ?Arg3 ?Arg1) (Feature_0_v0_s0 ?Arg3 ?Arg2) (Feature_1_v0_s1 ?Arg0 ?Arg3 ?Arg2) (Feature_0_v0_s1 ?Arg3 ?Arg1)
      (Static_move-left ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_0_v0_s1 ?Arg3 ?Arg2) (Feature_1_v0_s0 ?Arg0 ?Arg3 ?Arg2) (Feature_0_v0_s0 ?Arg3 ?Arg1) (Feature_1_v0_s1 ?Arg0 ?Arg3 ?Arg1)
      (not (Feature_1_v0_s0 ?Arg0 ?Arg3 ?Arg1)) (not (Feature_0_v0_s0 ?Arg3 ?Arg2)) (not (Feature_1_v0_s1 ?Arg0 ?Arg3 ?Arg2)) (not (Feature_0_v0_s1 ?Arg3 ?Arg1))
    )
  )
  (:action move-right
    :parameters (?Arg0 - Type0 ?Arg1 - Type2 ?Arg2 - Type2 ?Arg3 - Type1)
    :precondition (and
      (Feature_1_v0_s0 ?Arg0 ?Arg3 ?Arg1) (Feature_0_v0_s0 ?Arg3 ?Arg2) (Feature_1_v0_s1 ?Arg0 ?Arg3 ?Arg2) (Feature_0_v0_s1 ?Arg3 ?Arg1)
      (Static_move-right ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_0_v0_s1 ?Arg3 ?Arg2) (Feature_1_v0_s0 ?Arg0 ?Arg3 ?Arg2) (Feature_0_v0_s0 ?Arg3 ?Arg1) (Feature_1_v0_s1 ?Arg0 ?Arg3 ?Arg1)
      (not (Feature_1_v0_s0 ?Arg0 ?Arg3 ?Arg1)) (not (Feature_0_v0_s0 ?Arg3 ?Arg2)) (not (Feature_1_v0_s1 ?Arg0 ?Arg3 ?Arg2)) (not (Feature_0_v0_s1 ?Arg3 ?Arg1))
    )
  )
  (:action move-up
    :parameters (?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type1)
    :precondition (and
      (Feature_1_v0_s0 ?Arg0 ?Arg1 ?Arg2) (Feature_0_v0_s0 ?Arg3 ?Arg2) (Feature_0_v0_s1 ?Arg1 ?Arg2) (Feature_1_v0_s1 ?Arg0 ?Arg3 ?Arg2)
      (Static_move-up ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_1_v0_s0 ?Arg0 ?Arg3 ?Arg2) (Feature_0_v0_s0 ?Arg1 ?Arg2) (Feature_0_v0_s1 ?Arg3 ?Arg2) (Feature_1_v0_s1 ?Arg0 ?Arg1 ?Arg2)
      (not (Feature_1_v0_s0 ?Arg0 ?Arg1 ?Arg2)) (not (Feature_0_v0_s0 ?Arg3 ?Arg2)) (not (Feature_0_v0_s1 ?Arg1 ?Arg2)) (not (Feature_1_v0_s1 ?Arg0 ?Arg3 ?Arg2))
    )
  )
)

