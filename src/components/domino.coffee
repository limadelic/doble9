React = require 'react'

{ component, key } = require '../helpers/react'

Head = require './head'

{ div } = React.DOM

module.exports = component

  render: -> if @props.visible then @front() else @back()

  onClick: ({head}) ->
    { onPlay, domino } = @props
    onPlay { domino, head }

  front: ->
    { domino } = @props
    className = "domino #{domino.type}"
    style = domino.style?()
    heads = domino.inverted and _.invert(domino) or domino

    div { className, style },
      Head { number: heads[0], @onClick }
      Head { number: heads[1], @onClick }

  back: -> div className: 'domino back'
