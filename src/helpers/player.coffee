React = require 'react'

{ div, td } = React.DOM

exports.layout =
  front:
    root: div
    style: 'horizontal top'
  left:
    root: td
    style: 'vertical'
  right:
    root: td
    style: 'vertical'
  me:
    root: div
    style: 'horizontal bottom'