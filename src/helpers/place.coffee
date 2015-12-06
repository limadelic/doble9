_ = require 'lodash'

Arranger = require './arranger'

DOMINO_WIDTH = 100
DOMINO_HEIGHT = 50
TABLE_HEIGHT = 1000
TABLE_WIDTH = 1000

class Place

  constructor: ({width, height}) ->
    [TABLE_WIDTH, TABLE_HEIGHT] = [width, height]
    @at = new Arranger

  set: (f) -> @at[f].apply @domino, [@another]
  layout: (f) -> @at[@another.layout][f].apply @domino, [@another]

  on: ({@table, @head, @domino}) -> @['on_' + @head]()

  on_start: ->
    @join_to  @
    @table.push @domino

  on_head: ->
    @join_to _.first(@table), 0
    @table.unshift @domino

  on_tail: ->
    @join_to _.last(@table), 1
    @table.push @domino

  join_to: (@another, side) ->
    @domino.reverse() if @domino[side] is @another[side]

    @set 'defaults'
    @set 'double'

    @['join_to_' + @head]()

    @set 'style'
    @set 'layout'
    @set 'inverted'

  join_to_start: => @set 'center'
  join_to_head: => @layout @next_in @head_path
  join_to_tail: => @layout @next_in @tail_path

  next_in: (path) ->
    _.find _.keys(path), (pos) =>
      @is_next path[pos]

  is_next: (pos) -> pos.apply @another

  head_path:
    up_left: ->
      (@pos is 'right up' and @layout is 'vertical') or
      (@pos is 'left' and @left < DOMINO_HEIGHT)
    left_up: ->
      (@pos is 'up right' and @layout is 'vertical') or
      (@pos is 'left' and @left < DOMINO_WIDTH)
    up_right: ->
      (@pos is 'left up' and @layout is 'vertical') or
      (@pos is 'right' and @left + @width > TABLE_WIDTH - DOMINO_HEIGHT)
    right_up: ->
      (@pos is 'up left' and @layout is 'vertical') or
      (@pos is 'right' and @left + @width > TABLE_WIDTH - DOMINO_WIDTH)
    left: -> @pos in ['center', 'left', 'left up', 'up left']
    right: -> @pos in ['right', 'right up', 'up right']

  tail_path:
    down_left: ->
      (@pos is 'right down' and @layout is 'vertical') or
      (@pos is 'left' and @left < DOMINO_HEIGHT)
    left_down: ->
      (@pos is 'down right' and @layout is 'vertical') or
      (@pos is 'left' and @left < DOMINO_WIDTH)
    down_right: ->
      (@pos is 'left down' and @layout is 'vertical') or
      (@pos is 'right' and @left + @width > TABLE_WIDTH - DOMINO_HEIGHT)
    right_down: ->
      (@pos is 'down left' and @layout is 'vertical') or
      (@pos is 'right' and @left + @width > TABLE_WIDTH - DOMINO_WIDTH)
    left: -> @pos in ['left', 'left down', 'down left']
    right: -> @pos in ['center', 'right', 'right down', 'down right']

module.exports = Place