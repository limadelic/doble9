describe 'Domino', ->

  it 'start', ->
    game.emit 'start'
    game.dominoes.length.should.eql 55

  it 'salida', ->
