define [], () ->

  class Orderer

    constructor: (@table) ->

    place: (@domino) ->
      @default_properties()
      @check_if_double()
      @position()
      @apply_properties()

    default_properties: ->
      @width = 100
      @height = 50
      @type = 'default'

    check_if_double: ->
      return unless @domino[0] is @domino[1]
      @type = 'double'
      [@width, @height] = [@height, @width]

    position: ->
      @top = @table.box.height() / 2 - @height / 2
      @left = 100 + @table.box.width() / 2 - @width / 2

    apply_properties: ->
      @domino.style = """
        top: #{@top}px;
        left: #{@left}px;
      """
      @domino.type = @type
      @domino


