define ['underscore'], (_) ->

  class Sorter

    flip = (domino) ->
      [domino[1], domino[0]]

    build_buckets = (buckets, domino) ->
      buckets[domino[0]].count++
      buckets[domino[1]].count++ unless domino[0] is domino[1]
      buckets

    bucket_weight = (b) ->
      (10*b.count + b.val) * -1

    sort: (dominoes) ->
      sorted_dominoes = []
      key_index = (0 for [0..9])
      total = 0
      buckets = for i in [0..9]
        val: i
        count: 0

      _.reduce(dominoes, build_buckets, buckets)
      buckets = _.sortBy(buckets, bucket_weight)

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
