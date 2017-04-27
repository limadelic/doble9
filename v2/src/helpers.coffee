_ = require 'lodash'

module.exports =

  shuffle: -> _.shuffle _.flatten(
    for x in [0..9]
      for y in [x..9]
        [x, y]
  )