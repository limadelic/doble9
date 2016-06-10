_ = require 'lodash'
redux = require 'redux'

store = {}

dispatch = (actions, done) ->
  for type, action of actions
    setTimeout ->
      p [type, action]
      action = action store.getState() if _.isFunction action
      store.dispatch _.assign { type }, action
      done?()
  undefined

init_state = (defaults, settings) ->
  return defaults unless settings?
  return settings unless defaults?
  defaults = defaults.apply settings if _.isFunction defaults
  _.merge defaults, settings

reducer = (name, settings) ->

  actions = require "../reducers/#{name}"

  (state, action) ->
    state ?= init_state actions.defaults, settings
    actions[action.type]?.apply(state, [action, dispatch]) or state

createStore = (reducers) -> store = redux.createStore reducers

module.exports = { createStore, store, dispatch, reducer }