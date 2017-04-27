describe 'Domino', ->

  it 'salida', ->

    when: 'start'
    then:
      empty: true
      players: all? count: 10


  it 'la gorda', ->

    given: player: [[9,9]]
    when: play: player: 'player', domino: [9,9]
    then:
      eql: [[9,9]]
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
      left: []
