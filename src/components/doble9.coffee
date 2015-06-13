React = require 'react'

{ component } = require '../helpers/react'

{ div, table, tr, td } = React.DOM

module.exports = component

  render: ->
    table {},
      tr {},
        td className: 'vertical',
          div id: 'left', className: 'dominoes'
        td id: 'table', className: 'main dominoes'
        td className: 'vertical',
          div id: 'right', className: 'dominoes'

    div className: 'horizontal top',
      div id: 'front', className: 'dominoes'

    div className: 'horizontal bottom',
      div id: 'player', className: 'dominoes'
