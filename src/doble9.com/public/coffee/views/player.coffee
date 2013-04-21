define ['backbone', 'underscore'],
(Backbone,_) ->

  class Player extends Backbone.View

    className: 'dominoes'

    template: _.template 'playa!!'

    render: ->
      @$el.html @template
      @

