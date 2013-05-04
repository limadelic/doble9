mocha.setup 'bdd'
chai.should()
window.fail = chai.assert.fail

require [
  'cs!debug'
  'cs!test/chipsort'
  'cs!test/play'
], () -> mocha.run()

