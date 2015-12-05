require './helpers/debug'

React = require 'react'
Doble9 = require './components/doble9'

React.render(
  Doble9()
  document.getElementById 'doble9'
)

{ dispatch } = require './helpers/dispatcher'
dispatch 'start'