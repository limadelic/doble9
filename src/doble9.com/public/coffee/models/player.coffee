define ['backbone', 'underscore'],
(Backbone, _) ->

  class Player extends Backbone.Model

    initialize: (@name) ->
      @pass = false

    play: (domino) ->
      reverse = domino.slice().reverse()

      @dominoes = _.filter @dominoes, (x) -> not (
        _.isEqual(x, domino) or
        _.isEqual(x, reverse)
      )

    check_if_can_play: (heads) ->
      return if _.isEmpty @dominoes

      @pass = not _.find(@dominoes, (x) ->
        _.intersection(x, heads).length > 0
      )?

      not @pass
