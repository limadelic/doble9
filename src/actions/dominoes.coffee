dispatcher = require '../helpers/dispatcher'

module.exports =

  flush: -> dispatcher.dispatch
    action: 'flush'

  pick: (player, count=1) -> dispatcher.dispatch
    action: 'pick'
    player: player
    count: count



