_ = require 'lodash'
React = require 'react'

{ component } = require '../helpers/react'

{ div, img } = React.DOM

game = require '../stores/doble9'
{ heads } = require '../helpers/table'

module.exports = component

  componentDidMount: -> @unsubscribe = game.subscribe @refresh
  componentWillUnmount: -> @unsubscribe()
  getInitialState: -> @getState()
  refresh: ->@setState @getState()

  getState: ->
    starting: _.isEmpty game.getState().table
    heads: heads game.getState().table

  render: ->
    div (@normal() ? @active() ? @inactive()),
      img src: "img/#{@props.number}.gif"

  normal: -> className: 'number' unless @props.onClick?

  active: -> if @state.starting or @props.number in @state.heads
    { className: 'number active', @onClick }

  inactive: -> className: 'number inactive'

  onClick: -> @props.onClick { head: @props.number }


