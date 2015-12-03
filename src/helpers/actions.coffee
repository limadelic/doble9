dispatcher = require './dispatcher'
_ = require 'lodash'

module.exports =

  dispatch: (action, opts={}) ->
    dispatcher.dispatch _.assign opts, { action }


