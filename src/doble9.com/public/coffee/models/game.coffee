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

      @stucked = false
      new Dealer().deal @

    players: -> @oponents.concat @player

    knock: -> @player_plays()

    player_plays: (domino) ->
      return if @table.is_forro domino

      @play @player, domino
      @computer_plays()
      @player.check_if_can_play @table.heads()

    play: (player, domino) ->
      return unless domino?

      player.play domino
      @table.play domino

    computer_plays: ->
      _.each @oponents, (x) => @play x,
        @computer.play @table, x.dominoes

    check_if_can_play: -> @pass =
      not @computer.play(@table, @player.dominoes)?
