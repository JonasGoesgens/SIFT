(define (domain logistics)
  (:requirements :typing :strips)
  (:types
    Type0 - object
    Type1 - object
    Type2 - object
    Type3 - object
  )
  (:predicates
    (Feature_0_v0_s0 ?Arg0 - Type0 ?Arg1 - Type1)
    (Feature_0_v0_s1 ?Arg0 - Type0 ?Arg1 - Type1)
    (Feature_1_v0_s0 ?Arg0 - Type0 ?Arg1 - Type1)
    (Feature_1_v0_s1 ?Arg0 - Type0 ?Arg1 - Type1)
    (Feature_2_v0_s0 ?Arg0 - Type0 ?Arg1 - Type3)
    (Feature_2_v0_s1 ?Arg0 - Type0 ?Arg1 - Type3)
    (Feature_3_v0_s0 ?Arg0 - Type1 ?Arg1 - Type3)
    (Feature_3_v0_s1 ?Arg0 - Type1 ?Arg1 - Type3)
    (Static_drive ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type1)
    (Static_fly ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type1)
    (Static_load ?Arg0 - Type3 ?Arg1 - Type0 ?Arg2 - Type1)
    (Static_unload ?Arg0 - Type3 ?Arg1 - Type0 ?Arg2 - Type1)
  )
  (:action drive
    :parameters (?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type1)
    :precondition (and
      (Feature_1_v0_s1 ?Arg0 ?Arg1) (Feature_1_v0_s0 ?Arg0 ?Arg3) (Static_drive ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_1_v0_s1 ?Arg0 ?Arg3) (Feature_1_v0_s0 ?Arg0 ?Arg1)
      (not (Feature_1_v0_s1 ?Arg0 ?Arg1)) (not (Feature_1_v0_s0 ?Arg0 ?Arg3))
    )
  )
  (:action fly
    :parameters (?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type1)
    :precondition (and
      (Feature_0_v0_s1 ?Arg0 ?Arg1) (Feature_0_v0_s0 ?Arg0 ?Arg2) (Static_fly ?Arg0 ?Arg1 ?Arg2)
    )
    :effect (and
      (Feature_0_v0_s0 ?Arg0 ?Arg1) (Feature_0_v0_s1 ?Arg0 ?Arg2)
      (not (Feature_0_v0_s1 ?Arg0 ?Arg1)) (not (Feature_0_v0_s0 ?Arg0 ?Arg2))
    )
  )
  (:action load
    :parameters (?Arg0 - Type3 ?Arg1 - Type0 ?Arg2 - Type1)
    :precondition (and
      (Feature_0_v0_s0 ?Arg1 ?Arg2) (Feature_2_v0_s1 ?Arg1 ?Arg0) (Feature_1_v0_s0 ?Arg1 ?Arg2) (Feature_3_v0_s0 ?Arg2 ?Arg0)
      (Static_load ?Arg0 ?Arg1 ?Arg2)
    )
    :effect (and
      (Feature_3_v0_s1 ?Arg2 ?Arg0) (Feature_2_v0_s0 ?Arg1 ?Arg0)
      (not (Feature_2_v0_s1 ?Arg1 ?Arg0)) (not (Feature_3_v0_s0 ?Arg2 ?Arg0))
    )
  )
  (:action unload
    :parameters (?Arg0 - Type3 ?Arg1 - Type0 ?Arg2 - Type1)
    :precondition (and
      (Feature_0_v0_s0 ?Arg1 ?Arg2) (Feature_1_v0_s0 ?Arg1 ?Arg2) (Feature_3_v0_s1 ?Arg2 ?Arg0) (Feature_2_v0_s0 ?Arg1 ?Arg0)
      (Static_unload ?Arg0 ?Arg1 ?Arg2)
    )
    :effect (and
      (Feature_2_v0_s1 ?Arg1 ?Arg0) (Feature_3_v0_s0 ?Arg2 ?Arg0)
      (not (Feature_3_v0_s1 ?Arg2 ?Arg0)) (not (Feature_2_v0_s0 ?Arg1 ?Arg0))
    )
  )
)

