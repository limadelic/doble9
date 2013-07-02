define [], () ->

  class Bob

    play: (table, dominoes) ->

      for head in table.heads()
        for domino in dominoes
          return domino if head is domino[0]
          return domino.reverse() if head is domino[1]