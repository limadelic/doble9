define ['backbone', 'underscore', 'text!/templates/table.html'],
(Backbone, _, template) ->

  class Table extends Backbone.View

    el: '#table'
    template: _.template template

    render: ->
      @model.width = @$el.width()
      @$el.html @template @model
      @
