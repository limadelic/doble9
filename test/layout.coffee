describe 'Layout', ->

  new_sut 'staff/orderer'

  beforeEach ->
    sut.table =
      box:
        height: -> 1000
        width: -> 1000

  it 'puts the start on the center', ->

    sut.place [9,9]

    sut.top.should.eql 450
    sut.left.should.eql 575
    sut.type.should.eql 'double'

  it 'places is horizontally if its capicua', ->

    sut.place [9,8]

    sut.top.should.eql 475
    sut.left.should.eql 550
    sut.type.should.eql 'default'

