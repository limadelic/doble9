React = require 'react'
Doble9 = require './components/doble9'

React.render(
  Doble9()
  document.body
)

{ dispatch } = require './helpers/dispatcher'
dispatch 'start'