define ['backbone', 'underscore', 'text!/templates/player.html'],
(Backbone, _, template) ->

  class Player extends Backbone.View

    template: _.template template

    events:
      'click #pass': 'pass'

    render: ->
      @$el.html @template @model
      @

    pass: -> game.knock()
