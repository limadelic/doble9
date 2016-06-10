
{ combineReducers } = require 'redux'
{ createStore, reducer } = require '../helpers/redux'

dominoes = reducer require '../reducers/dominoes'
table = reducer require '../reducers/table'
player = (settings) -> reducer require('../reducers/player'), settings

reducers = combineReducers {
  dominoes
  table
  players: combineReducers
    player: player name: 'player', play_after: 'right'
    front: player name: 'front', play_after: 'left'
    right: player name: 'right', play_after: 'front'
    left: player name: 'left', play_after: 'player'
}

module.exports = createStore reducers