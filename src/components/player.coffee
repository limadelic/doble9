_ = require 'lodash'

React = require 'react'
{ div } = React.DOM
{ component, key } = require '../helpers/react'

Domino = require './domino'

players = require '../stores/players'
game = require '../stores/game'

module.exports = component

  getInitialState: ->
    dominoes: []

  refresh: -> @setState
    dominoes: game[@player]

  componentWillMount: ->
    @player = @props.id
    @layout = players[@player]

  componentDidMount: ->
    dominoes.on 'change', @refresh
    game.after 'play', { player: @before_me }, @ if @autoplay?

  show_dominoes: -> @player is 'me'

  play: ({ domino, head }) ->
    dispatch 'play', { @player, domino, head }

  render: ->
    @layout.ui className: @layout.className,
      div id: @player, className: 'dominoes', @dominoes()

  dominoes: -> @state.dominoes.map (x) => Domino
    key: key(x)
    domino: x
    visible: @show_dominoes()
    onPlay: @play