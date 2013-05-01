
describe 'Chipsort', ->

  sorter = {}

  before (done) ->
    require ['cs!sorter'], (Sorter) ->
      sorter = new Sorter
      done()

  it 'is cool', (done) ->
    sorter.name.should.equal 'jp'
    done()
