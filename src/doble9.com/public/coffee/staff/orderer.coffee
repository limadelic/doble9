define ['underscore'], (_) ->

  class Orderer

    constructor: (@table) ->

    place: (domino) ->
      _.each [
        @start
        @setup
        @double
        @center
        @style
      ],

      (f) => f.apply domino, [@]
      domino

    setup: ->
      @width = 100
      @height = 50
      @type = 'default'

    start: (_this) ->
      return unless _this.right?
      _this.right = _this.left = @

    double: ->
      return unless @[0] is @[1]
      @type = 'double'
      [@width, @height] = [@height, @width]

    center: (_this) ->
      @top = _this.table.box.height() / 2 - @height / 2
      @left = 100 + _this.table.box.width() / 2 - @width / 2

    style: ->
      @style = """
        top: #{@top}px;
        left: #{@left}px;
      """


