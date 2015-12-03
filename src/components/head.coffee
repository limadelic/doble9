React = require 'react'

{ component } = require '../helpers/react'

{ div, img } = React.DOM

module.exports = component

  onClick: -> @props.onClick head: @props.number

  render: ->
    div className: 'number', onClick: @onClick,
      img src: "img/#{@props.number}.gif"
