define ['underscore'], (_) ->

  class Place

    set: (f) -> f.apply @domino, [@from]

    start: (@from, @domino)-> @place @center

    before: (@from, @domino) -> @place @head

    after: (@from, @domino) -> @place @tail

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

    center: (from) ->
      @top = from.height() / 2 - @height / 2
      @left = 100 + from.width() / 2 - @width / 2

    head: ->

    tail: (from)->
      @top = from.top + from.height / 2 - @height / 2
      @left = from.left + from.width

    style: ->
      @style = """
        top: #{@top}px;
        left: #{@left}px;
      """