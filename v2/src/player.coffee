module.exports = ({ name, after }) -> [
  {
    when: 'start'
    dominoes: []
    then: (get_domino: player: name for [1..10])
  }
  {
    when: add_domino: player: name
    dominoes: -> push domino
  }
  {
    when: play_domino: player: name
    dominoes: -> without domino
  }
  {
    when: play: player: after
    then: 'pick_domino'
  }
  {
    when: 'pick_domino'

  }
]