define [
  'backbone'
  'underscore'
  'cs!models/player'
  'cs!models/table'
  'cs!dealer'
  'cs!players/bob'
], (Backbone, _, Player, Table, Dealer, Bob) ->
  class Game extends Backbone.Model

    initialize: ->
      @computer = new Bob

      @table = new Table 'table'
      @player = new Player 'player'

      @oponents = [
        new Player 'left'
        new Player 'front'
        new Player 'right'
      ]

      new Dealer().deal @

    players: -> @oponents.concat @player

    player_plays: (domino) ->
      return if @is_forro domino

      @play @player, domino
#      @computer_plays()

    play: (player, domino) ->
      return unless domino?

      player.play domino
      @table.play domino

    computer_plays: ->
      _.each @oponents, (oponent) ->
        @play oponent, @computer.play @table, oponent.dominoes

    is_forro: (domino) -> not @is_salida() and
      _.isEmpty _.intersection @table.heads(), domino

    is_salida: -> _.isEmpty @table.dominoes

