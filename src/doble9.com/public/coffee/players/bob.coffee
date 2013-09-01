define [], () ->

  class Bob

    play: (table, dominoes) ->

      for head in @random_heads table
        for domino in dominoes
          return domino if head is domino[0]
          return domino.reverse() if head is domino[1]

    random_heads: (table) ->
      if Math.random() > 0.5
      then table.heads()
      else table.heads().reverse()

