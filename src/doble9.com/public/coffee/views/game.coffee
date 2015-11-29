define [
  'underscore'
  'cs!views/player'
  'cs!views/table'
  'cs!views/dash'
],

(_, Player, Table, Dash) ->

  class Game

    el: 'body'

    initialize: ->
      @players = _.map @model.players(), @new_player
      @table = new Table model: @model.table
      @dash = new Dash model: @model.dash

    new_player: (player) -> new Player
      model: player
      el: '#' + player.name
      game: @

    render: ->
      player.render() for player in @players
      @table.render()
      @dash.render()
      @disable_hover_on_ipad()
      @

    play: (domino) ->
      @render() if @model.player_plays @parse domino

    knock: (e) ->
      @model.knock()
      @render()

    parse: (domino) ->
      _.map domino.split(''), (x) -> Number x

    disable_hover_on_ipad: ->
      return unless navigator.platform is 'iPad'
      $('.number').css 'background-color', 'transparent'
