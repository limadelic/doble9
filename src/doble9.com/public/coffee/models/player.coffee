define ['backbone', 'underscore'],
(Backbone, _) ->

  class Player extends Backbone.Model

    initialize: (@name) ->
      @won = @pass = false
      @play_id = "play#{@name}"
      @played = false

    play: (domino) ->
      reverse = domino.slice().reverse()

      @dominoes = _.reject @dominoes, (x) ->
        _.isEqual(x, domino) or
        _.isEqual(x, reverse)

      @won = _.isEmpty @dominoes
      @played = @name isnt 'player'

    check_if_can_play: (heads) ->
      return if @won
      @played = false

      @pass = not _.find(@dominoes, (x) ->
        _.intersection(x, heads).length > 0
      )?

      not @pass