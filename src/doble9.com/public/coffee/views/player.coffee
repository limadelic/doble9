define ['backbone', 'underscore', 'text!/templates/player.html'],
(Backbone, _, template) ->

  class Player extends Backbone.View

    className: 'dominoes'

    template: _.template 'template'

    render: ->
      @$el.html @template
      @

