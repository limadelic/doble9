define ['backbone', 'underscore', 'cs!views/player'],
(Backbone, _, Player) ->

  class Game extends Backbone.View

    initialize: ->
      @player1 = new Player
        model: @model.players[0]
        el: '#player1'

    render: ->
      @player1.render()
      @

