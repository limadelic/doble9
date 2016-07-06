_ = require 'lodash'
React = require 'react'

{ component } = require '../helpers/react'

{ div, img } = React.DOM

module.exports = component

  render: ->
    div { className: 'number', @onClick },
      img src: "img/#{@props.number}.gif"

  onClick: -> @props.onClick { head: @props.number }


