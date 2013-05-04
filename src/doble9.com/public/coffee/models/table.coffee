define ['backbone', 'underscore'],
(Backbone, _) ->

  class Table extends Backbone.Model

    dominoes: []
    name: 'table'

    head: -> _.first _.first @dominoes
    tail: -> _.last _.last @dominoes
    heads: -> [@head(), @tail()]

    play: (@domino) -> @start() or @play_tail() or @play_head()

    start: ->
      return unless _.isEmpty @dominoes
      @dominoes.push @domino


    play_tail:  ->
      return unless _.contains @domino, @tail()
      @domino = @domino.reverse() if @domino[1] is @tail()
      @dominoes.push @domino

    play_head: ->
      @domino = @domino.reverse() if @domino[0] is @head()
      @dominoes.unshift @domino


