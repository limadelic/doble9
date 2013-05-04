define ['backbone', 'underscore'],
(Backbone, _) ->

  class Player extends Backbone.Model

    constructor: (@name) ->

    play: (domino) ->
      reverse = domino.reverse()

      @dominoes = _.filter @dominoes, (x) -> not (
        _.isEqual(x, domino) or
        _.isEqual(x, reverse)
      )
