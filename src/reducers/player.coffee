_ = require 'lodash'

computer_play = require '../players/bob'

module.exports =

  defaults: ->
    autoplay: @name isnt 'player'
    dominoes: []

  pick: ({ player, domino }) -> if @name is player
    _.assign @, dominoes: _.concat @dominoes, [domino]

  play: ({ player, domino}, dispatch) -> if @name is player
    dispatch played: ({ table }) -> { player, table }
    _.assign @, dominoes: _.remove @dominoes, domino

  played: ({ player, table }, dispatch) -> if @play_after is player and @autoplay
    domino = computer_play { table, dominoes: @dominoes }
    dispatch play: { player: @name, domino }