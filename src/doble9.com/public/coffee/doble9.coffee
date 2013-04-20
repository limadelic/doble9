require [
  'underscore'
  'cs!game'
  'cs!Dealer'
], (_, Game, Dealer) ->

  game = new Game()
  dealer = new Dealer()

  dealer.deal game

  alert JSON.stringify _.first(game.players).dominoes




