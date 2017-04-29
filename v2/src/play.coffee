module.exports = [[
  {
    when: head: undefined
    then: [
      -> [head, tail] = domino
      'play_head'
    ]
  }
  {
    when: domino: -> [head, next]
    head: -> next
    then: play_head: domino: -> reverse
  }
  {
    when: domino: -> [tail, next]
    tail: -> next
    then: play_tail: -> { domino }
  }
  {
    when: domino: -> [next, head]
    head: -> next
    then: play_head: -> { domino }
  }
  {
    when: domino: -> [next, tail]
    tail: -> next
    then: play_tail: -> reverse
  }
]]