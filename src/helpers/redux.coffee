_ = require 'lodash'
redux = require 'redux'

store = {}

dispatch = (actions, done) ->
  for type, action of actions
    setTimeout ->
      action = action store.getState() if _.isFunction action
      store.dispatch _.assign { type }, action
      done?()
  undefined

setup = (defaults, settings) ->
  return defaults unless settings?
  return settings unless defaults?
  defaults = defaults.apply settings if _.isFunction defaults
  _.defaults settings, defaults

reducer = (handlers, settings) -> (state, action) ->

  next = handlers[action.type]?.apply state, [action, dispatch]

  next ? state ? setup handlers.defaults, settings

createStore = (reducers) -> store = redux.createStore reducers

module.exports = { createStore, store, dispatch, reducer }