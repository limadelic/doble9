define [], () ->

  class Orderer

    constructor: (@table) ->

    place: (@domino) ->
      @defaults()
      @start()
      @double()
      @position()
      @style()

    defaults: ->
      @domino.width = 100
      @domino.height = 50
      @domino.type = 'default'

    start: ->
      return unless @right?
      @right = @left = @domino

    double: ->
      return unless @domino[0] is @domino[1]
      @domino.type = 'double'
      [@domino.width, @domino.height] =
        [@domino.height, @domino.width]

    position: ->
      @domino.top = @table.box.height() / 2 - @domino.height / 2
      @domino.left = 100 + @table.box.width() / 2 - @domino.width / 2

    style: ->
      @domino.style = """
        top: #{@domino.top}px;
        left: #{@domino.left}px;
      """
      @domino


