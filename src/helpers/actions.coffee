dispatcher = require './dispatcher'
_ = require 'lodash'

module.exports =

  dispatch: (name, opts={}) ->
    dispatcher.dispatch _.assign opts, action: name


