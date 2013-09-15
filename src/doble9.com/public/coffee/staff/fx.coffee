define [
  'underscore'
  'jquery'
], (_, $) ->

  class Fx

    constructor: (@game) ->

    delay: -> 500 * (@game.plays - 1)

    enable: (btn) ->
      setTimeout(
        -> $(btn).fadeIn()
        @delay() + 200
      )

    show: (player, domino) ->

      setTimeout(
        -> $("##{player.play_id}").fadeOut()
        @delay()
      )

      domino.display = 'none'
      setTimeout(
        ->
          $(domino.selector).fadeIn()
          domino.display = 'block'
        @delay() + 200
      )

