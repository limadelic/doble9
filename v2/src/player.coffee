module.exports =

  start:
    dominoes: []
    then: (serve: for [1..10])

  serve: dominoes: push: domino

  @play: [[
    { dominoes: without: domino }
    {
      when: dominoes: first: any: heads
      then: play: domino
    }
    { then: knock }
  ]]

  play:
    when: player: next: @
    then: play: player: @

