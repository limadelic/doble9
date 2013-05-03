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
      @bob = new Bob
      @table = new Table 'table'

      @players = [
        new Player 'player'
        new Player 'front'
        new Player 'left'
        new Player 'right'
      ]

      new Dealer().deal @

    play: (domino) ->

      @make_play domino, 0

      for i in [1..3]
        domino = @bob.play @table, @players[i].dominoes
        @make_play domino, i

    make_play: (domino, player) ->
      return unless domino?

      @players[player].play domino
      @table.play domino


