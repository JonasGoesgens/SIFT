(define (domain driverlog)
  (:requirements :typing :strips)
  (:types
    Type0 - object
    Type1 - object
    Type2 - object
  )
  (:predicates
    (Feature_0_v0_s0 ?Arg0 - Type0 ?Arg1 - Type0)
    (Feature_0_v0_s1 ?Arg0 - Type0 ?Arg1 - Type0)
    (Feature_1_v0_s0 ?Arg0 - Type0 ?Arg1 - Type1)
    (Feature_1_v0_s1 ?Arg0 - Type0 ?Arg1 - Type1)
    (Feature_2_v0_s0 ?Arg0 - Type0 ?Arg1 - Type2)
    (Feature_2_v0_s1 ?Arg0 - Type0 ?Arg1 - Type2)
    (Feature_3_v0_s0 ?Arg0 - Type1 ?Arg1 - Type2)
    (Feature_3_v0_s1 ?Arg0 - Type1 ?Arg1 - Type2)
    (Feature_4_v0_s0 ?Arg0 - Type0 ?Arg1 - Type0 ?Arg2 - Type1)
    (Feature_4_v0_s1 ?Arg0 - Type0 ?Arg1 - Type0 ?Arg2 - Type1)
    (Static_board-truck ?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type0)
    (Static_walk ?Arg0 - Type0 ?Arg1 - Type0 ?Arg2 - Type0)
    (Static_load-truck ?Arg0 - Type2 ?Arg1 - Type1 ?Arg2 - Type0 ?Arg3 - Type0)
    (Static_drive-truck ?Arg0 - Type0 ?Arg1 - Type0 ?Arg2 - Type0 ?Arg3 - Type1)
    (Static_unload-truck ?Arg0 - Type2 ?Arg1 - Type1 ?Arg2 - Type0 ?Arg3 - Type0)
    (Static_disembark-truck ?Arg0 - Type0 ?Arg1 - Type0 ?Arg2 - Type1)
  )
  (:action board-truck
    :parameters (?Arg0 - Type0 ?Arg1 - Type1 ?Arg2 - Type0)
    :precondition (and
      (Feature_0_v0_s0 ?Arg0 ?Arg2) (Feature_4_v0_s1 ?Arg0 ?Arg2 ?Arg1) (Feature_1_v0_s0 ?Arg2 ?Arg1) (Static_board-truck ?Arg0 ?Arg1 ?Arg2)
    )
    :effect (and
      (Feature_4_v0_s0 ?Arg0 ?Arg2 ?Arg1) (Feature_0_v0_s1 ?Arg0 ?Arg2) (Feature_1_v0_s1 ?Arg2 ?Arg1)
      (not (Feature_0_v0_s0 ?Arg0 ?Arg2)) (not (Feature_4_v0_s1 ?Arg0 ?Arg2 ?Arg1)) (not (Feature_1_v0_s0 ?Arg2 ?Arg1))
    )
  )
  (:action walk
    :parameters (?Arg0 - Type0 ?Arg1 - Type0 ?Arg2 - Type0)
    :precondition (and
      (Feature_0_v0_s1 ?Arg0 ?Arg1) (Feature_0_v0_s0 ?Arg0 ?Arg2) (Static_walk ?Arg0 ?Arg1 ?Arg2)
    )
    :effect (and
      (Feature_0_v0_s0 ?Arg0 ?Arg1) (Feature_0_v0_s1 ?Arg0 ?Arg2)
      (not (Feature_0_v0_s1 ?Arg0 ?Arg1)) (not (Feature_0_v0_s0 ?Arg0 ?Arg2))
    )
  )
  (:action load-truck
    :parameters (?Arg0 - Type2 ?Arg1 - Type1 ?Arg2 - Type0 ?Arg3 - Type0)
    :precondition (and
      (Feature_3_v0_s1 ?Arg1 ?Arg0) (Feature_4_v0_s0 ?Arg2 ?Arg3 ?Arg1) (Feature_2_v0_s0 ?Arg3 ?Arg0) (Feature_1_v0_s0 ?Arg2 ?Arg1)
      (Static_load-truck ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_3_v0_s0 ?Arg1 ?Arg0) (Feature_2_v0_s1 ?Arg3 ?Arg0)
      (not (Feature_2_v0_s0 ?Arg3 ?Arg0)) (not (Feature_3_v0_s1 ?Arg1 ?Arg0))
    )
  )
  (:action drive-truck
    :parameters (?Arg0 - Type0 ?Arg1 - Type0 ?Arg2 - Type0 ?Arg3 - Type1)
    :precondition (and
      (Feature_4_v0_s0 ?Arg1 ?Arg2 ?Arg3) (Feature_4_v0_s1 ?Arg1 ?Arg0 ?Arg3) (Static_drive-truck ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_4_v0_s0 ?Arg1 ?Arg0 ?Arg3) (Feature_4_v0_s1 ?Arg1 ?Arg2 ?Arg3)
      (not (Feature_4_v0_s0 ?Arg1 ?Arg2 ?Arg3)) (not (Feature_4_v0_s1 ?Arg1 ?Arg0 ?Arg3))
    )
  )
  (:action unload-truck
    :parameters (?Arg0 - Type2 ?Arg1 - Type1 ?Arg2 - Type0 ?Arg3 - Type0)
    :precondition (and
      (Feature_3_v0_s0 ?Arg1 ?Arg0) (Feature_4_v0_s0 ?Arg2 ?Arg3 ?Arg1) (Feature_2_v0_s1 ?Arg3 ?Arg0) (Feature_1_v0_s0 ?Arg2 ?Arg1)
      (Static_unload-truck ?Arg0 ?Arg1 ?Arg2 ?Arg3)
    )
    :effect (and
      (Feature_2_v0_s0 ?Arg3 ?Arg0) (Feature_3_v0_s1 ?Arg1 ?Arg0)
      (not (Feature_3_v0_s0 ?Arg1 ?Arg0)) (not (Feature_2_v0_s1 ?Arg3 ?Arg0))
    )
  )
  (:action disembark-truck
    :parameters (?Arg0 - Type0 ?Arg1 - Type0 ?Arg2 - Type1)
    :precondition (and
      (Feature_1_v0_s1 ?Arg1 ?Arg2) (Feature_0_v0_s1 ?Arg0 ?Arg1) (Feature_4_v0_s0 ?Arg0 ?Arg1 ?Arg2) (Static_disembark-truck ?Arg0 ?Arg1 ?Arg2)
    )
    :effect (and
      (Feature_4_v0_s1 ?Arg0 ?Arg1 ?Arg2) (Feature_0_v0_s0 ?Arg0 ?Arg1) (Feature_1_v0_s0 ?Arg1 ?Arg2)
      (not (Feature_1_v0_s1 ?Arg1 ?Arg2)) (not (Feature_0_v0_s1 ?Arg0 ?Arg1)) (not (Feature_4_v0_s0 ?Arg0 ?Arg1 ?Arg2))
    )
  )
)

