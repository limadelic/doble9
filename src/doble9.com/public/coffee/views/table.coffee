define ['backbone', 'underscore', 'text!/templates/table.html'],
(Backbone, _, template) ->

  class Table extends Backbone.View

    el: '#table'
    template: _.template template

    render: ->
      @$el.html @template @model
      @
