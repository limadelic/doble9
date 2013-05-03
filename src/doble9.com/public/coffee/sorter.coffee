define ['underscore'], (_) ->

  class Sorter

    sort: (dominoes) ->
      @sorted_dominoes = []
      @key_index = (0 for [0..9])
      @total = 0

      buckets = @build_buckets dominoes

      @biggest bucket for bucket in buckets

      @sort_domino domino for domino in dominoes

      _.compact @sorted_dominoes

    biggest: (bucket) ->
      @key_index[bucket.val] = @total
      @total += bucket.count

    sort_domino: (domino) ->
      one_idx = @key_index[domino[0]]
      another_idx = @key_index[domino[1]]
      if (one_idx < another_idx)
        @sorted_dominoes[one_idx] = domino
        @key_index[domino[0]]++
      else
        @sorted_dominoes[another_idx] = flip(domino)
        @key_index[domino[1]]++

    flip = (domino) ->
      [domino[1], domino[0]]

    build_buckets: (dominoes) ->
      buckets = for i in [0..9]
        val: i
        count: 0

      for domino in dominoes
        buckets[domino[0]].count++
        buckets[domino[1]].count++ unless domino[0] is domino[1]

      _.sortBy buckets, (x) -> (10 * x.count + x.val) * -1
