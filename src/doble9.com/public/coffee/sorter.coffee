define ['underscore'],
(_) ->
  class Sorter
    flip = (domino) ->
      [domino[1], domino[0]]

    sort: (dominoes) ->
      sorted_dominoes = []
      key_index = (0 for i in [0..9])
      total = 0
      buckets = ({ val: i, count: 0, } for i in [0..9])

      counts = _.reduce(dominoes, (memo, d) ->
        memo[d[0]].count++
        if (d[0] isnt d[1])
          memo[d[1]].count++
        memo
      , buckets) 

      buckets = _.sortBy(buckets, (b) ->
        (10*b.count + b.val) * -1
      )

      ((biggest) -> 
        key_index[biggest.val] = total
        total += biggest.count
      )(bucket) for bucket in buckets

      ((domino) ->
        one_idx = key_index[domino[0]]
        another_idx = key_index[domino[1]]
        if (one_idx < another_idx)
          sorted_dominoes[one_idx] = domino
          key_index[domino[0]]++
        else
          sorted_dominoes[another_idx] = flip(domino)
          key_index[domino[1]]++
      )(domino) for domino in dominoes

      sorted_dominoes
