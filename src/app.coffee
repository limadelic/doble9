require './helpers/debug'

React = require 'react'
Doble9 = require './components/doble9'
game = require './game'

React.render(
  Doble9()
  document.getElementById 'doble9'
)

game.start()