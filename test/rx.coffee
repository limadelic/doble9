Rx = require 'rx'
fs = require 'fs'
O = Rx.Observable

puntil = (last, done) -> (x) ->
  p x
  done() if x is last

sum = (prev, cur) ->
  sum: prev.sum + cur
  count: prev.count + 1

avg = (x) -> x.sum / x.count

zero = sum: 0, count: 0

plus = (x) -> (y) -> x + y
pplus = (x) -> (y) -> p x + y
iplus = (i, x) -> O.interval(i).map plus x
ojson = (arr) -> O.from(arr).map JSON.parse

describe 'Rx', ->

  it 'hells o', ->
    O.just 'hello'
    .subscribe p

  it 'nodes', ->
    O.fromNodeCallback(fs.readdir)('.')
    .subscribe p

  it 'ranges', ->
    O.range(1, 3).subscribe p

  it 'merges', (done) ->
    O.merge(
      iplus 50, 'A'
      iplus 100, 'B'
    )
    .subscribe puntil 'A42', done

  it 'maps', ->
    O.range 1, 5
    .map (x) -> x * 2
    .subscribe p

  it 'reduces', ->
    O.range 1, 5
    .reduce (acc, x) -> acc + x
    .subscribe p

  it 'filters', ->
    O.range 1, 5
    .filter (x) -> x % 2 is 0
    .subscribe p

  it 'map/reduces', ->
    O.range 0, 5
    .reduce sum, zero
    .map avg
    .subscribe p

  it 'map/reduces lazily', (done) ->
    O.interval 1000
    .scan sum, zero
    .map avg
    .subscribe puntil 1.5, done

  it 's disposable', (done) ->
    tic = O.interval 1000
    x = tic.subscribe pplus 'sub x: '
    y = tic.subscribe pplus 'sub y: '
    setTimeout(
      ->
        p 'cancel y'
        y.dispose()
        done()
      2000
    )

  it 'promises', ->
    prom = new Promise (ok) -> setTimeout ok, 5000
    prom.then -> p 'fulfilled'
    O.fromPromise prom
    .subscribe -> p 'o fulfilled'
    .dispose()

  it 'try catch', ->
    ojson [
      '{}'
      'bad'
      '[]'
    ]
    .subscribe(
      p
      (e) -> p e.message
    )

  it 'try catch continue', ->
    ojson [
      '{}'
      'bad'
      '[]'
    ]
    .catch (x) -> O.return error: x.message
    .subscribe p
















