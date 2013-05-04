describe 'Play', ->

  before (done) ->
    new_sut 'models/game', done

  it 'can start game', (done) ->
    sut.is_salida().should.be.true
    sut.player_plays sut.player.dominoes[0]
    _.isEmpty(table()).should.be.false
    done()

  it 'doesnt allow forros', (done) ->
    setup table: [[0,0]]

    sut.play [9,0]

    verify table: [[0,0]]
    done()

  it 'against computer', (done) ->
    setup
      player: [[9,9]]
      oponents: [
        [[9,8]]
        [[8,8]]
        [[8,7]]
      ]

    sut.play [9,9]

    verify table: [[9,9],[9,8],[8,8],[8,7]]


    done()