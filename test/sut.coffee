global.new_sut = (file) ->
  before (done) ->
    requirejs ["cs!#{file}"], (Sut) ->
      global.sut = new Sut
      done()

global.setup = (game) ->
  sut.table.dominoes = game.table ? []
  sut.player.dominoes = game.player ? []
  game.oponents ?= [[],[],[]]
  _.each _.zip(sut.oponents, game.oponents),
    (x) -> x[0].dominoes = x[1]

global.verify = (done, game) ->
  verify_arrays sut.table.dominoes, game.table if game.table?
  done()

global.verify_arrays = (x, y) -> if not _.isEqual x, y then fail x, y,
  "Expected #{JSON.stringify x} to be #{JSON.stringify y}"

