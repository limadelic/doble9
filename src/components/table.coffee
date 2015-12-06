React = require 'react'
{ component, key } = require '../helpers/react'
{ td } = React.DOM
Domino = require './domino'

{ dispatch } = require '../helpers/dispatcher'
game = require '../stores/game'

module.exports = component

  getInitialState: ->
    dominoes: []

  refresh: -> @setState
    dominoes: game.table

  componentDidMount: ->
    game.on 'change', @refresh
    dispatch 'ready', @getDOMNode()

  render: ->
    td id: 'table', className: 'main dominoes', @dominoes()

  dominoes: -> @state.dominoes.map (x) =>
    Domino key: key(x), domino: x, visible: true
