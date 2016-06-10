
{ combineReducers } = require 'redux'
{ createStore, reducer } = require '../helpers/redux'

reducers = combineReducers
  table: reducer 'table'
  players: combineReducers
    player: reducer 'player', name: 'player', play_after: 'right'
    front: reducer 'player', name: 'front', play_after: 'left'
    right: reducer 'player', name: 'right', play_after: 'front'
    left: reducer 'player', name: 'left', play_after: 'player'

module.exports = createStore reducers