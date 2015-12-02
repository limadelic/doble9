React = require 'react'
_ = require 'lodash'

{ component } = require '../helpers/react'

Domino = require './domino'

{ div } = React.DOM

players = require '../players'
dominoes = require '../stores/dominoes'


module.exports = component

  getInitialState: ->
    dominoes: []

  refresh: -> @setState
    dominoes: dominoes.for @props.id

  componentDidMount: ->
    dominoes.on 'change', @refresh

  show_dominoes: -> @props.id is 'player'

  layout: -> players[@props.id]

  key: (domino) -> Number domino.join ''

  render: ->
    @layout().root className: @layout().style,
      div id: @props.id, className: 'dominoes', @dominoes()

  dominoes: -> @state.dominoes.map (x) =>
    Domino key: @key(x), domino: x, visible: @show_dominoes()

