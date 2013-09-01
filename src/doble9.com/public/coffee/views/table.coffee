define ['backbone', 'underscore', 'text!/templates/table.html'],
(Backbone, _, table_html) ->

  class Table extends Backbone.View

    el: '#table'
    template: _.template table_html

    initialize: ->
      @$el.empty()

    render: ->
      @model.box = @$el
      @$el.append @template @model
      @model.new_dominoes = []
      @
