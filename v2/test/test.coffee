import fs from 'fs'
#fs = require 'fs'

describe 'Me', ->

  it 'read', (done) ->
    fs.readFile 'test/test.coffee', (e, content) ->
      console.log content.toString()
#      content.toString().should.match /Me/
      done()
