(define (problem gripper-3)
(:domain gripper-strips)
(:objects  left right ball1 ball2 ball3 ball4 ball5 ball6 ball7 ball8 rooma roomb)
(:init
(room rooma)
(room roomb)
(gripper left)
(gripper right)
(ball ball1)
(ball ball2)
(ball ball3)
(ball ball4)
(ball ball5)
(ball ball6)
(ball ball7)
(ball ball8)
(free left)
(free right)
(at ball1 rooma)
(at ball2 rooma)
(at ball3 rooma)
(at ball4 roomb)
(at ball5 roomb)
(at ball6 rooma)
(at ball7 roomb)
(at ball8 roomb)
(at-robby rooma)
(eq rooma rooma)
(eq roomb roomb)
)
(:goal
(and
(at ball1 roomb)
(at ball2 roomb)
(at ball3 roomb)
)
)
)
