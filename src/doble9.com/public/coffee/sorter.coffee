define ['underscore', 'cs!heap'],
(_, Heap) ->
  class Sorter
    sort: (dominoes) ->
      sorted_dominoes = []
      key_index = (0 for i in [0..9])
      heap = new Heap
      total = 0
      buckets = ({ 
        val: i, 
        count: 0, 
        greater_than: (another) ->
          @count > another.count or (@count is another.count && @val > another.val)
      } for i in [0..9])

      counts = _.reduce(dominoes, (memo, d) ->
        memo[d[0]].count++
        if (d[0] isnt d[1])
          memo[d[1]].count++
        memo
      , buckets) 

      heap.push item for item in buckets

      ((-> 
        biggest = heap.pop()
        key_index[biggest.val] = total
        total += biggest.count)()
      ) until heap.is_empty()

      ((domino) ->
        one_idx = key_index[domino[0]]
        another_idx = key_index[domino[1]]
        if (one_idx < another_idx)
          sorted_dominoes[one_idx] = domino
          key_index[domino[0]]++
        else
          sorted_dominoes[another_idx] = domino
          key_index[domino[1]]++
      )(domino) for domino in dominoes

      sorted_dominoes
