require './sut'

global.requirejs = require 'requirejs'

requirejs.config
  baseUrl: "#{__dirname}/../src/doble9.com/public/coffee/"
  nodeRequire: require
  paths:
    jquery: '../js/jquery'
    cs: '../js/cs'
    text: '../js/text'
    'coffee-script': '../js/coffee-script'
    underscore: '../js/underscore'
    backbone: '../js/backbone'
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'