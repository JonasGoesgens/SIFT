;; ============================================================
;;  DELIVERY – Problem instance  (5 × 5 grid)
;;
;;  Grid layout (row × col, 1-indexed from top-left):
;;
;;    (1,1) (1,2) (1,3) (1,4) (1,5)
;;    (2,1) (2,2) (2,3) (2,4) (2,5)
;;    (3,1) (3,2) (3,3) (3,4) (3,5)
;;    (4,1) (4,2) (4,3) (4,4) (4,5)
;;    (5,1) (5,2) (5,3) (5,4) (5,5)
;;
;;  Initial state:
;;    Agent  : loc-3x3  (centre)
;;    pkg1   : loc-1x1  → goal loc-5x5
;;    pkg2   : loc-1x5  → goal loc-5x1
;;    pkg3   : loc-5x1  → goal loc-1x5
;;    pkg4   : loc-3x5  → goal loc-3x1
;; ============================================================

(define (problem delivery-5x5)
  (:domain sdelivery)

  ;; ----------------------------------------------------------
  ;;  Objects
  ;; ----------------------------------------------------------
  (:objects
    loc-1x1 loc-1x2 loc-1x3 loc-1x4 loc-1x5
    loc-2x1 loc-2x2 loc-2x3 loc-2x4 loc-2x5
    loc-3x1 loc-3x2 loc-3x3 loc-3x4 loc-3x5
    loc-4x1 loc-4x2 loc-4x3 loc-4x4 loc-4x5
    loc-5x1 loc-5x2 loc-5x3 loc-5x4 loc-5x5  - location

    pkg1 pkg2 pkg3 pkg4 - package
  )

  ;; ----------------------------------------------------------
  ;;  Initial state
  ;; ----------------------------------------------------------
  (:init
    ;; ----- agent & hand -----
    (at-agent loc-3x3)
    (hand-empty)

    ;; ----- packages -----
    (at-package pkg1 loc-1x1)
    (at-package pkg2 loc-1x5)
    (at-package pkg3 loc-5x1)
    (at-package pkg4 loc-3x5)

    ;; ----- connected-up  (moving up: row decreases) -----
    ;; row 2 → row 1
    (connected-up loc-2x1 loc-1x1)
    (connected-up loc-2x2 loc-1x2)
    (connected-up loc-2x3 loc-1x3)
    (connected-up loc-2x4 loc-1x4)
    (connected-up loc-2x5 loc-1x5)
    ;; row 3 → row 2
    (connected-up loc-3x1 loc-2x1)
    (connected-up loc-3x2 loc-2x2)
    (connected-up loc-3x3 loc-2x3)
    (connected-up loc-3x4 loc-2x4)
    (connected-up loc-3x5 loc-2x5)
    ;; row 4 → row 3
    (connected-up loc-4x1 loc-3x1)
    (connected-up loc-4x2 loc-3x2)
    (connected-up loc-4x3 loc-3x3)
    (connected-up loc-4x4 loc-3x4)
    (connected-up loc-4x5 loc-3x5)
    ;; row 5 → row 4
    (connected-up loc-5x1 loc-4x1)
    (connected-up loc-5x2 loc-4x2)
    (connected-up loc-5x3 loc-4x3)
    (connected-up loc-5x4 loc-4x4)
    (connected-up loc-5x5 loc-4x5)

    ;; ----- connected-left  (moving left: column decreases) -----
    ;; row 1
    (connected-left loc-1x2 loc-1x1)
    (connected-left loc-1x3 loc-1x2)
    (connected-left loc-1x4 loc-1x3)
    (connected-left loc-1x5 loc-1x4)
    ;; row 2
    (connected-left loc-2x2 loc-2x1)
    (connected-left loc-2x3 loc-2x2)
    (connected-left loc-2x4 loc-2x3)
    (connected-left loc-2x5 loc-2x4)
    ;; row 3
    (connected-left loc-3x2 loc-3x1)
    (connected-left loc-3x3 loc-3x2)
    (connected-left loc-3x4 loc-3x3)
    (connected-left loc-3x5 loc-3x4)
    ;; row 4
    (connected-left loc-4x2 loc-4x1)
    (connected-left loc-4x3 loc-4x2)
    (connected-left loc-4x4 loc-4x3)
    (connected-left loc-4x5 loc-4x4)
    ;; row 5
    (connected-left loc-5x2 loc-5x1)
    (connected-left loc-5x3 loc-5x2)
    (connected-left loc-5x4 loc-5x3)
    (connected-left loc-5x5 loc-5x4)
  )

  ;; ----------------------------------------------------------
  ;;  Goal
  ;; ----------------------------------------------------------
  (:goal
    (and
      (at-package pkg1 loc-5x5)
      (at-package pkg2 loc-5x1)
      (at-package pkg3 loc-1x5)
      (at-package pkg4 loc-3x1)
    )
  )

)

