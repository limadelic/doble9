React = require 'react'

{ div, td } = React.DOM

module.exports =
  front:
    root: div
    style: 'horizontal top'
  left:
    root: td
    style: 'vertical'
  right:
    root: td
    style: 'vertical'
  player:
    root: div
    style: 'horizontal bottom'