define [
  'cs!staff/arranger'
], (Arranger) ->

  DOMINO_WIDTH = 100
  DOMINO_HEIGHT = 50

  class Place

    constructor: ->
      @at = new Arranger

    set: (f) -> @at[f].apply @domino, [@from]

    start: (@from, @domino) -> @place => @set 'center'

    before: (@from, @domino) -> @place @head

    after: (@from, @domino) -> @place @tail

    place: (position) ->

      @set 'defaults'
      @set 'double'

      position()

      @set 'style'

      @domino


    head: =>
      if @from.left < DOMINO_HEIGHT
      then @set 'up'
      else if @from.left < DOMINO_WIDTH
      then @set 'left_up'
      else @set 'left'

    tail: => @set 'right'
