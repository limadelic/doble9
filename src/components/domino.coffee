_ = require 'lodash'
React = require 'react'

{ component } = require '../helpers/react'

Head = require './head'

{ div } = React.DOM

module.exports = component

  render: -> @props.visible and @front() or @back()

  onClick: ({head}) ->
    { onPlay, domino } = @props
    onPlay { domino, head }

  front: ->

    { domino } = @props

    className = "domino #{domino.type}"
    style = domino.style?()
    [head, tail] = domino.inverted and domino.slice().reverse() or domino

    div { className, style }, @head(head), @head(tail)

  head: (number) -> Head @normal(number) ? @playable(number)

  normal: (number) -> { number } unless @props.onPlay?

  playable: (number) -> { number, @onClick }

  back: -> div className: 'domino back'
