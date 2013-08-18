define [
  'underscore'
  'cs!staff/arranger'
], (_, Arranger) ->

  DOMINO_WIDTH = 100
  DOMINO_HEIGHT = 50

  class Place

    constructor: ->
      @at = new Arranger

    set: (f) -> @at[f].apply @domino, [@from]

    start: (@from, @domino) -> @place @center

    before: (@from, @domino) -> @place @head

    after: (@from, @domino) -> @place @tail

    place: (position) ->

      @set 'defaults'
      @set 'double'

      position()

      @set 'style'

      @domino

    center: => @set 'center'
    head: => @set @next_in @head_path
    tail: => @set @next_in @tail_path

    next_in: (path) ->
      _.find _.keys(path), (pos) =>
        @is_next path[pos]

    is_next: (pos) -> pos.apply @from

    head_path:
      up_left: -> @pos is 'left' and @left < DOMINO_HEIGHT
      left_up: -> @pos is 'left' and @left < DOMINO_WIDTH
      right_up: -> @pos is 'up left'
      left: -> @pos in ['center', 'left', 'up right']
      right: -> @pos in ['right', 'right up']

    tail_path:
      right: -> true