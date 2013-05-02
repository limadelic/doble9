mocha.setup 'bdd'
chai.should()

require [
  'cs!debug'
  'cs!test/chipsort'
], () -> mocha.run()

