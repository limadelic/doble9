{ put } = require '../helpers/table'

module.exports =
  
  start: -> []
    
  play: ({ domino }) -> domino? and put domino, @

    