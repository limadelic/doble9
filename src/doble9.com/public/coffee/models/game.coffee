define ['backbone', 'cs!models/player', 'cs!dealer'],
(Backbone, Player, Dealer) ->

  class Game extends Backbone.Model

    constructor: ->
      @players = [
        new Player 'player'
        new Player 'front'
        new Player 'left'
        new Player 'right'
      ]
      new Dealer().deal @


