{ shuffle } = require 'helpers'

module.exports = [
  {
    when: 'start'
    given: all: -> shuffle
    dominoes: []
  }
  {
    when: 'pick'
    picked: player, domino: -> all.shift
  }
]
