define [
  'backbone'
  'underscore'
  'text!/templates/button.html'
  'text!/templates/winner.html'
],
(Backbone, _, btn_html, win_html) ->

  class Dash extends Backbone.View

    el: 'body'
    btn_template: _.template btn_html
    win_template: _.template win_html

    events:
      'click #knock': 'knock'

    render: ->
      @model.box = @$el
      @render_btns()
      @render_winner()
      @

    render_btns: ->
      for btn in @model.buttons()
        if not @$("##{btn.name}").length
        then @$el.append @btn_template btn

    knock: ->
      $('#knock').hide()
      game.knock()

    winner: -> game.model.winner

    render_winner: ->
      return unless @winner()?
      @$el.append @win_template
        style: @winner_style()
        count: @winner().count()

    winner_style: ->
      el = @$("##{@winner().name}").offset()
      pos =
        left:
          top: el.top - 25
          left: 25
        front:
          top: 75
          left: el.left - 25
        right:
          top: el.top - 25
          left: @$el.width() - 125
        player:
          top: @$el.height() - 125
          left: el.left - 25

      """
      top: #{pos[@winner().name].top}px;
      left: #{pos[@winner().name].left}px;
      """

