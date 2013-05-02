define ['cs!models/domino', 'cs!sorter'],
(Domino, Sorter) ->

  class Dealer

    dominoes: []

    deal: (@game) ->
      @load_dominoes()
      @deal_players()

    load_dominoes: ->
      for x in [0..9]
        for y in [x..9]
          @dominoes.push [x, y]

    deal_players: -> @deal_player player for player in @game.players

    deal_player: (player) ->
      sorter = new Sorter
      player.dominoes = (@pick_domino() for x in [0..9])

    pick_domino: -> @dominoes.splice(@random_index(), 1)[0]

    random_index: -> Math.random() * @dominoes.length
