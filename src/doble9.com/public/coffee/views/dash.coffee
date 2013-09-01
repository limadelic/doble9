define ['backbone', 'underscore', 'text!/templates/button.html'],
(Backbone, _, btn_html) ->

  class Dash extends Backbone.View

    el: 'body'
    btn_template: _.template btn_html

    events:
      'click #knock': 'knock'

    render: ->
      @model.box = @$el
      @render_btns()
      @

    render_btns: ->
      for btn in @model.buttons()
        if not @$("##{btn.name}").length
        then @$el.append @btn_template btn

    knock: ->
      $('#knock').hide()
      game.knock()
