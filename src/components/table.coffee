React = require 'react'
{ component, key } = require '../helpers/react'
{ td } = React.DOM
Domino = require './domino'

game = require '../stores/doble9'

module.exports = component

  dominoes: -> dominoes: game.getState().table

  getInitialState: -> @dominoes()

  refresh: -> @setState @dominoes()

  componentDidMount: ->
    game.subscribe @refresh

  render: ->
    td id: 'table', className: 'main dominoes', @render_dominoes()

  render_dominoes: -> @state.dominoes.map (x) ->
    Domino key: key(x), domino: x, visible: true
