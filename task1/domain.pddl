(define (domain package-transport)
  (:requirements :strips :typing)

  (:types package vehicle location)

  (:predicates
    ; package / vehicle positions
    (at              ?p - package  ?l - location)
    (vehicle-at      ?v - vehicle  ?l - location)
    (in              ?p - package  ?v - vehicle)

    ; transport topology
    (road-connected  ?from - location ?to - location)
    (air-connected   ?from - location ?to - location)
    (water-connected ?from - location ?to - location)

    ; vehicle capabilities (replaces type hierarchy)
    (can-drive ?v - vehicle)
    (can-fly   ?v - vehicle)
    (can-sail  ?v - vehicle)
  )

  (:action load
    :parameters (?p - package ?v - vehicle ?l - location)
    :precondition (and (at ?p ?l) (vehicle-at ?v ?l))
    :effect (and (in ?p ?v) (not (at ?p ?l)))
  )

  (:action unload
    :parameters (?p - package ?v - vehicle ?l - location)
    :precondition (and (in ?p ?v) (vehicle-at ?v ?l))
    :effect (and (at ?p ?l) (not (in ?p ?v)))
  )

  ; truck moves on roads
  (:action drive
    :parameters (?v - vehicle ?from - location ?to - location)
    :precondition (and (can-drive ?v) (vehicle-at ?v ?from) (road-connected ?from ?to))
    :effect (and (vehicle-at ?v ?to) (not (vehicle-at ?v ?from)))
  )

  ; plane moves on air routes
  (:action fly
    :parameters (?v - vehicle ?from - location ?to - location)
    :precondition (and (can-fly ?v) (vehicle-at ?v ?from) (air-connected ?from ?to))
    :effect (and (vehicle-at ?v ?to) (not (vehicle-at ?v ?from)))
  )

  ; boat moves on water routes
  (:action sail
    :parameters (?v - vehicle ?from - location ?to - location)
    :precondition (and (can-sail ?v) (vehicle-at ?v ?from) (water-connected ?from ?to))
    :effect (and (vehicle-at ?v ?to) (not (vehicle-at ?v ?from)))
  )
)
