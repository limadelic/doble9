describe 'Play', ->

  sut = {}

  before (done) ->
    require ['cs!models/game'], (Game) ->
      sut = new Game
      done()

  it 'should not allow forros', (done) ->
    sut.table.dominoes = [[0,0]]
    sut.play [9,0]
    verify sut.table.dominoes, [[0,0]]
    done()

  verify = (x, y) -> if not _.isEqual x, y then fail x, y,
    "Expected #{JSON.stringify x} to be #{JSON.stringify y}"

