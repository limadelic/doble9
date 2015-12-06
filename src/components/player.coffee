React = require 'react'
{ div } = React.DOM
{ component } = require '../helpers/react'

Domino = require './domino'

players = require '../stores/players'
game = require '../stores/game'
{ dispatch } = require '../helpers/dispatcher'

module.exports = component

  getInitialState: ->
    dominoes: []

  refresh: -> @setState
    dominoes: game[@player]

  componentWillMount: ->
    @player = @props.id

  componentDidMount: ->
    game.on 'change', @refresh

  show_dominoes: -> @player is 'me'

  layout: -> players[@player]

  key: (domino) -> Number domino.join ''

  play: ({ domino, head }) ->
    dispatch 'play', { @player, domino, head }

  render: ->
    @layout().root className: @layout().style,
      div id: @player, className: 'dominoes', @dominoes()

  dominoes: -> @state.dominoes.map (x) =>
    Domino key: @key(x), domino: x, visible: @show_dominoes(), onPlay: @play

