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
      _.find _.keys(path), (x) =>
        @is_next path[x]

    is_next: (dir) -> dir.apply @from

    head_path:
      up: ->
        @left < DOMINO_HEIGHT and
        @dir is 'left'
      up_right: ->
        @left < DOMINO_HEIGHT and
        @dir is 'up'
      left_up: ->
        @left < DOMINO_WIDTH and
        @dir is 'left'
      right: -> @dir is 'right'
      left: -> true

    tail_path:
      right: -> true