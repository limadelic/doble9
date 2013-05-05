define ['backbone', 'underscore', 'cs!views/player'],
(Backbone, _, Player) ->

  class Game extends Backbone.View

    el: 'body'

    events:
      'dblclick': 'knock'

    initialize: ->
      @players = _.map @model.players(), @new_player
      @table = @new_player @model.table

    new_player: (player) -> new Player
      model: player
      el: '#' + player.name

    render: ->
      player.render() for player in @players
      @table.render()
      @

    play: (domino) ->
      @model.player_plays @parse domino
      @render()

    knock: ->
      @model.knock()
      @render()

    parse: (domino) ->
      _.map domino.split(''), (x) -> Number x
