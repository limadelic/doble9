window.new_sut = (file, done) ->
  require ["cs!#{file}"], (Sut) ->
    window.sut = new Sut
    done()

window.table = (dominoes) ->
  return sut.table.dominoes unless dominoes?
  sut.table.dominoes = dominoes

window.verify = (x, y) -> if not _.isEqual x, y then fail x, y,
  "Expected #{JSON.stringify x} to be #{JSON.stringify y}"

window.setup = (game) ->
  sut.table.dominoes = game.table if game.table?
  sut.player.dominoes = game.player if game.player?
  if game.oponents?
    _.each _.zip(sut.oponents, game.oponents), (x, y) ->
      x.dominoes = y

window.verify = (game) ->
  verify sut.table.dominoes, game.table if game.table?
