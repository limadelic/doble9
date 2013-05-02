define ['backbone', 'underscore'],
(Backbone, _) ->

  class Player extends Backbone.Model

    constructor: (@name) ->

    play: (domino) -> @dominoes =
      _.filter @dominoes, (x) ->
        _.difference(x, domino).length > 0
