_ = require 'lodash'

{ EventEmitter } = require 'events'
{ register } = require '../helpers/dispatcher'

players = _.keys require './players'
{ remove_any } = require '../helpers/_'
Place = require '../helpers/place'

class Game extends EventEmitter

  ready: ({ clientWidth, clientHeight }) ->
    @place = new Place
      width: clientWidth
      height: clientHeight

  start: ->
    @flush()
    @pick 10 for @player in players
    @emit 'change'

  starting: -> _.isEmpty @table

  flush: -> @empty(); @fill()
  empty: -> @[x] = [] for x in ['all', 'table'].concat players
  fill: -> @all.push [x, y] for y in [x..9] for x in [0..9]

  pick: (count) -> @[@player].push remove_any @all for [1..count]

  play: ({ domino, player, head }) ->
    _.remove @[player], domino
    @place.on { @table, head, domino }
    @emit 'change'
    @emit 'played', { player }

module.exports = register Game