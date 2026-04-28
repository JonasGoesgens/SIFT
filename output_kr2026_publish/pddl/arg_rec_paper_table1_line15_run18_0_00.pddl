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
    (Feature_1_v0_s0 ?Arg0 - Type0 ?Arg1 - Type2 ?Arg2 - Type3)
    (Feature_1_v0_s1 ?Arg0 - Type0 ?Arg1 - Type2 ?Arg2 - Type3)
    (Feature_2_v0_s0 ?Arg0 - Type1 ?Arg1 - Type2 ?Arg2 - Type3)
    (Feature_2_v0_s1 ?Arg0 - Type1 ?Arg1 - Type2 ?Arg2 - Type3)
    (Feature_3_v0_s0 ?Arg0 - Type1 ?Arg1 - Type2 ?Arg2 - Type3)
    (Feature_3_v0_s1 ?Arg0 - Type1 ?Arg1 - Type2 ?Arg2 - Type3)
    (Static_load ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type3)
    (Static_drive ?Arg0 - Type1 ?Arg1 - Type2 ?Arg2 - Type2 ?Arg3 - Type3)
    (Static_fly ?Arg0 - Type1 ?Arg1 - Type2 ?Arg2 - Type2 ?Arg3 - Type3 ?Arg4 - Type3)
    (Static_unload ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type3)
  )
  (:action load
    :parameters (?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type3)
    :precondition (and
      (Feature_1_v0_s0 ?Arg0 ?Arg2 ?Arg3) (Feature_3_v0_s0 ?Arg1 ?Arg2 ?Arg3) (Feature_0_v0_s1 ?Arg0 ?Arg1) (Feature_2_v0_s0 ?Arg1 ?Arg2 ?Arg3)
      (Static_load ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_1_v0_s1 ?Arg0 ?Arg2 ?Arg3) (Feature_0_v0_s0 ?Arg0 ?Arg1)
      (not (Feature_1_v0_s0 ?Arg0 ?Arg2 ?Arg3)) (not (Feature_0_v0_s1 ?Arg0 ?Arg1))
    )
  )
  (:action drive
    :parameters (?Arg0 - Type1 ?Arg1 - Type2 ?Arg2 - Type2 ?Arg3 - Type3)
    :precondition (and
      (Feature_3_v0_s0 ?Arg0 ?Arg2 ?Arg3) (Feature_3_v0_s1 ?Arg0 ?Arg1 ?Arg3) (Static_drive ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_3_v0_s1 ?Arg0 ?Arg2 ?Arg3) (Feature_3_v0_s0 ?Arg0 ?Arg1 ?Arg3)
      (not (Feature_3_v0_s0 ?Arg0 ?Arg2 ?Arg3)) (not (Feature_3_v0_s1 ?Arg0 ?Arg1 ?Arg3))
    )
  )
  (:action fly
    :parameters (?Arg0 - Type1 ?Arg1 - Type2 ?Arg2 - Type2 ?Arg3 - Type3 ?Arg4 - Type3)
    :precondition (and
      (Feature_2_v0_s1 ?Arg0 ?Arg1 ?Arg4) (Feature_2_v0_s0 ?Arg0 ?Arg2 ?Arg3) (Static_fly ?Arg0 ?Arg1 ?Arg2 ?Arg3 ?Arg4)
    )
    :effect (and
      (Feature_2_v0_s1 ?Arg0 ?Arg2 ?Arg3) (Feature_2_v0_s0 ?Arg0 ?Arg1 ?Arg4)
      (not (Feature_2_v0_s1 ?Arg0 ?Arg1 ?Arg4)) (not (Feature_2_v0_s0 ?Arg0 ?Arg2 ?Arg3))
    )
  )
  (:action unload
    :parameters (?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type2 ?Arg3 - Type3)
    :precondition (and
      (Feature_1_v0_s1 ?Arg0 ?Arg2 ?Arg3) (Feature_3_v0_s0 ?Arg1 ?Arg2 ?Arg3) (Feature_0_v0_s0 ?Arg0 ?Arg1) (Feature_2_v0_s0 ?Arg1 ?Arg2 ?Arg3)
      (Static_unload ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_1_v0_s0 ?Arg0 ?Arg2 ?Arg3) (Feature_0_v0_s1 ?Arg0 ?Arg1)
      (not (Feature_1_v0_s1 ?Arg0 ?Arg2 ?Arg3)) (not (Feature_0_v0_s0 ?Arg0 ?Arg1))
    )
  )
)

