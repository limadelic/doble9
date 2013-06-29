describe 'Chipsort', ->

  new_sut 'staff/sorter'

  it 'should find the best suit', (done) ->

    sut.sort([[1,2],[9,0],[1,3]])
      .should.eql([[1,2],[1,3],[9,0]])

    done()
