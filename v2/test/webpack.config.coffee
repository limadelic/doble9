coffee =
  test: /\.coffee$/
  use: [ 'coffee-loader' ]

module.exports =
  target: 'node'
  module:
    rules: [ coffee ]