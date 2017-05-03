module.exports = ({ name, play_after }) -> [
  {
    start:
      dominoes: []
      then: (serve: player: @ for [1..10])

    serve: dominoes: push: domino

    play: [
      dominoes: without: domino
    ]

    play: [[
      {
        when: dominoes: first: first: heads
        then: play: domino
      }
      { then: knock }
    ]]
  }
  {
    when: play: player: play_after
    then: pick: heads
  }
]