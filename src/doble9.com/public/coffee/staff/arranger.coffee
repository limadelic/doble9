define [], () ->

  DOMINO_WIDTH = 100
  DOMINO_HEIGHT = 50
  TABLE_HEIGHT = 1000
  TABLE_WIDTH = 1000

  class Arranger

    constructor: ->
      @horizontal.left = @vertical.left = @left
      @horizontal.right = @vertical.right = @right

    defaults: ->
      @width = DOMINO_WIDTH
      @height = DOMINO_HEIGHT
      @type = 'default'
      @layout = 'horizontal'

    style: -> @style = """
      top: #{@top}px;
      left: #{@left}px;
    """

    double: ->
      return unless @[0] is @[1]
      @type = 'double'
      [@width, @height] = [@height, @width]

    layout: (from) ->
      return unless from.layout is 'horizontal' and
        @pos.match /up|down/
      @layout = 'vertical'
      @type = 'double'

    inverted: (from) -> @inverted = from.inverted or
      from.pos in ['left up', 'up left']

    center: (from) ->
      TABLE_HEIGHT = from.height()
      TABLE_WIDTH = from.width()
      @top = TABLE_HEIGHT / 2 - @height / 2
      @left = 100 + TABLE_WIDTH / 2 - @width / 2
      @pos = 'center'

    left: (from) ->
      @top = from.top + from.height / 2 - @height / 2
      @left = from.left - @width
      @pos = 'left'

    right: (from) ->
      @top = from.top + from.height / 2 - @height / 2
      @left = from.left + from.width
      @pos = 'right'

    horizontal:

      left_up: (from) ->
        @top = from.top - DOMINO_HEIGHT
        @left = from.left - DOMINO_HEIGHT
        @pos = 'left up'

      up_left: (from) ->
        @top = from.top - DOMINO_WIDTH
        @left = from.left
        @pos = 'up left'

      up_right: (from) ->
        @top = from.top - DOMINO_WIDTH
        @left = from.left + DOMINO_HEIGHT
        @pos = 'up right'

    vertical:

      left_up: (from) ->
        @top = from.top
        @left = from.left - DOMINO_WIDTH
        @pos = 'left up'

      right_up: (from) ->
        @top = from.top
        @left = from.left + DOMINO_HEIGHT
        @pos = 'right up'

      up_right: (from) ->
        @top = from.top - DOMINO_HEIGHT
        @left = from.left
        @pos = 'up right'
