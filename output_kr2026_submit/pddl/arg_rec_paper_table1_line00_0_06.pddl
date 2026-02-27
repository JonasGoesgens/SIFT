(define (domain blocks_world)
  (:requirements :typing :strips)
  (:types
    Type0 - object
  )
  (:predicates
    (Feature_0_v0_s0 ?Arg0 - Type0)
    (Feature_0_v0_s1 ?Arg0 - Type0)
    (Feature_1_v0_s0 ?Arg0 - Type0)
    (Feature_1_v0_s1 ?Arg0 - Type0)
    (Feature_2_v0_s0 ?Arg0 - Type0 ?Arg1 - Type0)
    (Feature_2_v0_s1 ?Arg0 - Type0 ?Arg1 - Type0)
    (Static_stack ?Arg0 - Type0 ?Arg1 - Type0)
    (Static_newtower ?Arg0 - Type0 ?Arg1 - Type0)
    (Static_move ?Arg0 - Type0 ?Arg1 - Type0 ?Arg2 - Type0)
  )
  (:action stack
    :parameters (?Arg0 - Type0 ?Arg1 - Type0)
    :precondition (and
      (Feature_2_v0_s1 ?Arg1 ?Arg0) (Feature_0_v0_s1 ?Arg1) (Feature_0_v0_s1 ?Arg0) (Feature_2_v0_s1 ?Arg0 ?Arg1)
      (Feature_1_v0_s0 ?Arg0) (Static_stack ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_2_v0_s0 ?Arg0 ?Arg1) (Feature_1_v0_s1 ?Arg0) (Feature_0_v0_s0 ?Arg1) (Feature_2_v0_s0 ?Arg1 ?Arg0)
      (not (Feature_2_v0_s1 ?Arg1 ?Arg0)) (not (Feature_0_v0_s1 ?Arg1)) (not (Feature_2_v0_s1 ?Arg0 ?Arg1)) (not (Feature_1_v0_s0 ?Arg0))
    )
  )
  (:action newtower
    :parameters (?Arg0 - Type0 ?Arg1 - Type0)
    :precondition (and
      (Feature_2_v0_s0 ?Arg0 ?Arg1) (Feature_0_v0_s1 ?Arg0) (Feature_1_v0_s1 ?Arg0) (Feature_0_v0_s0 ?Arg1)
      (Feature_2_v0_s0 ?Arg1 ?Arg0) (Static_newtower ?Arg0 ?Arg1)
    )
    :effect (and
      (Feature_2_v0_s1 ?Arg1 ?Arg0) (Feature_0_v0_s1 ?Arg1) (Feature_2_v0_s1 ?Arg0 ?Arg1) (Feature_1_v0_s0 ?Arg0)
      (not (Feature_2_v0_s0 ?Arg0 ?Arg1)) (not (Feature_1_v0_s1 ?Arg0)) (not (Feature_0_v0_s0 ?Arg1)) (not (Feature_2_v0_s0 ?Arg1 ?Arg0))
    )
  )
  (:action move
    :parameters (?Arg0 - Type0 ?Arg1 - Type0 ?Arg2 - Type0)
    :precondition (and
      (Feature_2_v0_s0 ?Arg0 ?Arg2) (Feature_0_v0_s0 ?Arg2) (Feature_0_v0_s1 ?Arg1) (Feature_2_v0_s0 ?Arg2 ?Arg0)
      (Feature_2_v0_s1 ?Arg1 ?Arg0) (Feature_0_v0_s1 ?Arg0) (Feature_2_v0_s1 ?Arg0 ?Arg1) (Static_move ?Arg0 ?Arg1 ?Arg2)
    )
    :effect (and
      (Feature_2_v0_s0 ?Arg0 ?Arg1) (Feature_2_v0_s1 ?Arg0 ?Arg2) (Feature_2_v0_s1 ?Arg2 ?Arg0) (Feature_0_v0_s1 ?Arg2)
      (Feature_0_v0_s0 ?Arg1) (Feature_2_v0_s0 ?Arg1 ?Arg0)
      (not (Feature_2_v0_s0 ?Arg0 ?Arg2)) (not (Feature_0_v0_s0 ?Arg2)) (not (Feature_0_v0_s1 ?Arg1)) (not (Feature_2_v0_s0 ?Arg2 ?Arg0))
      (not (Feature_2_v0_s1 ?Arg1 ?Arg0)) (not (Feature_2_v0_s1 ?Arg0 ?Arg1))
    )
  )
)

