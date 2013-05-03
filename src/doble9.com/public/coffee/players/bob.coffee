define [], () ->

  class Bob

    play: (table, dominoes) ->

      for head in table.heads()
        for domino in dominoes
          return [domino, head] if head in domino
