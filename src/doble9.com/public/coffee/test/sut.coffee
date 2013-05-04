window.new_sut = (file, done) ->
  require ["cs!#{file}"], (Sut) ->
    window.sut = new Sut
    done()

window.setup = (game) ->
  sut.table.dominoes = game.table if game.table?
  sut.player.dominoes = game.player if game.player?
  if game.oponents?
    _.each _.zip(sut.oponents, game.oponents), (x, y) ->
      x.dominoes = y

window.verify = (done, game) ->
  verify_arrays sut.table.dominoes, game.table if game.table?
  done()

window.verify_arrays = (x, y) -> if not _.isEqual x, y then fail x, y,
  "Expected #{JSON.stringify x} to be #{JSON.stringify y}"

