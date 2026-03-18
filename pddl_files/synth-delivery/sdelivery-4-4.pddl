;; ============================================================
;;  DELIVERY – Problem instance  (4 × 4 grid)
;;
;;  Grid layout (row × col, 1-indexed from top-left):
;;
;;    (1,1) (1,2) (1,3) (1,4)
;;    (2,1) (2,2) (2,3) (2,4)
;;    (3,1) (3,2) (3,3) (3,4)
;;    (4,1) (4,2) (4,3) (4,4)
;;
;;  Initial state:
;;    Agent  : loc-1x1  (top-left)
;;    pkg1   : loc-1x4  (top-right)   → goal loc-4x1  (bottom-left)
;;    pkg2   : loc-4x4  (bottom-right) → goal loc-1x1  (top-left)
;;    pkg3   : loc-2x3               → goal loc-3x2
;; ============================================================

(define (problem delivery-4x4)
  (:domain sdelivery)

  ;; ----------------------------------------------------------
  ;;  Objects
  ;; ----------------------------------------------------------
  (:objects
    loc-1x1 loc-1x2 loc-1x3 loc-1x4
    loc-2x1 loc-2x2 loc-2x3 loc-2x4
    loc-3x1 loc-3x2 loc-3x3 loc-3x4
    loc-4x1 loc-4x2 loc-4x3 loc-4x4  - location

    pkg1 pkg2 pkg3 - package
  )

  ;; ----------------------------------------------------------
  ;;  Initial state
  ;; ----------------------------------------------------------
  (:init
    ;; ----- agent & hand -----
    (at-agent loc-1x1)
    (hand-empty)

    ;; ----- packages -----
    (at-package pkg1 loc-1x4)
    (at-package pkg2 loc-4x4)
    (at-package pkg3 loc-2x3)

    ;; ----- connected-up  (moving up: row decreases) -----
    (connected-up loc-2x1 loc-1x1)
    (connected-up loc-2x2 loc-1x2)
    (connected-up loc-2x3 loc-1x3)
    (connected-up loc-2x4 loc-1x4)

    (connected-up loc-3x1 loc-2x1)
    (connected-up loc-3x2 loc-2x2)
    (connected-up loc-3x3 loc-2x3)
    (connected-up loc-3x4 loc-2x4)

    (connected-up loc-4x1 loc-3x1)
    (connected-up loc-4x2 loc-3x2)
    (connected-up loc-4x3 loc-3x3)
    (connected-up loc-4x4 loc-3x4)

    ;; ----- connected-left  (moving left: column decreases) -----
    (connected-left loc-1x2 loc-1x1)
    (connected-left loc-1x3 loc-1x2)
    (connected-left loc-1x4 loc-1x3)

    (connected-left loc-2x2 loc-2x1)
    (connected-left loc-2x3 loc-2x2)
    (connected-left loc-2x4 loc-2x3)

    (connected-left loc-3x2 loc-3x1)
    (connected-left loc-3x3 loc-3x2)
    (connected-left loc-3x4 loc-3x3)

    (connected-left loc-4x2 loc-4x1)
    (connected-left loc-4x3 loc-4x2)
    (connected-left loc-4x4 loc-4x3)
  )

  ;; ----------------------------------------------------------
  ;;  Goal
  ;; ----------------------------------------------------------
  (:goal
    (and
      (at-package pkg1 loc-4x1)
      (at-package pkg2 loc-1x1)
      (at-package pkg3 loc-3x2)
    )
  )

)
