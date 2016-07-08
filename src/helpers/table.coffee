_ = require 'lodash'

Place = require './place'

exports.heads = heads = (table) -> [
  _.first _.first table
  _.last _.last table
] unless _.isEmpty table

exports.put = (domino, table) ->
  return table unless domino?

  [left, right] = domino
  [head, tail] = heads(table) ? []

  head =
    (_.isEmpty(table) and 'start') or
    (left  is tail and 'tail') or
    (left  is head and 'head') or
    (right is head and 'head') or
    (right is tail and 'tail') or
    'forro'

  place = new Place
    width: innerWidth - 250,
    height: innerHeight

  place.on { table, head, domino }