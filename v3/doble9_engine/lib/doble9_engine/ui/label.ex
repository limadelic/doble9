defmodule Doble9Engine.UI.Label do

  import Ratatouille.View
  import Doble9Engine.UI.Assets, only: [width: 1, height: 1, char: 2, char_at: 3]

  def render %{text: text} = label do
    glyphs = "#{text}" |> String.upcase |> String.to_charlist |> Enum.map(&(char :l, &1))
    width = glyphs |> Enum.map(&(width &1)) |> Enum.reduce(0, &(&1 + &2))
    render_at Map.merge label, %{glyphs: glyphs, width: width}
  end

  def render_at %{at: :left, width: width, ref: %{left: left, top: top, height: height}} = label do
    render_glyphs Map.merge label, %{left: left - width - 2, top: center(top, height, height(:char))}
  end

  def render_at %{at: :right, ref: %{left: left, top: top, width: width, height: height}} = label do
    render_glyphs Map.merge label, %{left: left + width + 2, top: center(top, height, height(:char))}
  end

  def render_at %{at: :top, width: width, ref: %{left: left, top: top, width: ref_width}} = label do
    render_glyphs Map.merge label, %{left: center(left, ref_width, width), top: top - height(:char)}
  end

  def render_at %{at: :bottom, width: width, ref: %{left: left, top: top, width: ref_width, height: ref_height}} = label do
    render_glyphs Map.merge label, %{left: center(left, ref_width, width), top: top + ref_height}
  end

  def render_glyphs %{glyphs: [glyph], top: top, left: left} = label do
    [render_glyph(Map.merge label, %{glyph: glyph, top: top, left: left})]
  end

  def render_glyphs %{glyphs: [glyph|glyphs], top: top, left: left} = label do
    [
      render_glyph(Map.merge label, %{glyph: glyph, top: top, left: left})|
      render_glyphs(%{label | glyphs: glyphs, left: left + width(glyph)})
    ]
  end

  def render_glyph %{selected: true, glyph: glyph, top: top, left: left} = label do
    for x <- 0..width(glyph) - 1, y <- 0..height(glyph) - 1 do
      canvas_cell %{char: char_at(glyph, x, y), x: left + x, y: top + y, attributes: [:reverse]}
    end
  end

  def render_glyph %{glyph: glyph, top: top, left: left} = label do
    for x <- 0..width(glyph) - 1, y <- 0..height(glyph) - 1 do
      canvas_cell %{char: char_at(glyph, x, y), x: left + x, y: top + y}
    end
  end

  def center anchor, ref_size, size do
    anchor + div(ref_size, 2) - div(size, 2)
  end

end
