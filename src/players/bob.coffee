@play = (game) ->

  for head in game.heads
    for domino in game.bob.dominoes
      return [domino, head] if head in domino
