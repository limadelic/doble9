describe 'Domino', ->

  game = corals 'dominoes'

  it 'salida', ->

    game.start ->
      game.dominoes.should.eql []
