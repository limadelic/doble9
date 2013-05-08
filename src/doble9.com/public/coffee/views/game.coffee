define ['backbone', 'underscore', 'cs!views/player', 'cs!views/table'],
(Backbone, _, Player, Table) ->

  class Game extends Backbone.View

    el: 'body'

    events:
      'dblclick': 'knock'

    initialize: ->
      @players = _.map @model.players(), @new_player
      @table = new Table model: @model.table
      window.game = @

    new_player: (player) -> new Player
      model: player
      el: '#' + player.name
      game: @

    render: ->
      player.render() for player in @players
      @table.render()
      @

    play: (domino) ->
      @model.player_plays @parse domino
      @render()

    knock: (e) ->
      @model.knock()
      @render()

    parse: (domino) ->
      _.map domino.split(''), (x) -> Number x
