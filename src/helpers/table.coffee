_ = require 'lodash'

exports.heads = heads = (table) -> [
  _.first _.first table
  _.last _.last table
]
  
exports.put = (domino, table) ->
  
  [left, right] = domino
  [head, tail] = heads table

  (_.isEmpty(table) and [domino]) or
  (left  is tail and _.concat table, [domino]) or
  (left  is head and _.concat [domino.reverse()], table) or
  (right is head and _.concat [domino], table) or
  (right is tail and _.concat table [domino.reverse()]) or
  table
