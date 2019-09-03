defmodule Doble9Engine.UI.Label do

  import Ratatouille.View
  import Doble9Engine.UI.Assets, only: [width: 1, height: 1, char: 2, char_at: 3]

  @dy div(height(:y), 2) - div(height(:char), 2)

  def render %{text: text} = label do
    glyphs = "#{text}" |> String.slice(0..2) |> String.upcase |> String.to_charlist |> Enum.map(&(char :l, &1))
    width = glyphs |> Enum.map(&(width &1)) |> Enum.reduce(0, &(&1 + &2))
    render_at Map.merge label, %{glyphs: glyphs, width: width}
  end

  def render_at %{at: :left, left: left, top: top, width: width} = label do
    render_glyphs Map.merge label, %{left: left - width - 2, top: top}
  end

  def render_at %{at: :top, left: left, top: top, width: width} = label do
    render_glyphs Map.merge label, %{left: left, top: top - @dy - 2}
  end

  def render_glyphs %{glyphs: [glyph], top: top, left: left} do
    [render_glyph(%{glyph: glyph, top: top, left: left})]
  end

  def render_glyphs %{glyphs: [glyph|glyphs], top: top, left: left} = label do
    [
      render_glyph(%{glyph: glyph, top: top, left: left})|
      render_glyphs(%{label | glyphs: glyphs, left: left + width(glyph)})
    ]
  end

  def render_glyph %{glyph: glyph, top: top, left: left} do
    for x <- 0..width(glyph) - 1, y <- 0..height(glyph) - 1 do
      canvas_cell %{char: char_at(glyph, x, y), x: left + x, y: top + y}
    end
  end

end
