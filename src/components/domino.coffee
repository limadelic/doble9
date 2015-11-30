React = require 'react'

{ component } = require '../helpers/react'

Number = require './number'

{ div } = React.DOM

module.exports = component

  render: -> if @props.visible then @front() else @back()

  front: ->
    [x, y] = @props.domino
    div className: 'domino',
      Number x: x, y: y
      Number x: y, y: x

  back: -> div className: 'domino back'
