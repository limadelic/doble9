defmodule Doble9Engine.UI.Domino do

  import Ratatouille.View
  import Doble9Engine.UI.Assets

  def render %{domino: [h,t], size: size, axis: axis, left: left, top: top} = domino do
    [
      render(%{frame: frame(size, axis), left: left, top: top}),
      render(%{head: number(h, size, axis), left: left, top: top, }),
      render(%{tail: number(t, size, axis), axis: axis, left: left, top: top, }),
    ]
  end

  def render %{domino: :back, size: size, axis: axis, left: left, top: top} = domino do
    [
      render(%{frame: back(size, axis), left: left, top: top}),
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
