(define (domain ferry)
  (:requirements :typing :strips)
  (:types
    Type0 - object
    Type1 - object
  )
  (:predicates
    (Feature_0_v0_s0)
    (Feature_0_v0_s1)
    (Feature_1_v0_s0 ?Arg0 - Type0)
    (Feature_1_v0_s1 ?Arg0 - Type0)
    (Feature_2_v0_s0 ?Arg0 - Type1)
    (Feature_2_v0_s1 ?Arg0 - Type1)
    (Feature_3_v0_s0 ?Arg0 - Type0 ?Arg1 - Type1)
    (Feature_3_v0_s1 ?Arg0 - Type0 ?Arg1 - Type1)
    (Static_sail ?Arg0 - Type0 ?Arg1 - Type0)
    (Static_board ?Arg0 - Type1 ?Arg1 - Type0)
    (Static_debark ?Arg0 - Type1 ?Arg1 - Type0)
  )
  (:action sail
    :parameters (?Arg0 - Type0 ?Arg1 - Type0)
    :precondition (and
      (Feature_1_v0_s1 ?Arg0) (Feature_1_v0_s0 ?Arg1) (Static_sail ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_1_v0_s1 ?Arg1) (Feature_1_v0_s0 ?Arg0)
      (not (Feature_1_v0_s1 ?Arg0)) (not (Feature_1_v0_s0 ?Arg1))
    )
  )
  (:action board
    :parameters (?Arg0 - Type1 ?Arg1 - Type0)
    :precondition (and
      (Feature_0_v0_s1) (Feature_2_v0_s1 ?Arg0) (Feature_3_v0_s0 ?Arg1 ?Arg0) (Feature_1_v0_s0 ?Arg1)
      (Static_board ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_2_v0_s0 ?Arg0) (Feature_3_v0_s1 ?Arg1 ?Arg0) (Feature_0_v0_s0)
      (not (Feature_0_v0_s1)) (not (Feature_2_v0_s1 ?Arg0)) (not (Feature_3_v0_s0 ?Arg1 ?Arg0))
    )
  )
  (:action debark
    :parameters (?Arg0 - Type1 ?Arg1 - Type0)
    :precondition (and
      (Feature_2_v0_s0 ?Arg0) (Feature_3_v0_s1 ?Arg1 ?Arg0) (Feature_0_v0_s0) (Feature_1_v0_s0 ?Arg1)
      (Static_debark ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_0_v0_s1) (Feature_2_v0_s1 ?Arg0) (Feature_3_v0_s0 ?Arg1 ?Arg0)
      (not (Feature_2_v0_s0 ?Arg0)) (not (Feature_3_v0_s1 ?Arg1 ?Arg0)) (not (Feature_0_v0_s0))
    )
  )
)

