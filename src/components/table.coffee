React = require 'react'

{ component } = require '../helpers/react'

{ td } = React.DOM

module.exports = component

  render: ->
    td id: 'table', className: 'main dominoes', '9/9'
