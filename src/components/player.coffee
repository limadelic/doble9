React = require 'react'
_ = require 'lodash'

{ component } = require '../helpers/react'

Domino = require './domino'

{ div, table, tr, td } = React.DOM

players_layout =
  front:
    root: div
    layout: 'horizontal top'
  left:
    root: td
    layout: 'vertical'
  right:
    root: td
    layout: 'vertical'
  player:
    root: div
    layout: 'horizontal bottom'

module.exports = component

  getInitialState: ->
    dominoes: _.zip [0..9], [0..9]

  show_dominoes: -> @props.id is 'player'

  layout: -> players_layout[@props.id]

  key: (domino) -> Number domino.join ''

  render: ->
    @layout().root className: @layout().layout,
      div id: @props.id, className: 'dominoes', @state.dominoes.map (x) =>
        Domino key: @key(x), domino: x, visible: @show_dominoes()
