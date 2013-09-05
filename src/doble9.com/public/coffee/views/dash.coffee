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

    render_winner: ->
      return unless game.model.done()
      for player in game.model.players() when player.won
        @$el.append @win_template
          style: @winner_style player.name
          count: player.count()

    delta =
      left:
        top: -25
        left: 25
      front:
        top: 75
        left: -25
      right:
        top: -25
        left: -25
      player:
        top: -25
        left: -25

    winner_style: (player) ->
      el = @$("##{player}").offset()
      """
      top: #{el.top + delta[player].top}px;
      left: #{el.left + delta[player].left}px;
      """

