@play = (game) ->

  for head in game.heads
    for domino in game.bob.dominoes
      return [domino, head] if can_play domino, head

can_play = (domino, head) ->
  domino.include head