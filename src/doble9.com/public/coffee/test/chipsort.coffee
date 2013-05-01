describe 'Chipsort', ->

  chipsort = {}

  before (done) ->
    require ['cs!sorter'], (Chipsort) ->
      chipsort = new Chipsort
      done()

  it 'should find the best suit', (done) ->

    chipsort.sort([[1,2],[0,9],[1,3]])
      .should.eql([[1,2],[1,3],[9,0]])

    done()
