_ = require 'lodash'

play = require '../players/bob'

next = ({name, play_after, autoplay}, dominoes) -> { name, play_after, autoplay, dominoes }

module.exports =

  start: -> next @, []

  pick: ({ player, domino }) -> if @name is player

    next @, _.concat @dominoes, [domino]

  play: ({ player, domino}, dispatch) -> if @name is player

    dispatch played: ({ table }) -> { player, table }
    next @, _.remove @dominoes, domino

  played: ({ player, table }, dispatch) -> if @play_after is player and @autoplay

    dispatch play:
      player: @name
      domino: play { table, dominoes: @dominoes }

