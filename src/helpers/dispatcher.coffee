_ = require 'lodash'
{ Dispatcher } = require 'flux'

dispatcher = new Dispatcher

module.exports =

  dispatcher: dispatcher

  dispatch: (action, opts={}) ->
    dispatcher.dispatch _.assign opts, { action }

  register: (Store) ->
    store = new Store
    dispatcher.register (e) -> store[e.action] e
    store