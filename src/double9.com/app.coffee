global.express = require 'express'
global.app = express()

require './config'

app.listen settings.port

console.log "Running on #{settings.port}"
