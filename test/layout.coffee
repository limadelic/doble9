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
      pos: 'center'

  it 'places is horizontally if its capicua', ->

    start = sut.start table, [9,8]

    verify start,
      top: 475
      left: 550
      type: 'default'
      pos: 'center'

  it 'both sides of a double', ->

    start = sut.start table, [9,9]

    right = sut.after start, [9,8]
    verify right,
      top: 475
      left: 625
      pos: 'right'

    left = sut.before start, [9,7]
    verify left,
      top: 475
      left: 475
      pos: 'left'

  describe 'the head grows left up', ->

    head = {}
    verify_next = (pos) ->
      head = sut.before head, [0,1]
      verify head, pos

    it 'turns up when cannot fit height', ->

      head = domino
        top: 475
        left: 49
        pos: 'left'

      verify_next
        top: 375
        left: 49
        pos: 'up left'

      verify_next
        top: 375
        left: 99
        pos: 'right up'

      verify_next
        top: 375
        left: 199
        pos: 'right'

    it 'turns up when cannot fit width', ->

      head = domino
        top: 475
        left: 99
        pos: 'left'

      head = sut.before head, [9,8]
      verify head,
        top: 425
        left: 49
        pos: 'left up'

  describe 'the tail grows right down', ->
