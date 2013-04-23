define ['backbone', 'underscore', 'text!/templates/player.html'],
(Backbone, _, template) ->

  class Player extends Backbone.View

    template: _.template template

    events:
      'click .domino': 'play'

    render: ->
      @$el.html @template @model
      @

    play: (e) ->

      alert e.target
      false
