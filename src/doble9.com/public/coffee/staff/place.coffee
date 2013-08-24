define [
  'underscore'
  'cs!staff/arranger'
], (_, Arranger) ->

  DOMINO_WIDTH = 100
  DOMINO_HEIGHT = 50
  TABLE_HEIGHT = 1000
  TABLE_WIDTH = 1000

  class Place

    constructor: ->
      @at = new Arranger

    set: (f) -> @at[f].apply @domino, [@from]
    layout: (f) -> @at[@from.layout][f].apply @domino, [@from]

    start: (@from, @domino) ->
      @table =
        height: @from.height()
        width: @from.width()
      @place @center

    before: (@from, @domino) -> @place @head

    after: (@from, @domino) -> @place @tail

    place: (position) ->

      @set 'defaults'
      @set 'double'

      position()

      @set 'style'
      @set 'inverted'
      @set 'layout'

      @domino

    center: => @set 'center'
    head: => @layout @next_in @head_path
    tail: => @layout @next_in @tail_path

    next_in: (path) ->
      _.find _.keys(path), (pos) =>
        @is_next path[pos]

    is_next: (pos) -> pos.apply @from

    head_path:
      up_left: ->
        (@pos is 'right up' and @layout is 'vertical') or
        (@pos is 'left' and @left < DOMINO_HEIGHT)
      left_up: ->
        (@pos is 'up right' and @layout is 'vertical') or
        (@pos is 'left' and @left < DOMINO_WIDTH)
      up_right: ->
        (@pos is 'left up' and @layout is 'vertical') or
        (@pos is 'right' and @left + @width > TABLE_WIDTH - DOMINO_HEIGHT)
      right_up: ->
        (@pos is 'up left' and @layout is 'vertical') or
        (@pos is 'right' and @left + @width > TABLE_WIDTH - DOMINO_WIDTH)
      left: -> @pos in ['center', 'left', 'left up', 'up left']
      right: -> @pos in ['right', 'right up', 'up right']

    tail_path:
      right: -> true
