{ shuffle } = require 'helpers'

module.exports =

  start:
    available: shuffle
    dominoes: []

  serve:
    domino: first: available
    available: drop
    then: serve: { player, domino }

  play: domino: [[
    when: dominoes: empty, head, tail, dominoes: [domino]
    when: head,       then: head: domino: reverse
    when: head: tail, then: tail: domino
    when: tail: head, then: head: domino
    when: tail      , then: tail: domino: reverse
  ]]

  head:
    head: domino: head
    dominoes: -> concat [domino], @

  tail:
    tail: domino: tail
    dominoes: concat: [domino]
