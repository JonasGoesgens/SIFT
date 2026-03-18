;; ============================================================
;;  DELIVERY – Problem instance  (3 × 3 grid)
;;
;;  Grid layout (row × col, 1-indexed from top-left):
;;
;;    (1,1) (1,2) (1,3)
;;    (2,1) (2,2) (2,3)
;;    (3,1) (3,2) (3,3)
;;
;;  Initial state:
;;    Agent  : loc-1x1  (top-left)
;;    pkg1   : loc-2x2  (centre)   → goal loc-3x3  (bottom-right)
;;    pkg2   : loc-1x3  (top-right) → goal loc-3x1  (bottom-left)
;;
;;  Because the agent can carry only one package at a time it
;;  must make two separate trips.
;; ============================================================

(define (problem delivery-3x3)
  (:domain sdelivery)

  ;; ----------------------------------------------------------
  ;;  Objects
  ;; ----------------------------------------------------------
  (:objects
    ;; 9 grid cells
    loc-1x1 loc-1x2 loc-1x3
    loc-2x1 loc-2x2 loc-2x3
    loc-3x1 loc-3x2 loc-3x3  - location

    pkg1 pkg2 - package
  )

  ;; ----------------------------------------------------------
  ;;  Initial state
  ;; ----------------------------------------------------------
  (:init
    ;; ----- agent & hand -----
    (at-agent loc-1x1)
    (hand-empty)

    ;; ----- packages -----
    (at-package pkg1 loc-2x2)
    (at-package pkg2 loc-1x3)

    ;; ----- connected-up  (moving up: row decreases) -----
    (connected-up loc-2x1 loc-1x1)
    (connected-up loc-2x2 loc-1x2)
    (connected-up loc-2x3 loc-1x3)
    (connected-up loc-3x1 loc-2x1)
    (connected-up loc-3x2 loc-2x2)
    (connected-up loc-3x3 loc-2x3)

    ;; ----- connected-left  (moving left: column decreases) -----
    (connected-left loc-1x2 loc-1x1)
    (connected-left loc-1x3 loc-1x2)
    (connected-left loc-2x2 loc-2x1)
    (connected-left loc-2x3 loc-2x2)
    (connected-left loc-3x2 loc-3x1)
    (connected-left loc-3x3 loc-3x2)
  )

  ;; ----------------------------------------------------------
  ;;  Goal
  ;; ----------------------------------------------------------
  (:goal
    (and
      (at-package pkg1 loc-3x3)
      (at-package pkg2 loc-3x1)
    )
  )

)
