(define (domain sdelivery)
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
    (Static_drop ?Arg0 - Type0 ?Arg1 - Type1)
    (Static_pick ?Arg0 - Type0 ?Arg1 - Type1)
    (Static_left ?Arg0 - Type1 ?Arg1 - Type1)
    (Static_right ?Arg0 - Type1 ?Arg1 - Type1)
    (Static_up ?Arg0 - Type1 ?Arg1 - Type1)
    (Static_down ?Arg0 - Type1 ?Arg1 - Type1)
  )
  (:action drop
    :parameters (?Arg0 - Type0 ?Arg1 - Type1)
    :precondition (and
      (Feature_1_v0_s0 ?Arg0) (Feature_0_v0_s0) (Feature_2_v0_s0 ?Arg1) (Feature_3_v0_s1 ?Arg0 ?Arg1)
      (Static_drop ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_0_v0_s1) (Feature_1_v0_s1 ?Arg0) (Feature_3_v0_s0 ?Arg0 ?Arg1)
      (not (Feature_1_v0_s0 ?Arg0)) (not (Feature_0_v0_s0)) (not (Feature_3_v0_s1 ?Arg0 ?Arg1))
    )
  )
  (:action pick
    :parameters (?Arg0 - Type0 ?Arg1 - Type1)
    :precondition (and
      (Feature_0_v0_s1) (Feature_2_v0_s0 ?Arg1) (Feature_1_v0_s1 ?Arg0) (Feature_3_v0_s0 ?Arg0 ?Arg1)
      (Static_pick ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_1_v0_s0 ?Arg0) (Feature_0_v0_s0) (Feature_3_v0_s1 ?Arg0 ?Arg1)
      (not (Feature_0_v0_s1)) (not (Feature_1_v0_s1 ?Arg0)) (not (Feature_3_v0_s0 ?Arg0 ?Arg1))
    )
  )
  (:action left
    :parameters (?Arg0 - Type1 ?Arg1 - Type1)
    :precondition (and
      (Feature_2_v0_s0 ?Arg0) (Feature_2_v0_s1 ?Arg1) (Static_left ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_2_v0_s1 ?Arg0) (Feature_2_v0_s0 ?Arg1)
      (not (Feature_2_v0_s0 ?Arg0)) (not (Feature_2_v0_s1 ?Arg1))
    )
  )
  (:action right
    :parameters (?Arg0 - Type1 ?Arg1 - Type1)
    :precondition (and
      (Feature_2_v0_s0 ?Arg0) (Feature_2_v0_s1 ?Arg1) (Static_right ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_2_v0_s1 ?Arg0) (Feature_2_v0_s0 ?Arg1)
      (not (Feature_2_v0_s0 ?Arg0)) (not (Feature_2_v0_s1 ?Arg1))
    )
  )
  (:action up
    :parameters (?Arg0 - Type1 ?Arg1 - Type1)
    :precondition (and
      (Feature_2_v0_s0 ?Arg0) (Feature_2_v0_s1 ?Arg1) (Static_up ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_2_v0_s1 ?Arg0) (Feature_2_v0_s0 ?Arg1)
      (not (Feature_2_v0_s0 ?Arg0)) (not (Feature_2_v0_s1 ?Arg1))
    )
  )
  (:action down
    :parameters (?Arg0 - Type1 ?Arg1 - Type1)
    :precondition (and
      (Feature_2_v0_s0 ?Arg0) (Feature_2_v0_s1 ?Arg1) (Static_down ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_2_v0_s1 ?Arg0) (Feature_2_v0_s0 ?Arg1)
      (not (Feature_2_v0_s0 ?Arg0)) (not (Feature_2_v0_s1 ?Arg1))
    )
  )
)

