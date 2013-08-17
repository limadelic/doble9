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

    center: (from) ->
      @top = from.height() / 2 - @height / 2
      @left = 100 + from.width() / 2 - @width / 2

    left: (from) ->
      @top = from.top + from.height / 2 - @height / 2
      @left = from.left - @width
      @dir = 'left'

    right: (from) ->
      @top = from.top + from.height / 2 - @height / 2
      @left = from.left + from.width
      @dir = 'right'

    left_up: (from) ->
      @type = 'double'
      [@width, @height] = [@height, @width]
      @top = from.top - @height / 2
      @left = from.left - @width
      @dir = 'up'

    up: (from) ->
      @type = 'double'
      [@width, @height] = [@height, @width]
      @top = from.top - @height
      @left = from.left
      @dir = 'up'
