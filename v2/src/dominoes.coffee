{ shuffle } = require 'helpers'

module.exports = [
  {
    when: 'start'
    given: all: -> shuffle
    dominoes: []
  }
  {
    when: get_domino: player
    then: add_domino: player, domino: -> all.shift()
  }
]
