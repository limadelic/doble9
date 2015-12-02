{ EventEmitter } = require 'events'
players = require '../players'

class Dominoes extends EventEmitter

  for: (location) -> @dominoes[location]

  empty: ->
    @dominoes =
      all: []
      table: []
    @dominoes[player] = [] for player of players

  fill: ->
    for x in [0..9]
      for y in [x..9]
        @dominoes.all.push [x, y]

  flush: ->
    @empty()
    @fill()

  pick: ({player, count}) ->
    @dominoes[player].push @dominoes.all.splice(@random_index(), 1)[0] for [1..count]
    @emit 'change'

  random_index: -> Math.random() * @dominoes.all.length

dominoes = new Dominoes
dispatcher = require '../helpers/dispatcher'

dispatcher.register (e) -> dominoes[e.action]? e

module.exports = dominoes