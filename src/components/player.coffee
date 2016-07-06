_ = require 'lodash'

React = require 'react'
{ div } = React.DOM
{ component, key } = require '../helpers/react'

Domino = require './domino'

{ dispatch } = require '../helpers/redux'
game = require '../stores/doble9'
{ layout } = require '../helpers/player'

module.exports = component

  dominoes: -> dominoes: game.getState().players[@player]?.dominoes or []

  getInitialState: -> @dominoes()

  refresh: -> @setState @dominoes()

  componentWillMount: ->
    @player = @props.id
    @layout = layout[@player]

  componentDidMount: ->
    game.subscribe @refresh

  show_dominoes: -> @player is 'player'

  play: ({ domino, head }) ->
    domino.reverse() unless head is domino[0]
    dispatch play: { @player, domino }

  render: ->
    @layout.root className: @layout.style,
      div id: @player, className: 'dominoes', @render_dominoes()

  render_dominoes: -> @state.dominoes.map (x) => Domino
    key: key(x)
    domino: x
    visible: @show_dominoes()
    onPlay: @play