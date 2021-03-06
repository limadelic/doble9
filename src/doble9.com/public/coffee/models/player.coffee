define [ 'underscore'],
(_) ->

  class Player

    constructor: (@name) ->
      @won = @pass = false
      @play_id = "play#{@name}"
      @played = false

    count: -> _.reduce(
      _.flatten @dominoes
      (x, sum) -> x + sum
      0
    )

    play: (domino) ->
      reverse = domino.slice().reverse()

      @dominoes = _.reject @dominoes, (x) ->
        _.isEqual(x, domino) or
        _.isEqual(x, reverse)

      @won = _.isEmpty @dominoes
      @played = @name isnt 'player'

    can_play: (heads) ->
      @played = false
      return if @won

      @pass = not _.find(@dominoes, (x) ->
        _.intersection(x, heads).length > 0
      )?

      not @pass

    should_knock: -> @pass and !game.model.done()