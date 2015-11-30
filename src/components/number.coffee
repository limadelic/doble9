React = require 'react'

{ component } = require '../helpers/react'

{ div, a, img } = React.DOM

module.exports = component

  render: ->
    div className: 'number',
      a href: "/#play/#{@props.x}#{@props.y}",
        img src: "img/#{@props.x}.gif"
