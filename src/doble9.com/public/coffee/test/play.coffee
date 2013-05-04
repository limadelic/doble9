describe 'Play', ->

  sut = {}

  before (done) ->
    require ['cs!models/game'], (Game) ->
      sut = new Game
      done()

  it 'can start game', (done) ->
    sut.is_salida().should.be.true
    sut.player_plays sut.player.dominoes[0]
    _.isEmpty(table()).should.be.false
    done()

  it 'doesnt allow forros', (done) ->
    table [[0,0]]
    sut.play [9,0]
    verify table(), [[0,0]]
    done()

  table = (dominoes) ->
    return sut.table.dominoes unless dominoes?
    sut.table.dominoes = dominoes

  verify = (x, y) -> if not _.isEqual x, y then fail x, y,
    "Expected #{JSON.stringify x} to be #{JSON.stringify y}"

