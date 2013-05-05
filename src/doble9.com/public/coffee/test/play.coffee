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
      player: [[9,9]]
      oponents: [
        [[9,8]]
        [[8,8]]
        [[9,7]]
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

    sut.player_plays()

    verify done, table: [[9,9],[9,8]]
