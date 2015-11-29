define [
  'underscore'
  'cs!models/game'
  'cs!views/game'
],

(_, Model, View) ->

  window.new_game = ->
    window.game = new View
      model: new Model

  class Router

    initialize: ->
      new_game()
      window.router = @

    routes:
      '': 'index'
      'play/:domino': 'play'

    index: -> game.render()
    play: (domino) -> game.play domino



