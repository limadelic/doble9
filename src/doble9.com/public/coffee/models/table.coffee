define ['backbone', 'underscore'],
(Backbone, _) ->

  class Table extends Backbone.Model

    dominoes: []
    name: 'table'

    heads: -> [
      _.first _.first @dominoes
      _.last _.last @dominoes
    ]

    play: (domino) ->
      @dominoes.push domino