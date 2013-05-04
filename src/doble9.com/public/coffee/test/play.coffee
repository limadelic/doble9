describe 'Play', ->

  sut = {}

  before (done) ->
    require ['cs!models/game'], (Game) ->
      sut = new Game
      done()

  it 'should not allow forros', (done) ->
    sut.table.dominoes = [[0,0]]
    sut.play [9,9]
    sut.table.dominoes.should.eql [[0,0]]
    done()
