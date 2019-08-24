defmodule Doble9Engine.UI do
  @behaviour Ratatouille.App

  alias Doble9Engine.{Player, Game, Helpers, Assets}
  import Ratatouille.View
  import Assets

  @game :calle8
  @player :mike

  def init state do
    Player.login @player
    Player.new_game @player, @game
    state
  end

  def render %{window: %{height: height, width: width}} do
    view do
      canvas height: height, width: width do
        [
          render(%{domino: [8,9], size: :xl, axis: :x, left: div(width, 2) - 18, top: div(height, 2) + 2}),
          render(%{domino: [9,9], size: :xl, axis: :y, left: div(width, 2), top: div(height, 2)}),
          render(%{domino: [9,7], size: :xl, axis: :x, left: div(width, 2) + 10, top: div(height, 2) + 2}),
        ]
      end
    end
  end

  def render %{domino: [h,t], size: size, axis: axis, left: left, top: top} = domino do
    [
      render(%{left: left, top: top, frame: frame(size, axis)}),
      render(%{left: left, top: top, head: number(h, size, axis)}),
      render(%{left: left, top: top, tail: number(t, size, axis), axis: axis}),
    ]
  end

  def render %{frame: frame, left: left, top: top} do
    {width, height} = measure frame
    render %{glyph: frame, width: width, height: height, left: left, top: top, bk: false}
  end

  def render %{head: head, left: left, top: top} do
    {width, height} = measure head
    render %{glyph: head, width: width, height: height, left: left + 1, top: top + 1, bk: true}
  end

  def render %{tail: tail, left: left, top: top, axis: :x} do
    {width, height} = measure tail
    render %{glyph: tail, width: width, height: height, left: left + width + 2, top: top + 1, bk: true}
  end

  def render %{tail: tail, left: left, top: top, axis: :y} do
    {width, height} = measure tail
    render %{glyph: tail, width: width, height: height, left: left + 1, top: top + height + 2, bk: true}
  end

  def render %{glyph: glyph, width: width, height: height, left: left, top: top, bk: bk} do
    for x <- 0..width - 1, y <- 0..height - 1 do
      render %{char: char_at(glyph, x, y), x: left + x, y: top + y, bk: bk}
    end
  end

  def render %{char: " ", bk: false} do end

  def render %{char: char, x: x, y: y} = cell do
    canvas_cell x: x, y: y, char: char
  end

end

Ratatouille.run Doble9Engine.UI
