(define (problem miconic3x2)
	(:domain miconic)
	(:objects floor1 floor2 floor3 floor4 floor5 person1 person2 person3 person4)
	(:init (above floor1 floor2)
		(above floor2 floor3)
		(above floor3 floor4)
		(above floor4 floor5)
		(lift_pos floor1)
		(floor floor1)
		(floor floor2)
		(floor floor3)
		(floor floor4)
		(floor floor5)
		(person person1)
		(person person2)
		(person person3)
		(person person4)
		(in_lift person1)
		(in_lift person2)
		(in_floor person3 floor2)
		(in_floor person4 floor3))
	(:goal (and (in_floor person1 floor2)
		(in_floor person2 floor3))))
