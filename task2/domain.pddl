(define (domain vacuum-robot)
  (:requirements :strips :typing)
  (:types robot room)

  (:predicates
    (at ?r - robot ?p - room)
    (dirty ?p - room)
    (clean ?p - room)
    (connected ?from - room ?to - room)
  )

  (:action move
    :parameters (?r - robot ?from - room ?to - room)
    :precondition (and (at ?r ?from) (connected ?from ?to))
    :effect (and (at ?r ?to) (not (at ?r ?from)))
  )

  (:action clean
    :parameters (?r - robot ?p - room)
    :precondition (and (at ?r ?p) (dirty ?p))
    :effect (and (clean ?p) (not (dirty ?p)))
  )
)
