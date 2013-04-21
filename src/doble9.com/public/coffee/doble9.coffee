require ['underscore', 'cs!models/game', 'cs!dealer', 'cs!views/game'],
(_, Game, Dealer, View) ->

  game = new Game()
  dealer = new Dealer()
  view = new View
    model: game

  dealer.deal game
  view.render()




