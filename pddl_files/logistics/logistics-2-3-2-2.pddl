(define (problem logistics-c2-s3-p2-a2)
(:domain logistics)
(:objects a0 a1 
          c0 c1 
          t0 t1 
          l0-0 l0-1 l0-2 l1-0 l1-1 l1-2 
          p0 p1 
)
(:init
    (vehicle a0)
    (vehicle a1)
    (vehicle t0)
    (vehicle t1)
    (AIRPLANE a0)
    (AIRPLANE a1)
    (CITY c0)
    (CITY c1)
    (TRUCK t0)
    (TRUCK t1)
    (LOCATION l0-0)
    (loc l0-0 c0)
    (LOCATION l0-1)
    (loc l0-1 c0)
    (LOCATION l0-2)
    (loc l0-2 c0)
    (LOCATION l1-0)
    (loc l1-0 c1)
    (LOCATION l1-1)
    (loc l1-1 c1)
    (LOCATION l1-2)
    (loc l1-2 c1)
    (AIRPORT l0-0)
    (AIRPORT l1-0)
    (object p0)
    (object p1)
    (at t0 l0-1)
    (at t1 l1-0)
    (at p0 l1-0)
    (at p1 l0-0)
    (at a0 l0-0)
    (at a1 l0-0)
)
(:goal
    (and
        (at p0 l1-2)
        (at p1 l0-2)
    )
)
)
