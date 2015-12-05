_ = require 'lodash'

module.exports =

  remove_any: (x) -> x.splice(x.length * Math.random(), 1)[0]

  intersects: (x, y) -> not _.isEmpty _.intersection x, y

  other: (both, one) -> _.any both, (x) -> x isnt one