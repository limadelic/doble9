import Dominoes from '../src/dominoes'

describe 'Domino', ->
  game = new Dominoes

  it 'salida', (done) ->

    game.start ->
      expect(game.dominoes).toEqual []
      done()