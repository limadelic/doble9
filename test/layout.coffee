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
      left: 475
      type: 'double'
      pos: 'center'

  it 'places is horizontally if its capicua', ->

    start = sut.start table, [9,8]

    verify start,
      top: 475
      left: 450
      type: 'default'
      pos: 'center'

  it 'both sides of a double', ->

    start = sut.start table, [9,9]

    right = sut.after start, [9,8]
    verify right,
      top: 475
      left: 525
      pos: 'right'

    left = sut.before start, [9,7]
    verify left,
      top: 475
      left: 375
      pos: 'left'

  describe 'the head grows left up', ->

    head = {}
    verify_next = (pos) ->
      head = sut.before head, [0,1]
      verify head, pos

    it 'turns up left when cannot fit height', ->

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
        inverted: true

      verify_next
        top: 375
        left: 199
        pos: 'right'
        inverted: true

    it 'turns left up when cannot fit width', ->

      head = domino
        top: 475
        left: 99
        pos: 'left'

      verify_next
        top: 425
        left: 49
        pos: 'left up'

      verify_next
        top: 375
        left: 49
        pos: 'up right'
        inverted: true

      verify_next
        top: 375
        left: 149
        pos: 'right'
        inverted: true

    it 'turns up right when cannot fit height', ->

      head = domino
        top: 375
        left: 851
        width: 100
        pos: 'right'
        inverted: true

      verify_next
        top: 275
        left: 901
        pos: 'up right'
        layout: 'vertical'
        inverted: false

      verify_next
        top: 275
        left: 801
        pos: 'left up'
        layout: 'horizontal'

      verify_next
        top: 275
        left: 701
        pos: 'left'

    it 'turns right up when cannot fit width', ->

      head = domino
        top: 375
        left: 801
        width: 100
        pos: 'right'
        inverted: true

      verify_next
        top: 325
        left: 901
        pos: 'right up'
        layout: 'vertical'
        inverted: false

      verify_next
        top: 275
        left: 851
        pos: 'up left'
        layout: 'horizontal'

      verify_next
        top: 275
        left: 751
        pos: 'left'

  describe 'the tail grows right down', ->

    tail = {}
    verify_next = (expected_values) ->
      tail = sut.after tail, [0,1]
      verify tail, expected_values

    it 'turns down right when cannot fit height', ->

      tail = domino
        top: 475
        left: 851
        width: 100
        pos: 'right'

      verify_next
        top: 525
        left: 901
        pos: 'down right'
        layout: 'vertical'

      verify_next
        top: 575
        left: 801
        pos: 'left down'

      verify_next
        top: 575
        left: 701
        pos: 'left'

    it 'turns right down when cannot fit width', ->

      tail = domino
        top: 475
        left: 801
        width: 100
        pos: 'right'

      verify_next
        top: 475
        left: 901
        pos: 'right down'
        layout: 'vertical'

      verify_next
        top: 575
        left: 851
        pos: 'down left'

      verify_next
        top: 575
        left: 751
        pos: 'left'

    it 'turns down left when cannot fit height', ->

      tail = domino
        top: 575
        left: 49
        pos: 'left'

      verify_next
        top: 625
        left: 49
        pos: 'down left'

      verify_next
        top: 675
        left: 99
        pos: 'right down'
        inverted: true

      verify_next
        top: 675
        left: 199
        pos: 'right'
        inverted: true

    it 'turns left down when cannot fit width', ->

      tail = domino
        pos: 'left'
        top: 575
        left: 99

      verify_next
        pos: 'left down'
        top: 575
        left: 49

      verify_next
        pos: 'down right'
        top: 675
        left: 49
        inverted: true

      verify_next
        pos: 'right'
        top: 675
        left: 149
        inverted: true
