React = require 'react'

{ component } = require '../helpers/react'

{ div, table, tr, td } = React.DOM

players =
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

  render: ->
    player = players[@props.id]

    player.root className: player.layout,
      div id: @props.id, className: 'dominoes', @props.id
