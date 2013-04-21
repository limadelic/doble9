define ['backbone', 'cs!models/player'],
(Backbone, Player) ->

  class Game extends Backbone.Model

    constructor: ->
      @players = (new Player() for x in [1..4])
