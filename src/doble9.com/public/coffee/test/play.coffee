describe 'Play', ->

  new_sut 'models/game'

  it 'can start game', (done) ->

    setup player: [[9,9]]
    sut.player_plays [9,9]
    verify done, table: [[9,9]]

  it 'doesnt allow forros', (done) ->

    setup table: [[0,0]]
    sut.player_plays [9,9]
    verify done, table: [[0,0]]

  it 'against computer', (done) ->

    setup
      player: [[9,9]]
      oponents: [
        [[9,8]]
        [[8,8]]
        [[9,7]]
      ]

    sut.player_plays [9,9]

    verify done, table: [[7,9],[9,9],[9,8],[8,8]]
