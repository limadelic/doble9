defmodule Doble9Engine.UI.Domino do

  import Map, only: [merge: 2]
  import Ratatouille.View
  import Doble9Engine.UI.Assets
  import Doble9Engine.UI.Arranger

  def from x do %{domino: x[:domino], axis: x[:axis], left: x[:left], top: x[:top], show: x[:show]} end

  def cell x do %{char: x[:char], x: x[:x], y: x[:y], color: x[:color], attributes: x[:attributes]} end

  def render %{char: " ", bk: false} do end

  def render %{char: _} = domino do
    canvas_cell cell domino
  end

  def render %{glyph: glyph, left: left, top: top, bk: bk} = domino do
    for x <- 0..width(glyph) - 1, y <- 0..height(glyph) - 1 do
      render merge domino, %{char: char_at(glyph, x, y), x: left + x, y: top + y, bk: bk}
    end
  end

  def render %{frame: frame} = domino do
    render merge domino, %{glyph: frame, width: width(frame), height: height(frame), bk: false}
  end

  def render %{head: head, left: left, top: top} = domino do
    render merge domino, %{glyph: head, left: left + 1, top: top + 1, bk: true}
  end

  def render %{tail: tail, left: left, top: top, axis: :x} = domino do
    render merge domino, %{glyph: tail, left: left + width(tail) + 2, top: top + 1, bk: true}
  end

  def render %{tail: tail, left: left, top: top, axis: :y} = domino do
    render merge domino, %{glyph: tail, left: left + 1, top: top + height(tail) + 2, bk: true}
  end

  def render %{show: false, axis: axis} = domino do
    domino = merge domino, %{color: :default, attributes: []}
    [
      render(merge domino, %{frame: back(axis)}),
    ]
  end

  def render %{selected: true, domino: [h,t], axis: axis} = domino do
    domino = merge domino, %{color: :default, attributes: [:reverse]}
    [
      render(merge domino, %{frame: frame(axis)}),
      render(merge domino, %{head: number(h, axis)}),
      render(merge domino, %{tail: number(t, axis)}),
    ]
  end

  def render %{available: false, domino: [h,t], axis: axis} = domino do
    domino = merge domino, %{color: :red, attributes: []}
    [
      render(merge domino, %{frame: frame(axis)}),
      render(merge domino, %{head: number(h, axis)}),
      render(merge domino, %{tail: number(t, axis)}),
    ]
  end

  def render %{domino: [h,t], axis: axis} = domino do
    domino = merge domino, %{color: :default, attributes: []}
    [
      render(merge domino, %{frame: frame(axis)}),
      render(merge domino, %{head: number(h, axis)}),
      render(merge domino, %{tail: number(t, axis)}),
    ]
  end

end
