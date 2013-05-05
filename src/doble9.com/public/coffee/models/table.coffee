define ['backbone', 'underscore'],
(Backbone, _) ->

  class Table extends Backbone.Model

    dominoes: []
    name: 'table'
    width: 42

    head: -> _.first _.first @dominoes
    tail: -> _.last _.last @dominoes
    heads: -> [@head(), @tail()]

    play: (@domino) ->
      @start() or @play_number(0) or @play_number(1)

    start: ->
      return unless _.isEmpty @dominoes
      @dominoes.push @domino

    play_number: (x) ->
      return @play_tail() if @domino[x] is @tail()
      return @play_head() if @domino[x] is @head()

    play_tail:  ->
      @domino.reverse() if @domino[1] is @tail()
      @dominoes.push @domino

    play_head: ->
      @domino.reverse() if @domino[0] is @head()
      @dominoes.unshift @domino


