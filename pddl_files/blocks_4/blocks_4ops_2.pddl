(define (problem BLOCKS-2-0)
(:domain BLOCKS)
(:objects B A - block)
(:init (clear A) (clear B) (ontable A)
 (ontable B) (HANDEMPTY))
(:goal (and (on B A)))
)
