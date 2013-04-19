require ['cs!game'], (Game) ->

  alert JSON.stringify new Game().dominoes

#game =
#  dominoes: []
#  players: []
#
#for x in [0..9]
#  for y in [x..9]
#    game.dominoes.push [x, y]
#
#pick_domino = ->
#  index = Math.random() * game.dominoes.length
#  game.dominoes.splice(index, 1)[0]
#
#pick_dominoes = -> pick_domino() for x in [0..9]
#
#add_player = ->
#  game.players.push
#    dominoes: pick_dominoes()
#
#add_player() for x in [0..3]



