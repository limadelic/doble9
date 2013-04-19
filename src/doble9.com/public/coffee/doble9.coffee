require [
  'cs!game'
  'cs!Dealer'
], (Game, Dealer) ->

  game = new Game()
  dealer = new Dealer()

  dealer.deal game

  alert JSON.stringify game.players[0].dominoes




