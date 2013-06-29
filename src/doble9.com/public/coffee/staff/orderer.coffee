define [], () ->

  class Orderer

    constructor: (@table) ->

    place: (domino) ->

      opt @table.box

      domino.top = @table.box.innerHeight() / 2
      domino.left = @table.box.innerWidth() / 2
      domino.style = """
        top: #{domino.top}px;
        left: #{domino.left}px;
      """
      domino.type = 'default'
      domino
