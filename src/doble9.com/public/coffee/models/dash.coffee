define [
  'underscore'
  'backbone'
],

(_, Backbone) ->

  class Dash extends Backbone.Model

    buttons: -> [@refresh(), @knock()]

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

    style: (el) -> """
      top: #{el.top}px;
      left: #{el.left}px;
      display: #{el.display};
    """


