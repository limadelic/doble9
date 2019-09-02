defmodule Doble9Engine.UI.Label do

  alias Ratatouille.View
  import Doble9Engine.UI.Assets, only: [width: 1, height: 1, char: 1, char_at: 3]

  @dy div(height(:y), 2) - div(height(:char), 2) + 1

  def render %{text: text} = label do
    glyphs = text |> String.to_charlist |> Enum.map(&(char &1))
    width = glyphs |> Enum.map(&(width &1)) |> Enum.reduce(0, &(&1 + &2))
    render Map.merge label, %{glyphs: glyphs, witdh: width}
  end

  def render %{at: :left, left: left, top: top, width: width} = label do
    render Map.merge label, %{left: left - width, top: top + @dy}
  end

  def render %{at: {:top, :left}, left: left, top: top} = label do
    render Map.merge label, %{left: left, top: top - @dy}
  end

  def render %{at: {:top, :right}, left: left, top: top, width: width} = label do
    render Map.merge label, %{left: left + width(:x) - width, top: top - @dy}
  end

  def render %{glyphs: [glyph], top: top, left: left} do
    [render(%{glyph: glyph, top: top, left: left})]
  end

  def render %{glyphs: [glyph|glyphs], top: top, left: left} = label do
    [
      render(%{glyph: glyph, top: top, left: left})|
      render(%{label | glyphs: glyphs, left: left + width(glyph)})
    ]
  end

  def render %{glyph: glyph, top: top, left: left} do
    for x <- 0..width(glyph) - 1, y <- 0..height(glyph) - 1 do
      View.canvas_cell %{char: char_at(glyph, x, y), x: left + x, y: top + y}
    end
  end

end
