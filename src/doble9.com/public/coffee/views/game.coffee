define ['backbone', 'underscore', 'cs!views/player'],
(Backbone, _, Player) ->

  class Game extends Backbone.View

    initialize: ->
      @players = _.map @model.players, @new_player
      @table = @new_player @model.table

    new_player: (player) -> new Player
      model: player
      el: '#' + player.name

    render: ->
      player.render() for player in @players
      @table.render()
      @

