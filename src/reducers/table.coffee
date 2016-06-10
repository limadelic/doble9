{ put } = require '../helpers/table'

module.exports =
  
  defaults: []
  
  start: -> []
    
  play: ({ domino }) -> domino? and put domino, @

    