define ['backbone', 'underscore', 'cs!views/player', 'cs!views/table', 'cs!views/dash'],
(Backbone, _, Player, Table, Dash) ->

  class Game extends Backbone.View

    el: 'body'

    events:
      'dblclick': 'knock'

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
      @

    play: (domino) ->
      @model.player_plays @parse domino
      @render()

    knock: (e) ->
      @model.knock()
      @render()

    parse: (domino) ->
      _.map domino.split(''), (x) -> Number x
