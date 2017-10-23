#export corals = (core) -> core

#import fs from 'fs'
fs = require 'fs'
fs.readFile './src/corals.coffee', (e,txt) ->
  console.log txt.toString()
