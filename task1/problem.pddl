(define (problem deliver-packages)
  (:domain package-transport)

  (:objects
    city-a city-b port-x airport-y - location
    truck1 truck2 plane1 boat1     - vehicle
    pkg1 pkg2 pkg3                 - package
  )

  (:init
    ; vehicle capabilities
    (can-drive truck1)
    (can-drive truck2)
    (can-fly   plane1)
    (can-sail  boat1)

    ; road network
    (road-connected city-a city-b)
    (road-connected city-b city-a)
    (road-connected city-a port-x)
    (road-connected port-x city-a)
    (road-connected city-b airport-y)
    (road-connected airport-y city-b)

    ; air network
    (air-connected airport-y city-a)
    (air-connected city-a airport-y)
    (air-connected airport-y port-x)
    (air-connected port-x airport-y)

    ; water network
    (water-connected port-x city-b)
    (water-connected city-b port-x)

    ; vehicle positions
    (vehicle-at truck1  city-a)
    (vehicle-at truck2  city-b)
    (vehicle-at plane1  airport-y)
    (vehicle-at boat1   port-x)

    ; package starting positions
    (at pkg1 city-a)
    (at pkg2 city-a)
    (at pkg3 port-x)
  )

  (:goal
    (and
      (at pkg1 city-b)
      (at pkg2 port-x)
      (at pkg3 city-b)
    )
  )
)
