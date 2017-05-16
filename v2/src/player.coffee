module.exports =

  start:
    dominoes: []
    then: (pick for [1..10])

  pick: dominoes: push: domino

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

