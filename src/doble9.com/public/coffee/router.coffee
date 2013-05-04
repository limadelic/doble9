define ['underscore','backbone', 'cs!models/game', 'cs!views/game'],
(_, Backbone, Model, View) ->

  class Router extends Backbone.Router

    initialize: ->
      @game = new View
        model: new Model
      Backbone.history.start()
      @

    routes:
      '': 'index'
      'play/:domino': 'play'

    index: -> @game.render()
    play: (domino) -> @game.play domino



