require './sut'

global.requirejs = require 'requirejs'

requirejs.config
  baseUrl: "#{__dirname}/../src/doble9.com/public/coffee/"
  nodeRequire: require
  paths:
    cs: '../js/cs'
    'coffee-script': '../js/coffee-script'
