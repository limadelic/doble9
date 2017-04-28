module.exports = ({ name }) -> [
  {
    when: 'start'
    dominoes: []
    then: (get_domino: player: name for [1..10])
  }
  {
    when: add_domino: player: name
    dominoes: -> push domino
  }
]