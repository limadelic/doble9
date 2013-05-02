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
      @table = []
      new Dealer().deal @

    dominoes: -> @players[0].dominoes

    play: (@domino) ->
      @dominoes().splice @find_domino(), 1

    find_domino: ->
      index = 0
      for current in @dominoes()
        return index if @is_match current
        index++

    is_match: (current) ->
      current.join('') is @domino or
      current.reverse().join('') is @domino
