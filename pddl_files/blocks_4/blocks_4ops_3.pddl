(define (problem BLOCKS-3-0)
(:domain BLOCKS)
(:objects B A C - block)
(:init (clear C) (clear A) (clear B) (ontable C) (ontable A)
 (ontable B) (HANDEMPTY))
(:goal (and (on C B) (on B A)))
)
