{ shuffle } = require 'helpers'

module.exports = [
  {
    when: 'start'
    given: available: -> shuffle
    dominoes: []
  }
  {
    when: 'get_domino'
    then: add_domino: player, domino: -> available.shift()
  }
  {
    when: 'play_head'
    dominoes: -> concat [domino], @
  }
  {
    when: 'play_tail'
    dominoes: -> concat @, [domino]
  }
]
