(define (domain grid)
  (:requirements :typing :strips)
  (:types
    Type0 - object
    Type1 - object
    Type2 - object
  )
  (:predicates
    (Feature_0_v0_s0)
    (Feature_0_v0_s1)
    (Feature_1_v0_s0 ?Arg0 - Type0)
    (Feature_1_v0_s1 ?Arg0 - Type0)
    (Feature_2_v0_s0 ?Arg0 - Type0)
    (Feature_2_v0_s1 ?Arg0 - Type0)
    (Feature_3_v0_s0 ?Arg0 - Type1)
    (Feature_3_v0_s1 ?Arg0 - Type1)
    (Feature_4_v0_s0 ?Arg0 - Type0 ?Arg1 - Type1)
    (Feature_4_v0_s1 ?Arg0 - Type0 ?Arg1 - Type1)
    (Static_move ?Arg0 - Type0 ?Arg1 - Type0)
    (Static_pickup ?Arg0 - Type1 ?Arg1 - Type0)
    (Static_pickup-and-loose ?Arg0 - Type1 ?Arg1 - Type1 ?Arg2 - Type0)
    (Static_unlock ?Arg0 - Type0 ?Arg1 - Type2 ?Arg2 - Type1 ?Arg3 - Type0)
    (Static_putdown ?Arg0 - Type1 ?Arg1 - Type0)
  )
  (:action move
    :parameters (?Arg0 - Type0 ?Arg1 - Type0)
    :precondition (and
      (Feature_2_v0_s0 ?Arg1) (Feature_1_v0_s1 ?Arg0) (Feature_1_v0_s0 ?Arg1) (Feature_2_v0_s1 ?Arg0)
      (Static_move ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_1_v0_s1 ?Arg1) (Feature_1_v0_s0 ?Arg0) (Feature_2_v0_s1 ?Arg1) (Feature_2_v0_s0 ?Arg0)
      (not (Feature_2_v0_s0 ?Arg1)) (not (Feature_1_v0_s1 ?Arg0)) (not (Feature_1_v0_s0 ?Arg1)) (not (Feature_2_v0_s1 ?Arg0))
    )
  )
  (:action pickup
    :parameters (?Arg0 - Type1 ?Arg1 - Type0)
    :precondition (and
      (Feature_4_v0_s0 ?Arg1 ?Arg0) (Feature_2_v0_s0 ?Arg1) (Feature_0_v0_s1) (Feature_3_v0_s1 ?Arg0)
      (Static_pickup ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_3_v0_s0 ?Arg0) (Feature_4_v0_s1 ?Arg1 ?Arg0) (Feature_0_v0_s0)
      (not (Feature_4_v0_s0 ?Arg1 ?Arg0)) (not (Feature_0_v0_s1)) (not (Feature_3_v0_s1 ?Arg0))
    )
  )
  (:action pickup-and-loose
    :parameters (?Arg0 - Type1 ?Arg1 - Type1 ?Arg2 - Type0)
    :precondition (and
      (Feature_2_v0_s0 ?Arg2) (Feature_3_v0_s1 ?Arg0) (Feature_3_v0_s0 ?Arg1) (Feature_4_v0_s0 ?Arg2 ?Arg0)
      (Feature_4_v0_s1 ?Arg2 ?Arg1) (Static_pickup-and-loose ?Arg0 ?Arg1 ?Arg2)
    )
    :effect (and
      (Feature_4_v0_s0 ?Arg2 ?Arg1) (Feature_3_v0_s1 ?Arg1) (Feature_3_v0_s0 ?Arg0) (Feature_4_v0_s1 ?Arg2 ?Arg0)
      (not (Feature_4_v0_s1 ?Arg2 ?Arg1)) (not (Feature_3_v0_s1 ?Arg0)) (not (Feature_4_v0_s0 ?Arg2 ?Arg0)) (not (Feature_3_v0_s0 ?Arg1))
    )
  )
  (:action unlock
    :parameters (?Arg0 - Type0 ?Arg1 - Type2 ?Arg2 - Type1 ?Arg3 - Type0)
    :precondition (and
      (Feature_1_v0_s0 ?Arg3) (Feature_3_v0_s0 ?Arg2) (Feature_2_v0_s0 ?Arg0) (Static_unlock ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_2_v0_s1 ?Arg0)
      (not (Feature_2_v0_s0 ?Arg0))
    )
  )
  (:action putdown
    :parameters (?Arg0 - Type1 ?Arg1 - Type0)
    :precondition (and
      (Feature_4_v0_s1 ?Arg1 ?Arg0) (Feature_3_v0_s0 ?Arg0) (Feature_1_v0_s0 ?Arg1) (Feature_0_v0_s0)
      (Static_putdown ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_4_v0_s0 ?Arg1 ?Arg0) (Feature_0_v0_s1) (Feature_3_v0_s1 ?Arg0)
      (not (Feature_3_v0_s0 ?Arg0)) (not (Feature_4_v0_s1 ?Arg1 ?Arg0)) (not (Feature_0_v0_s0))
    )
  )
)

