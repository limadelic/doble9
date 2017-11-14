import fs from 'fs'

describe 'Me', ->

  it 'read', (done) ->
    fs.readFile 'test/test_spec.coffee', (e, content) ->
      expect(content.toString()).toMatch /Me/
      done()
