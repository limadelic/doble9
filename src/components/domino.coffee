_ = require 'lodash'
React = require 'react'

{ component, key } = require '../helpers/react'

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
    [head, tail] = domino.inverted and _.invert(domino) or domino

    div { className, style },
      Head { number: head, @onClick }
      Head { number: tail, @onClick }

  back: -> div className: 'domino back'
