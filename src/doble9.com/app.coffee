express = require 'express'

app = express()

app.set 'port', process.env.PORT || 3000
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.use express.static __dirname + '/public'

app.get '/', (_, res) -> res.render 'index'

app.listen app.get('port'), ->
  console.log "Running on #{app.get 'port'}"
