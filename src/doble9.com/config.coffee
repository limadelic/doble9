assets = require 'connect-assets'
require '../settings'

pub = __dirname + '/public'
views = __dirname + '/views'

app.configure ->

  @use assets src: pub
  @use express.static pub

  @use express.bodyParser()
  @use express.methodOverride()

  @use @router

  @set 'views', views
  @set 'view engine', 'jade'

routes = require './routes'

app.get '/', routes.index
app.get '*', routes.index

