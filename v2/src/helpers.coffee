module.exports =

  shuffle: -> _.shuffle _.flatten
    for head in [0..9]
      for tail in [head..9]
        [head, tail]
