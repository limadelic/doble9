_ = require 'lodash'

{ EventEmitter } = require 'events'
{ register } = require '../helpers/dispatcher'

players = _.keys require './players'
{ remove_any } = require '../helpers/_'

class Game extends EventEmitter

  ready: ({ @Table }) ->

  start: ->
    @flush()
    @pick 10 for @player in players
    @emit 'change'

  starting: -> _.isEmpty @table

  flush: -> @empty(); @fill()
  empty: -> @[x] = [] for x in ['all', 'table'].concat players
  fill: -> @all.push [x, y] for y in [x..9] for x in [0..9]

  pick: (count) -> @[@player].push remove_any @all for [1..count]

  play: ({ @domino, @player, head }) ->
    return unless @valid_play()
    @play_domino()
    @place_on_table()
    @emit 'change'

  valid_play: -> @starting() or @intersects @domino, @heads()
  play_domino: -> _.remove @[@player], @domino
  place_on_table: ->

  head: -> _.first _.first @table
  tail: -> _.last _.last @table
  heads: -> [@head(), @tail()]

module.exports = register Game