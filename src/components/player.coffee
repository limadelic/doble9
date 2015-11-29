_ = require 'lodash'
React = require 'react'

{ component } = require '../helpers/react'

{ div, table, tr, td, a, img } = React.DOM

players =
  front:
    root: div
    layout: 'horizontal top'
  left:
    root: td
    layout: 'vertical'
  right:
    root: td
    layout: 'vertical'
  player:
    root: div
    layout: 'horizontal bottom'

module.exports = component

  getInitialState: ->
    dominoes: _.zip [0..9], [0..9]

  componentWillMount: ->
    @player = players[@props.id]
    @render_domino = @props.id is 'player' and @front or @back

  render: ->
    @player.root className: @player.layout,
      div id: @props.id, className: 'dominoes',
        _.map @state.dominoes, @render_domino

  key: (domino) -> Number domino.join ''

  front: (domino) ->
    [x, y] = domino
    div key: @key(domino), className: 'domino',
      div className: 'number',
        a href: "/#play/#{x}#{y}",
          img src: "img/#{x}.gif"
      div className: 'number',
        a href: "/#play/#{y}#{x}",
          img src: "img/#{y}.gif"

  back: (domino) ->
    div key: @key(domino), className: 'domino back'

