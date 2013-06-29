define ['underscore'], (_) ->

  class Orderer

    constructor: (@table) ->
      @row = 0
      @edge = 0
      @margin = 0
      @float = 'left'

    place: (domino) ->

      domino.reverse() if @float is 'right'
      domino.type = 'default'
      domino.style = ''
      domino.width = 100

      if domino[0] is domino[1]
        domino.type = 'double'
        domino.width = 50

      if @row is 0 and @edge is 0
        @edge = @table.width / 2
        domino.style = 'margin-left: 50%;'

      if @row > 0 and @edge is 0
        domino.type = 'double up'
        domino.width = 50
        @float = if @float is 'left' then 'right' else 'left'
        domino.first_in_row = true
        domino.reverse() if @float is 'left'
        domino.style = 'margin-' + @float + ': ' + @margin + 'px;'
        @edge = @margin

      if @table.width - (@edge + domino.width) < 50
        domino.type = 'double down'
        @margin = @table.width - (@edge + 50)
        @edge = 0
        @row++;
        domino.reverse() if @float is 'right'
      else @edge += domino.width

      domino.float = @float
      domino