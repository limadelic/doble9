define ['backbone', 'underscore', 'text!/templates/table.html'],
(Backbone, _, table_html) ->

  class Table extends Backbone.View

    el: '#table'
    template: _.template table_html

    render: ->
      @model.width = @$el.width()
      @$el.html @template @model
      @
