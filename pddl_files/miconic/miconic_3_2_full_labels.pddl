(define (problem miconic3x2)
	(:domain miconic)
	(:objects floor1 floor2 floor3 person1 person2)
	(:init (above floor1 floor2)
		(above floor2 floor3)
		(lift_pos floor1)
		(floor floor1)
		(floor floor2)
		(floor floor3)
		(person person1)
		(person person2)
		(in_lift person1)
		(in_lift person2))
	(:goal (and (in_floor person1 floor2)
		(in_floor person2 floor3))))
