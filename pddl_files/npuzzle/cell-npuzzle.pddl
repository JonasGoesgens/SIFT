
;; The npuzzle puzzle (i.e. the eight/fifteen/twentyfour puzzle).
;; Tile positions are encoded by the predicate (at <tile> <x> <y>), i.e.
;; using one object for horizontal position and one for vertical (there's
;; a separate predicate for the position of the blank). The predicate
;; "inc" encode addition of positions.

;; The instance files come in two flavors: The vanilla one uses the same
;; objects for both x and y coordinates, while the other (files that have
;; an "x" at the end of their name) uses different objects for x and y
;; coordinates; this is because some planners seem to require different
;; objects for each parameter of an operator.

(define (domain cell-npuzzle)
  (:requirements :strips)
  (:predicates
   (tile ?t) (cell ?c)
   (at ?t ?c) (blank ?c)
   (above ?c ?cc) (right ?c ?pccp))

  (:action move-up
    :parameters (?omf ?c ?cc)
    :precondition (and
		   (tile ?omf) (cell ?c) (cell ?c)
		   (above ?cc ?c) (blank ?cc) (at ?omf ?c))
    :effect (and (not (blank ?cc)) (not (at ?omf ?c))
		 (blank ?c) (at ?omf ?cc)))

  (:action move-down
    :parameters (?omf ?c ?cc)
    :precondition (and
		   (tile ?omf) (cell ?c) (cell ?c)
		   (above ?c ?cc) (blank ?cc) (at ?omf ?c))
    :effect (and (not (blank ?cc)) (not (at ?omf ?c))
		 (blank ?c) (at ?omf ?cc)))

  (:action move-left
    :parameters (?omf ?c ?cc)
    :precondition (and
		   (tile ?omf) (cell ?c) (cell ?c)
		   (right ?c ?cc) (blank ?cc) (at ?omf ?c))
    :effect (and (not (blank ?cc)) (not (at ?omf ?c))
		 (blank ?c) (at ?omf ?cc)))

  (:action move-right
    :parameters (?omf ?c ?cc)
    :precondition (and
		   (tile ?omf) (cell ?c) (cell ?c)
		   (right ?cc ?c) (blank ?cc) (at ?omf ?c))
    :effect (and (not (blank ?cc)) (not (at ?omf ?c))
		 (blank ?c) (at ?omf ?cc)))
  )