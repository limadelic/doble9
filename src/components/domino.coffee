React = require 'react'

{ component, key } = require '../helpers/react'

Head = require './head'

{ div } = React.DOM

module.exports = component

  render: -> if @props.visible then @front() else @back()

  play: ({head}) ->
    { onPlay, domino } = @props
    onPlay { domino, head }

  front: ->
    div className: 'domino',
      Head number: @props.domino[0], onClick: @play
      Head number: @props.domino[1], onClick: @play

  back: -> div className: 'domino back'

