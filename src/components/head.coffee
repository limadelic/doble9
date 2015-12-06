_ = require 'lodash'
React = require 'react'

{ component } = require '../helpers/react'

{ div, img } = React.DOM
game = require '../stores/game'

module.exports = component

  head: -> _.first _.first game.table
  tail: -> _.last _.last game.table
  heads: -> [@head(), @tail()]

  render: ->
    div { className: 'number', @onClick },
      img src: "img/#{@props.number}.gif"

  onClick: ->
    head = @match()
    @props.onClick { head } if head?

  match: ->
    return 'start' if game.starting()
    return unless @props.number in @heads()
    @props.number is @head() and 'head' or 'tail'


