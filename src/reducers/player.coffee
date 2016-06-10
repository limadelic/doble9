_ = require 'lodash'

computer_pick = require '../players/bob'

module.exports =

  defaults: ->
    autoplay: @name isnt 'player'
    dominoes: []

  start: (_, dispatch) -> [0..9].forEach =>
    dispatch need_domino: { player: @name }

  pick: ({ player, domino }) -> if @name is player
    _.assign @, dominoes: _.concat @dominoes, [domino]

  play: ({ player, domino}, dispatch) -> if @name is player
    dispatch played: ({ table }) -> { player, table }
    _.assign @, dominoes: _.without @dominoes, domino

  played: ({ player, table }, dispatch) -> if @play_after is player and @autoplay
    domino = computer_pick { table, dominoes: @dominoes }
    dispatch play: { player: @name, domino }