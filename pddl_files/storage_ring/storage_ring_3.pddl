(define (problem storage-ring3)
	(:domain storage-ring)
	(:objects cell1 cell2 cell3)
	(:init (next cell1 cell2)
		(next cell2 cell3)
		(next cell3 cell1)
		(at cell1))
	(:goal (and (data cell3)
		(at cell2))))
