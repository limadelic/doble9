require './sut'

global.requirejs = require 'requirejs'

requirejs.config
  baseUrl: "#{__dirname}/../src/doble9.com/public/coffee/"
  nodeRequire: require
  paths:
    cs: '//cdnjs.cloudflare.com/ajax/libs/require-cs/0.4.2/cs'
    'coffee-script': '//cdnjs.cloudflare.com/ajax/libs/coffee-script/1.6.3/coffee-script.min'

global.p = (x) -> console.log JSON.stringify x
global.m = (x) -> p (name for name of x)

