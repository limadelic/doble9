define [
  'underscore'
  'backbone'
  'cs!staff/place'
],

(_, Backbone, Place) ->

  class Table extends Backbone.Model

    constructor: (@name) ->
      @dominoes = []
      @place = new Place

    head: -> _.first _.first @dominoes
    tail: -> _.last _.last @dominoes
    heads: -> [@head(), @tail()]

    is_forro: (domino) ->
      domino? and not @starting() and
      _.isEmpty _.intersection @heads(), domino

    starting: -> _.isEmpty @dominoes

    play: (@domino) ->
      @play_start() or @play_number(0) or @play_number(1)

    play_start: ->
      return unless @starting()
      @place.start @box, @domino
      @dominoes.push @domino

    play_number: (x) ->
      return @play_tail() if @domino[x] is @tail()
      return @play_head() if @domino[x] is @head()

    play_tail:  ->
      @domino.reverse() if @domino[1] is @tail()
      @place.after _.last(@dominoes), @domino
      @dominoes.push @domino

    play_head: ->
      @domino.reverse() if @domino[0] is @head()
      @place.before _.first(@dominoes), @domino
      @dominoes.unshift @domino
