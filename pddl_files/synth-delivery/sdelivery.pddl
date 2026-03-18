;; ============================================================
;;  DELIVERY DOMAIN
;;  A single agent navigates a grid (up/down/left/right),
;;  picks up one package at a time, and drops it at its
;;  goal cell.
;;
;;  Only two static adjacency predicates are needed:
;;    connected-up   ?from ?to  –  moving up   takes ?from → ?to
;;    connected-left ?from ?to  –  moving left takes ?from → ?to
;;  The inverse directions reuse these predicates in reverse.
;; ============================================================

(define (domain sdelivery)

  (:requirements :typing)

  (:types
    location   ;; a grid cell
    package    ;; a deliverable item
  )

  ;; ----------------------------------------------------------
  ;;  Predicates
  ;; ----------------------------------------------------------
  (:predicates
    (at-agent   ?l - location)              ;; agent is at cell l
    (at-package ?p - package ?l - location) ;; package p is at cell l
    (holding    ?p - package)               ;; agent is carrying package p
    (hand-empty)                            ;; agent is not carrying anything

    ;; Only two directional statics – down/right are their inverses
    (connected-up    ?from ?to - location)  ;; ?to is directly above ?from
    (connected-left  ?from ?to - location)  ;; ?to is directly left  of ?from
  )

  ;; ----------------------------------------------------------
  ;;  Movement actions
  ;; ----------------------------------------------------------

  (:action up
    :parameters  (?from ?to - location)
    :precondition (and (at-agent ?from)
                       (connected-up ?from ?to))
    :effect       (and (at-agent ?to)
                       (not (at-agent ?from)))
  )

  ;; Moving DOWN from ?from to ?to  ≡  connected-up ?to ?from
  (:action down
    :parameters  (?from ?to - location)
    :precondition (and (at-agent ?from)
                       (connected-up ?to ?from))
    :effect       (and (at-agent ?to)
                       (not (at-agent ?from)))
  )

  (:action left
    :parameters  (?from ?to - location)
    :precondition (and (at-agent ?from)
                       (connected-left ?from ?to))
    :effect       (and (at-agent ?to)
                       (not (at-agent ?from)))
  )

  ;; Moving RIGHT from ?from to ?to  ≡  connected-left ?to ?from
  (:action right
    :parameters  (?from ?to - location)
    :precondition (and (at-agent ?from)
                       (connected-left ?to ?from))
    :effect       (and (at-agent ?to)
                       (not (at-agent ?from)))
  )

  ;; ----------------------------------------------------------
  ;;  Pick-up  – agent and package must share the same cell;
  ;;             agent must have an empty hand.
  ;; ----------------------------------------------------------
  (:action pick
    :parameters  (?p - package ?l - location)
    :precondition (and (at-agent   ?l)
                       (at-package ?p ?l)
                       (hand-empty))
    :effect       (and (holding    ?p)
                       (not (at-package ?p ?l))
                       (not (hand-empty)))
  )

  ;; ----------------------------------------------------------
  ;;  Drop  – agent drops the carried package in its current cell.
  ;; ----------------------------------------------------------
  (:action drop
    :parameters  (?p - package ?l - location)
    :precondition (and (at-agent ?l)
                       (holding  ?p))
    :effect       (and (at-package ?p ?l)
                       (not (holding  ?p))
                       (hand-empty))
  )

)
