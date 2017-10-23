node_externals = require 'webpack-node-externals'

coffee =
  test: /\.coffee$/
  use: [
    loader: 'coffee-loader'
    options:
      transpile: true
  ]

js =
  test: /\.js$/
  use: 'babel-loader'
  exclude: /node_modules/

module.exports =
  target: 'node'
  externals: [node_externals()]
  module:
    rules: [ coffee ]