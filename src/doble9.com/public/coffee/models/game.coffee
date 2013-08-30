define [
  'underscore'
  'backbone'
  'cs!models/player'
  'cs!models/table'
  'cs!staff/dealer'
  'cs!players/bob'
],

(_, Backbone, Player, Table, Dealer, Bob) ->

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

    done: -> @stucked or @winner?

    players: -> @oponents.concat @player

    knock: -> @player_plays()

    player_plays: (domino) ->
      return if @table.is_forro domino
      @plays = 0
      @play @player, domino
      @computer_plays()
      @check_status()

    check_status: ->
      @player.check_if_can_play @table.heads()

      @stucked = @player.pass and not
        _.find(@oponents, (x) =>
          x.check_if_can_play @table.heads()
        )?

    play: (player, domino) ->
      player.played = false
      return unless domino? and not @done()

      player.play domino
      @table.play domino
      @show @plays++, player, domino

      @winner = player if player.won

    show: (play, player, domino) ->
      delay = 500 * play

      setTimeout(
        -> $("##{player.play_id}").fadeOut()
        delay
      )

      domino.display = 'none'
      setTimeout(
        ->
          $(domino.selector).fadeIn()
          domino.display = 'block'
        delay + 200
      )

    computer_plays: ->
      _.each @oponents, (x) => @play x,
        @computer.play @table, x.dominoes
