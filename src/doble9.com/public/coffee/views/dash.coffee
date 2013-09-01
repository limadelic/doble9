define ['backbone', 'underscore', 'text!/templates/dash.html'],
(Backbone, _, dash_html) ->

  class Dash extends Backbone.View

    el: 'body'
    template: _.template dash_html

    events:
      'click #refresh': 'refresh'
      'click #knock': 'knock'

    render: ->
      @model.box = @$el
      @$el.append @template @model
      @

    knock: ->
      $('#knock').hide()
      game.knock()

    refresh: ->
      new_game()
      game.render()

