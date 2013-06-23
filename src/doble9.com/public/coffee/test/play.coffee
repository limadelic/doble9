describe 'Play', ->

  new_sut 'models/game'

  it 'salida', (done) ->

    setup player: [[9,9]]
    sut.player_plays [9,9]
    verify done, table: [[9,9]]

  it 'dont allow forros', (done) ->

    setup table: [[0,0]]
    sut.player_plays [9,9]
    verify done, table: [[0,0]]

  it 'use first number', (done) ->

    setup
      table: [[1,9],[9,0]]
      player: [1,0]

    sut.player_plays [0,1]

    verify done, table: [[1,9],[9,0],[0,1]]

  it 'computer responds', (done) ->

    setup
      player: [[9,9],[0,0]]
      oponents: [
        [[9,8],[1,1]]
        [[8,8],[2,2]]
        [[9,7],[3,3]]
      ]

    sut.player_plays [9,9]

    verify done, table: [[7,9],[9,9],[9,8],[8,8]]

  it 'knock on table', (done) ->

    setup
      table: [[9,9]]
      player: [[0,0]]
      oponents: [
        [[8,8]]
        [[7,7]]
        [[9,8]]
      ]

    sut.knock()

    verify done, table: [[9,9],[9,8]]

  it 'se tranco!!', (done) ->

    setup
      table: [[9,9]]
      player: [[0,0]]
      oponents: [
        [[8,8]]
        [[7,7]]
        [[6,6]]
      ]

    sut.knock()

    sut.done().should.be.true
    sut.stucked.should.be.true
    verify done, table: [[9,9]]

  it 'me pegue!!', (done) ->

    setup
      table: [[9,9]]
      player: [[9,0]]
      oponents: [
        [[9,8]]
        [[7,7]]
        [[6,6]]
      ]

    sut.player_plays [9,0]

    sut.done().should.be.true
    sut.winner.should.equal sut.player
    verify done, table: [[9,9],[9,0]]
