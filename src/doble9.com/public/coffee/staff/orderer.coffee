define ['underscore'], (_) ->

  class Orderer

    constructor: (@table) ->

    set: (f) -> f.apply @domino, [@]

    place: (@domino) ->

      @set @defaults
      @set @double

      if not @started()
      then @start()
      else @add()

      @set @style

      @domino

    defaults: ->
      @width = 100
      @height = 50
      @type = 'default'

    double: ->
      return unless @[0] is @[1]
      @type = 'double'
      [@width, @height] = [@height, @width]

    started: -> @head_down?

    start: ->
      @init_heads()
      @set @center

    init_heads: ->
      @head_down = @head_up = @domino
      @head_down_to = 'right'
      @head_up_to = 'left'

    center: (_this) ->
      @top = _this.table.box.height() / 2 - @height / 2
      @left = 100 + _this.table.box.width() / 2 - @width / 2

    add: -> p 'not cool'

    style: ->
      @style = """
        top: #{@top}px;
        left: #{@left}px;
      """


