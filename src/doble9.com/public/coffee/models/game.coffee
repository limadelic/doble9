define ['backbone', 'cs!models/player'],
(Backbone, Player) ->

  class Game extends Backbone.Model

    constructor: ->
      @players = [
        new Player 'player'
        new Player 'front'
        new Player 'left'
        new Player 'right'
      ]


