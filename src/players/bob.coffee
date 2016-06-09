{ heads } = require '../helpers/table'

module.exports = ({dominoes, table}) ->

  random_heads = heads table
  Math.random() > 0.5 and random_heads.reverse()

  for head in random_heads
    for domino in dominoes
      return domino if head is domino[0]
      return domino.reverse() if head is domino[1]

