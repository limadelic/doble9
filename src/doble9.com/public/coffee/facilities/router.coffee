define [
  'underscore'
  'backbone'
  'cs!models/game'
  'cs!views/game'
],

(_, Backbone, Model, View) ->

  window.new_game = ->
    window.game = new View
      model: new Model

  class Router extends Backbone.Router

    initialize: ->
      new_game()
      Backbone.history.start()
      @

    routes:
      '': 'index'
      'play/:domino': 'play'

    index: -> game.render()
    play: (domino) -> game.play domino



