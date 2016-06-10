_ = require 'lodash'

module.exports =
  
  defaults: []
  
  start: -> _.flatten(
    for x in [0..9]
      for y in [x..9]
        [x, y]
  )

  need_domino: ({ player }, dispatch) ->
    domino = @[Math.round Math.random() * @length]
    dispatch pick: { player, domino }
    _.without @, domino
