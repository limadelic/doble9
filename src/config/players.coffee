React = require 'react'

{ div, td } = React.DOM

module.exports =
  front:
    autoplay: true
    before_me: 'left'
    ui: div
    className: 'horizontal top'
  left:
    autoplay: true
    before_me: 'player'
    ui: td
    className: 'vertical'
  right:
    autoplay: true
    before_me: 'front'
    ui: td
    className: 'vertical'
  me:
    before_me: 'right'
    ui: div
    className: 'horizontal bottom'