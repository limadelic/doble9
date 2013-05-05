define ['backbone', 'underscore'],
(Backbone, _) ->

  class Player extends Backbone.Model

    initialize: (@name) ->

    play: (domino) ->
      reverse = domino.slice().reverse()

      @dominoes = _.filter @dominoes, (x) -> not (
        _.isEqual(x, domino) or
        _.isEqual(x, reverse)
      )
