dominoes = require './actions/dominoes'
players = require './players'

class Game

  start: ->
    dominoes.flush()
    for player of players
      dominoes.pick player, 10

module.exports = new Game