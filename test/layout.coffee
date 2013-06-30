_ = require 'underscore'

describe 'Layout', ->

  new_sut 'staff/orderer'

  beforeEach ->
    sut.table =
      box:
        height: -> 1000
        width: -> 1000

  setup = (dominoes) ->
    _.each dominoes, (x) -> sut.place x

  verify = (domino, values) ->
    for key, value of values
      domino[key].should.eql value

  it 'puts the start on the center', ->

    start = sut.place [9,9]

    verify start,
      top: 450
      left: 575
      type: 'double'

  it 'places is horizontally if its capicua', ->

    start = sut.place [9,8]

    verify start,
      top: 475
      left: 550
      type: 'default'

  it 'both sides of a double', ->

    sut.place [9,9]

    right = sut.place [9,8]
    verify right,
      top: 475
      left: 650
