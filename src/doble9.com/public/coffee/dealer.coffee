define [], ->

  class Dealer

    deal: (@game) ->
      @load_dominoes()
      @deal_players()

    load_dominoes: ->
      for x in [0..9]
        for y in [x..9]
          @game.dominoes.push [x, y]

    deal_players: -> @deal_player() for x in [0..3]

    deal_player: -> @game.players.push
      dominoes: @deal_dominoes()

    deal_dominoes: -> @deal_domino() for x in [0..9]
    deal_domino: -> @game.dominoes.splice(@index(), 1)[0]
    index: -> Math.random() * @game.dominoes.length
