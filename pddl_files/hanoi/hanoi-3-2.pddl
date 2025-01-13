


(define (problem hanoi-3-2)
(:domain hanoi)
(:objects peg1 peg2 peg3 d1 d2)
(:init
(smaller d1 peg1)
(smaller d2 peg1)
(smaller d1 peg2)
(smaller d2 peg2)
(smaller d1 peg3)
(smaller d2 peg3)
(smaller d1 d2)
(clear peg3)
(clear peg1)
(clear d1)
(on d2 peg2)
(on d1 d2)
)
(:goal
(and
(on d2 peg3)
(on d1 d2)
)
)
)


