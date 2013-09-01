define [
  'underscore'
  'backbone'
],

(_, Backbone) ->

  class Dash extends Backbone.Model

    style: (el) -> """
      top: #{el.top}px;
      left: #{el.left}px;
      display: #{el.display};
    """

    buttons: -> _.map ['refresh', 'knock'], (x) =>
      btn = @[x]()
      btn.style = @style btn
      btn

    refresh: ->
      name: 'refresh'
      top: @box.height() - 75
      left: @box.width() - 75
      img: '/img/refresh.png'
      display: 'block'

    knock: ->
      name: 'knock'
      top: @box.height() - 75
      left: 25
      img: '/img/knock.png'
      display: 'none'