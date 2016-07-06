React = require 'react'

{ component } = require '../helpers/react'
{ dispatch } = require '../helpers/redux'

Player = require './player'
Table = require './table'

{ div, table, tr } = React.DOM

module.exports = component

  componentDidMount: ->
    dispatch start: null

  render: -> div id: 'doble9',
    table {},
      tr {},
        Player id: 'left'
        Table()
        Player id: 'right'
    Player id: 'front'
    Player id: 'me'
