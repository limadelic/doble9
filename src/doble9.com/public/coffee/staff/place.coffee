define ['underscore'], (_) ->

  class Place

    set: (f) -> f.apply @domino, [@]

    start: (@box, @domino)-> @place @center

    before: (@prev, @domino) -> @place @head

    after: (@prev, @domino) -> @place @tail

    place: (position) ->

      @set @defaults
      @set @double

      @set position

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

    center: (_this) ->
      @top = _this.box.height() / 2 - @height / 2
      @left = 100 + _this.box.width() / 2 - @width / 2

    head: ->
    tail: ->

    style: ->
      @style = """
        top: #{@top}px;
        left: #{@left}px;
      """