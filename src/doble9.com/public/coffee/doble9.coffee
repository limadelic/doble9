require ['underscore', 'cs!models/game', 'cs!dealer', 'cs!views/player'],
(_, Game, Dealer, Player) ->

  game = new Game()
  dealer = new Dealer()
  player = new Player()

  dealer.deal game

  $('#player1').html player.render().el

  alert JSON.stringify _.first(game.players).dominoes




