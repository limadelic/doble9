mocha.setup 'bdd'
chai.should()

require [
  'cs!test/chipsort'
], () -> mocha.run()

