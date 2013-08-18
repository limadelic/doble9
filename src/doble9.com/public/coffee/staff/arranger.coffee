define [], () ->

  DOMINO_WIDTH = 100
  DOMINO_HEIGHT = 50

  class Arranger

    defaults: ->
      @width = DOMINO_WIDTH
      @height = DOMINO_HEIGHT
      @type = 'default'

    style: -> @style = """
      top: #{@top}px;
      left: #{@left}px;
    """

    double: ->
      return unless @[0] is @[1]
      @type = 'double'
      [@width, @height] = [@height, @width]

    inverted: (from) -> @inverted = from.inverted or
      from.pos in ['left up', 'up left']

    center: (from) ->
      @top = from.height() / 2 - @height / 2
      @left = 100 + from.width() / 2 - @width / 2
      @pos = 'center'

    left: (from) ->
      @top = from.top + from.height / 2 - @height / 2
      @left = from.left - @width
      @pos = 'left'

    right: (from) ->
      @top = from.top + from.height / 2 - @height / 2
      @left = from.left + from.width
      @pos = 'right'

    left_up: (from) ->
      @type = 'double'
      [@width, @height] = [@height, @width]
      @top = from.top - @height / 2
      @left = from.left - @width
      @pos = 'left up'

    up_left: (from) ->
      @type = 'double'
      [@width, @height] = [@height, @width]
      @top = from.top - @height
      @left = from.left
      @pos = 'up left'

    right_up: (from) ->
      @top = from.top
      @left = from.left + from.width
      @pos = 'right up'

    up_right: (from) ->
      @top = from.top - @height
      @left = from.left
      @pos = 'up right'
