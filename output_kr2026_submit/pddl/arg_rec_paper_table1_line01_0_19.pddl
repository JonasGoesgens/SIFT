(define (domain blocks_4ops)
  (:requirements :typing :strips)
  (:types
    Type0 - object
  )
  (:predicates
    (Feature_0_v0_s0)
    (Feature_0_v0_s1)
    (Feature_1_v0_s0 ?Arg0 - Type0)
    (Feature_1_v0_s1 ?Arg0 - Type0)
    (Feature_2_v0_s0 ?Arg0 - Type0)
    (Feature_2_v0_s1 ?Arg0 - Type0)
    (Feature_3_v0_s0 ?Arg0 - Type0)
    (Feature_3_v0_s1 ?Arg0 - Type0)
    (Feature_4_v0_s0 ?Arg0 - Type0 ?Arg1 - Type0)
    (Feature_4_v0_s1 ?Arg0 - Type0 ?Arg1 - Type0)
    (Static_stack ?Arg0 - Type0 ?Arg1 - Type0)
    (Static_pick-up ?Arg0 - Type0)
    (Static_unstack ?Arg0 - Type0 ?Arg1 - Type0)
    (Static_put-down ?Arg0 - Type0)
  )
  (:action stack
    :parameters (?Arg0 - Type0 ?Arg1 - Type0)
    :precondition (and
      (Feature_3_v0_s0 ?Arg1) (Feature_0_v0_s0) (Feature_4_v0_s1 ?Arg0 ?Arg1) (Feature_2_v0_s1 ?Arg0)
      (Feature_2_v0_s0 ?Arg1) (Feature_4_v0_s1 ?Arg1 ?Arg0) (Static_stack ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_2_v0_s0 ?Arg0) (Feature_0_v0_s1) (Feature_4_v0_s0 ?Arg1 ?Arg0) (Feature_2_v0_s1 ?Arg1)
      (Feature_4_v0_s0 ?Arg0 ?Arg1) (Feature_3_v0_s1 ?Arg1)
      (not (Feature_3_v0_s0 ?Arg1)) (not (Feature_0_v0_s0)) (not (Feature_4_v0_s1 ?Arg0 ?Arg1)) (not (Feature_2_v0_s1 ?Arg0))
      (not (Feature_2_v0_s0 ?Arg1)) (not (Feature_4_v0_s1 ?Arg1 ?Arg0))
    )
  )
  (:action pick-up
    :parameters (?Arg0 - Type0)
    :precondition (and
      (Feature_0_v0_s1) (Feature_2_v0_s1 ?Arg0) (Feature_1_v0_s1 ?Arg0) (Feature_3_v0_s1 ?Arg0)
      (Static_pick-up ?Arg0)
    )
    :effect (and
      (Feature_0_v0_s0) (Feature_2_v0_s0 ?Arg0) (Feature_1_v0_s0 ?Arg0) (Feature_3_v0_s0 ?Arg0)
      (not (Feature_0_v0_s1)) (not (Feature_2_v0_s1 ?Arg0)) (not (Feature_1_v0_s1 ?Arg0)) (not (Feature_3_v0_s1 ?Arg0))
    )
  )
  (:action unstack
    :parameters (?Arg0 - Type0 ?Arg1 - Type0)
    :precondition (and
      (Feature_3_v0_s1 ?Arg0) (Feature_0_v0_s1) (Feature_4_v0_s0 ?Arg1 ?Arg0) (Feature_2_v0_s1 ?Arg0)
      (Feature_4_v0_s0 ?Arg0 ?Arg1) (Feature_2_v0_s0 ?Arg1) (Static_unstack ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_2_v0_s0 ?Arg0) (Feature_0_v0_s0) (Feature_4_v0_s1 ?Arg0 ?Arg1) (Feature_3_v0_s0 ?Arg0)
      (Feature_2_v0_s1 ?Arg1) (Feature_4_v0_s1 ?Arg1 ?Arg0)
      (not (Feature_3_v0_s1 ?Arg0)) (not (Feature_0_v0_s1)) (not (Feature_4_v0_s0 ?Arg1 ?Arg0)) (not (Feature_2_v0_s1 ?Arg0))
      (not (Feature_4_v0_s0 ?Arg0 ?Arg1)) (not (Feature_2_v0_s0 ?Arg1))
    )
  )
  (:action put-down
    :parameters (?Arg0 - Type0)
    :precondition (and
      (Feature_0_v0_s0) (Feature_2_v0_s0 ?Arg0) (Feature_1_v0_s0 ?Arg0) (Feature_3_v0_s0 ?Arg0)
      (Static_put-down ?Arg0)
    )
    :effect (and
      (Feature_0_v0_s1) (Feature_2_v0_s1 ?Arg0) (Feature_1_v0_s1 ?Arg0) (Feature_3_v0_s1 ?Arg0)
      (not (Feature_0_v0_s0)) (not (Feature_2_v0_s0 ?Arg0)) (not (Feature_1_v0_s0 ?Arg0)) (not (Feature_3_v0_s0 ?Arg0))
    )
  )
)

