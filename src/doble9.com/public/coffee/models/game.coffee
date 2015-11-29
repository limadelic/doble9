define [
  'underscore'
  'cs!models/dash'
  'cs!models/player'
  'cs!models/table'
  'cs!staff/dealer'
  'cs!players/bob'
  'cs!staff/fx'
],

(_, Dash, Player, Table, Dealer, Bob, Fx) ->

  class Game

    constructor: ->
      @computer = new Bob
      @fx = new Fx @

      @dash = new Dash 'dash'
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
    loot: -> 99
    players: -> [@player].concat @oponents
    knock: -> @player_plays()

    player_plays: (domino) ->
      return if @table.is_forro domino

      @play @player, domino
      @computer_plays()
      @update_status()
      true

    play: (player, domino) ->
      return unless domino? and not @done()

      player.play domino
      @table.play domino
      @fx.show player, domino

      @winner = player if player.won

    computer_plays: -> for x in @oponents when @can_play x
      @play x, @computer.play @table, x.dominoes

    can_play: (player) -> player.can_play @table.heads()

    update_status: ->
      @pick_winner() if @is_stucked()
      @fx.enable '#knock' if @player.should_knock()

    is_stucked: -> @stucked =
      not _.find(@players(), (x) => @can_play x)?

    pick_winner: ->
      @winner = _.sortBy(@players(), (x) -> x.count())[0]
      @winner.won = true