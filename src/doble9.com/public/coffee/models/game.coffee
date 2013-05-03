define [
  'backbone'
  'underscore'
  'cs!models/player'
  'cs!models/table'
  'cs!dealer'
  'cs!players/bob'
], (Backbone, _, Player, Table, Dealer, Bob) ->

  class Game extends Backbone.Model

    constructor: ->
      @table = new Table 'table'

      @players = [
        new Player 'player'
        new Player 'front'
        new Player 'left'
        new Player 'right'
      ]

      new Dealer().deal @

    play: (domino, player = 0) ->
      @players[player].play domino
      @table.play domino
#      bob.play @table, player.dominoes for player in @players[1...]


