async = require 'async'
{ dispatch } = require '../src/helpers/redux'

describe 'doble9', ->

  sut = require '../src/stores/doble9'
  x = sut.getState

  verify = (expected_game, done) ->
    actual_game = sut.getState()
    actual_game[k].should.eql v for k, v of expected_game
    done?()

  beforeEach (done) ->
    dispatch start: null, done

  it 'defaults players', (done) ->
    setTimeout(
      ->
        { players, dominoes } = x()
        p players
        dominoes.length.should.eql 15
        done()
      100
    )


  it 'starts', ->
    x().dominoes.length.should.eql 55
    verify table: []

  it 'salida', (done) ->

    dispatch play: domino: [9, 9], ->
      verify table: [[9,9]], done

  it 'doesnt allow forros', (done) ->

    dispatch play: domino: [9, 9], ->
      dispatch play: domino: [8, 8], ->
        verify table: [[9,9]], done

  it 'plays at tail', (done) ->

    dispatch play: domino: [9, 9], ->
      dispatch play: domino: [9, 8], ->
        verify table: [[9,9],[9,8]], done

  it 'plays at head', (done) ->

    dispatch play: domino: [9, 9], ->
      dispatch play: domino: [9, 8], ->
        dispatch play: domino: [9, 7], ->
          verify table: [[7,9],[9,9],[9,8]], done
    
  it 'picks dominoes', (done) ->
    
    dispatch pick: player: 'player', domino: [9,9], ->
      dispatch pick: player: 'player', domino: [8,8], ->
        dispatch pick: player: 'another', domino: [0,0], ->
          sut.getState().players.player.dominoes.should.eql [[9,9],[8,8]]
          done()

  it 'allows to play', (done) ->

    dispatch pick: player: 'player', domino: [9,9], ->
      dispatch play: player: 'player', domino: [9,9], ->
        sut.getState().table.should.eql [[9,9]]
        sut.getState().players.player.dominoes.should.eql []
        done()

  it 'responds', (done) ->

    dispatch pick: player: 'player', domino: [9,9], ->
      dispatch pick: player: 'left', domino: [9,8], ->
        dispatch play: player: 'player', domino: [9,9], ->
          setTimeout(
            -> verify table: [[9,9],[9,8]], done
            10
          )

  it 'picks right domino', (done) ->

    dispatch pick: player: 'player', domino: [9,9], ->
      dispatch pick: player: 'left', domino: [0,0], ->
        dispatch pick: player: 'left', domino: [9,8], ->
          dispatch play: player: 'player', domino: [9,9], ->
            setTimeout(
              -> verify table: [[9,9],[9,8]], done
              10
            )


describe.skip 'Play', ->

  new_sut 'models/game'

  beforeEach ->
    sut.fx =
      show: ->
      enable: ->

  it 'salida', ->

    setup player: [[9,9]]
    sut.player_plays [9,9]
    verify table: [[9,9]]

  it 'dont allow forros', ->

    setup table: [[0,0]]
    sut.player_plays [9,9]
    verify table: [[0,0]]

  it 'use first number', ->

    setup
      table: [[1,9],[9,0]]
      player: [[1,0]]

    sut.player_plays [0,1]

    verify table: [[1,9],[9,0],[0,1]]

  it 'computer responds', ->

    setup
      player: [[9,9],[0,0]]
      oponents: [
        [[9,8],[1,1]]
        [[8,8],[2,2]]
        [[9,7],[3,3]]
      ]

    sut.player_plays [9,9]

    verify table: [[7,9],[9,9],[9,8],[8,8]]

  it 'knock on table', ->

    setup
      table: [[9,9]]
      player: [[0,0]]
      oponents: [
        [[8,8]]
        [[7,7]]
        [[9,8]]
      ]

    sut.knock()

    verify table: [[9,9],[9,8]]

  it 'se tranco!!', ->

    setup
      table: [[9,9]]
      player: [[0,0]]
      oponents: [
        [[8,8]]
        [[7,7]]
        [[6,6]]
      ]

    sut.knock()

    sut.done().should.be.true
    sut.stucked.should.be.true
    verify table: [[9,9]]

  it 'me pegue!!', ->

    setup
      table: [[9,9]]
      player: [[9,0]]
      oponents: [
        [[9,8]]
        [[7,7]]
        [[6,6]]
      ]

    sut.player_plays [9,0]

    sut.done().should.be.true
    sut.winner.should.equal sut.player
    verify table: [[9,9],[9,0]]
