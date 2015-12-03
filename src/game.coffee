players = require './players'
{ dispatch } = require './helpers/actions'

class Game

  start: ->
    dispatch 'flush'
    dispatch 'pick', { player, count: 10 } for player of players

module.exports = new Game