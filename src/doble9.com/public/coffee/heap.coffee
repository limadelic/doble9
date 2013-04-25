define [], ->
  class Heap
    items = []
    length = 0

    swap = (one, another) ->
      temp = items[one]
      items[one] = items[another]
      items[another] = temp

    swim = (idx) ->
      parent = Math.floor(idx/2)
      if (parent > 0 and items[idx].greater_than(items[parent]))
        swap(idx, parent)
        swim(parent)
      else
        idx

    sink = (idx) ->
      if (length is 0 or idx >= length + 1) 
        return

      left_idx = 2*idx
      right_idx = 2*idx+1
      left = if items[left_idx] then items[left_idx] else { greater_than: (()-> false) }
      right = if items[right_idx] then items[right_idx] else { greater_than: (()-> false) }

      if (left.greater_than(items[idx]) or right.greater_than(items[idx]))
        swap_idx = if right.greater_than(left) then right_idx else left_idx
        swap(idx, swap_idx)
        sink(swap_idx)

    is_empty: ->
      length is 0

    push: (item) ->
      items[++length] = item
      swim(length)

    pop: ->
      retVal = items[1]
      items[1] = items[length]
      items[length--] = null
      sink(1)
      retVal

    raw: ->
      items
