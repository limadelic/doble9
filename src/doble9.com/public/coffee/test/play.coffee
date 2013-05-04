describe 'Play', ->

  sut = {}

  before (done) ->
    require ['cs!models/game'], (Game) ->
      sut = new Game
      done()

  it 'should not allow forros', (done) ->
    sut.table.dominoes = [[0,0]]
    sut.play [9,9]
    verify_dominoes 'table', [[0,0]]
    done()

  verify_dominoes = (x, y) ->
    x = sut[x].dominoes
    return if _.isEqual x, y
    fail x, y, "Expected #{JSON.stringify x} to be #{JSON.stringify y}"

