_ = require 'lodash'

{ combineReducers, createStore } = require 'redux'

store = {}

dispatch = (actions, done) ->
  for type, action of actions
    setTimeout ->
      action = action store.getState() if _.isFunction action
      action = _.merge { type }, action
      store.dispatch action
      done?()
  undefined

reducer = (name, settings) -> (state, action) ->
  reducer = require "../reducers/#{name}"
  reducer[action.type]?.apply(state, [action, dispatch]) or state

player = (name, play_after) -> reducer 'player', { name, play_after, dominoes: [] }

reducers = combineReducers
  table: reducer 'table', []
  players: combineReducers
    player: reducer 'player', name: 'player', play_after: 'right', autoplay: false, dominoes: []
    front: reducer 'player', name: 'front', play_after: 'left', autoplay: true, dominoes: []
    right: reducer 'player', name: 'right', play_after: 'front', autoplay: true, dominoes: []
    left: reducer 'player', name: 'left', play_after: 'player', autoplay: true, dominoes: []
    
store = createStore reducers
    
module.exports = { store, dispatch }