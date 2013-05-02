define ['backbone', 'underscore', 'cs!views/player'],
(Backbone, _, Player) ->

  class Game extends Backbone.View

    new_players: ->
      for player in @model.players
        new Player
          model: player
          el: '#' + player.name

    initialize: ->
      @players = @new_players()

    render: ->
      player.render() for player in @players
#      @table.render()
      @

