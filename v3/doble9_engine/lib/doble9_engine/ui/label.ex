defmodule Doble9Engine.UI.Label do

  def render %{text: text} do
    glyph = Glyph.text text
    render %{glyph: glyph, }
  end

end
