describe 'Domino', ->

  it 'salida', ->

    when: 'start'
    then:
      dominoes: []
      players: all? count: 10


  it 'la gorda', ->

    given: player: [[9,9]]
    when: play: player: 'player', domino: [9,9]
    then:
      dominoes: [[9,9]]
      player: []

  it 'forro', ->

    given:
      player: [[9,9]]
      left: [[8,8]]
    when: [
      play: player: 'player', domino: [9,9]
      play: player: 'left', domino: [8,8]
    ]
    then:
      dominoes: [[9,9]]
      player: []
      left: [8,8]

  it 'autoplays', ->

    given:
      player: [[9,9]]
      left: [[9,8]]
      front: [[8,8]]
      right: [[7,7]]
    when: play: player: 'player', domino: [9,9]
    then:
      dominoes: [[9,9],[9,8],[8,8]]
      player: []
      left: []
      front: []
      right: [7,7]

