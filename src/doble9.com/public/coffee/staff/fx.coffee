define [
  'underscore'
  'jquery'
], (_, $) ->

  class Fx

    delay: -> 500 * (@plays - 1)

    enable: (btn) ->
      setTimeout(
        -> $(btn).fadeIn()
        @delay() + 200
      )
      @plays = 0

    show: (player, domino) ->
      @update_plays player

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

    update_plays: (player) ->
      if player is game.model.player
      then @plays = 0
      else @plays++