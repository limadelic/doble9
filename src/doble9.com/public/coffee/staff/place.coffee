define ['underscore'], (_) ->

  class Place

    DOMINO_WIDTH = 100
    DOMINO_HEIGHT = 50

    set: (f) -> f.apply @domino, [@from]

    start: (@from, @domino)-> @place => @set @center

    before: (@from, @domino) -> @place @head

    after: (@from, @domino) -> @place @tail

    place: (position) ->

      @set @defaults
      @set @double

      position()

      @set @style

      @domino

    defaults: ->
      @width = DOMINO_WIDTH
      @height = DOMINO_HEIGHT
      @type = 'default'

    double: ->
      return unless @[0] is @[1]
      @type = 'double'
      [@width, @height] = [@height, @width]

    center: (from) ->
      @top = from.height() / 2 - @height / 2
      @left = 100 + from.width() / 2 - @width / 2

    head: =>
      if @from.left < DOMINO_HEIGHT
      then @set @up
      else if @from.left < DOMINO_WIDTH
      then @set @left_up
      else @set @left

    tail: => @set @right

    left_up: (from) ->
      @type = 'double'
      [@width, @height] = [@height, @width]
      @top = from.top - @height / 2
      @left = from.left - @width

    up: (from) ->
      @type = 'double'
      [@width, @height] = [@height, @width]
      @top = from.top - @height
      @left = from.left

    left: (from) ->
      @top = from.top + from.height / 2 - @height / 2
      @left = from.left - @width

    right: (from) ->
      @top = from.top + from.height / 2 - @height / 2
      @left = from.left + from.width

    style: ->
      @style = """
        top: #{@top}px;
        left: #{@left}px;
      """