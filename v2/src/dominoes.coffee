{ shuffle } = require 'helpers'

module.exports =

  start:
    given: available: shuffle
    dominoes: []

  serve:
    given: domino: first: available
    available: drop
    then: serve: { player, domino }

  play:
    domino: [[

    ]]

  head:
    head: domino: head
    dominoes: -> concat [domino], @

  tail:
    tail: domino: tail
    dominoes: concat: [domino]

#
#  {
#    when: 'play_head'
#    dominoes: -> concat [domino], @
#  }
#  {
#    when: 'play_tail'
#    dominoes: -> concat @, [domino]
#  }
#]
