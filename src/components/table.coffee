React = require 'react'
{ component } = require '../helpers/react'
{ td } = React.DOM

{ dispatch } = require '../helpers/dispatcher'

module.exports = component

  componentDidMount: ->
    dispatch 'ready', Table: @

  render: ->
    td id: 'table', className: 'main dominoes', '9/9'
