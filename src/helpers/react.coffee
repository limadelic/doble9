React = require 'react'

module.exports =

  component: (x) -> React.createFactory React.createClass x

  key: (domino) -> Number domino.join ''
