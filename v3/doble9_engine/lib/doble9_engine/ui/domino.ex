defmodule Doble9Engine.UI.Domino do

  import Ratatouille.View
  import Doble9Engine.UI.Assets
  import Doble9Engine.UI.Arranger

  def from x do %{domino: x.domino, axis: x.axis, left: x.left, top: x.top, show: x.show} end

  def render %{show: false, axis: axis, left: left, top: top} = domino do
    [
      render(%{frame: back(axis), left: left, top: top}),
    ]
  end

  def render %{domino: [h,t], axis: axis, left: left, top: top, selected: true} = domino do
    [
      render(%{frame: selected(axis), left: left, top: top}),
      render(%{head: number(h, axis), left: left, top: top, }),
      render(%{tail: number(t, axis), axis: axis, left: left, top: top, }),
    ]
  end

  def render %{domino: [h,t], axis: axis, left: left, top: top} = domino do
    [
      render(%{frame: frame(axis), left: left, top: top}),
      render(%{head: number(h, axis), left: left, top: top, }),
      render(%{tail: number(t, axis), axis: axis, left: left, top: top, }),
    ]
  end

  def render %{frame: frame, left: left, top: top} do
    render %{glyph: frame, width: width(frame), height: height(frame), left: left, top: top, bk: false}
  end

  def render %{head: head, left: left, top: top} do
    render %{glyph: head, width: width(head), height: height(head), left: left + 1, top: top + 1, bk: true}
  end

  def render %{tail: tail, left: left, top: top, axis: :x} do
    render %{glyph: tail, width: width(tail), height: height(tail), left: left + width(tail) + 2, top: top + 1, bk: true}
  end

  def render %{tail: tail, left: left, top: top, axis: :y} do
    render %{glyph: tail, width: width(tail), height: height(tail), left: left + 1, top: top + height(tail) + 2, bk: true}
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
