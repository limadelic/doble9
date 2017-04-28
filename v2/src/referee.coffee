module.exports = [[
  {
    when: ['play', head: undefined]
    head: -> domino[0]
    tail: -> domino[1]
  }
  {
    when: play: domino: -> [head, new_head]
    head: -> new_head
    then: play_head: domino: -> reverse
  }
  {
    when: play: domino: -> [tail, new_tail]
    tail: -> new_tail
    then: play_tail: -> { domino }
  }
  {
    when: play: domino: -> [new_head, head]
    head: -> new_head
    then: play_head: -> { domino }
  }
  {
    when: play: domino: -> [new_tail, tail]
    tail: -> new_tail
    then: play_tail: -> reverse
  }
]]