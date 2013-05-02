define ['backbone', 'underscore', 'cs!models/player', 'cs!dealer'],
(Backbone, _, Player, Dealer) ->

  class Game extends Backbone.Model

    constructor: ->
      @players = [
        new Player 'player'
        new Player 'front'
        new Player 'left'
        new Player 'right'
      ]

      new Dealer().deal @

    play: (domino) ->
      @players[0].play domino

