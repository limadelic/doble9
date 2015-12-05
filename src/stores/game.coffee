_ = require 'lodash'

{ EventEmitter } = require 'events'
{ register } = require '../helpers/dispatcher'

players = _.keys require './players'

class Game extends EventEmitter

  start: ->
    @flush()
    @pick player, 10 for player in players
    @emit 'change'

  flush: -> @empty(); @fill()
  empty: -> @[x] = [] for x in ['all', 'table'].concat players
  fill: -> @all.push [x, y] for y in [x..9] for x in [0..9]

  pick: (player, count) -> @[player].push @pick_any() for [1..count]
  pick_any: -> @all.splice(@all.length * Math.random(), 1)[0]

  play: ({ domino, player, head }) ->
    return unless @can_play domino, player
    @[player] = _.reject @[player], domino
    @table.push domino
    @emit 'change'

  can_play: (domino, player) -> @has(domino, player) and
    (@starting() or @can_join(domino, @heads()))
  has: (domino, player) -> _.any @[player], domino
  starting: -> _.isEmpty @table
  can_join: (one, another) -> not _.isEmpty _.intersection one, another

  head: -> _.first _.first @table
  tail: -> _.last _.last @table
  heads: -> [@head(), @tail()]

module.exports = register Game