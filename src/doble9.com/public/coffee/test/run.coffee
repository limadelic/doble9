mocha.setup 'bdd'
chai.should()

require [
  'cs!debug'
  'cs!test/chipsort'
  'cs!test/play'
], () -> mocha.run()

