_ = require 'underscore'

describe 'Layout', ->

  new_sut 'staff/place'

  table =
    height: -> 1000
    width: -> 1000

  verify = (domino, values) ->
    for key, value of values
      domino[key].should.eql value

  domino = (opt) ->
    result = sut.start table, [9,8]
    result[key] = value for key, value of opt
    result

  it 'puts the start on the center', ->

    start = sut.start table, [9,9]

    verify start,
      top: 450
      left: 575
      type: 'double'

  it 'places is horizontally if its capicua', ->

    start = sut.start table, [9,8]

    verify start,
      top: 475
      left: 550
      type: 'default'

  it 'both sides of a double', ->

    start = sut.start table, [9,9]

    right = sut.after start, [9,8]
    verify right,
      top: 475
      left: 625

    left = sut.before start, [9,7]
    verify left,
      top: 475
      left: 475

  it 'the head grows left up', ->

    up = domino
      top: 475
      left: 49

    head = sut.before up, [9,8]
    verify head,
      top: 375
      left: 49
      going: 'up'

    left_up = domino
      top: 475
      left: 99

    head = sut.before left_up, [9,8]
    verify head,
      top: 425
      left: 49
      going: 'up'

  it.skip 'the head switches on next row', ->

    up = domino
      top: 375
      left: 49

    head = sut.before up, [9,8]
    verify head,
      top: 375
      left: 49


  it 'the tail grows right down', ->
