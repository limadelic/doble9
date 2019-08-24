defmodule Doble9Engine.UI do
  @behaviour Ratatouille.App

  alias Doble9Engine.{Player, Game, Helpers}
  import Ratatouille.View
  import Doble9Engine.UI.Assets

  @game :calle8
  @player :mike

  def init %{window: window} do
    Player.login @player
    Player.new_game @player, @game
    window
  end

  def render %{height: height, width: width} do
    view do
      canvas height: height, width: width do
        [
          domino([9,9], {:xl, :y, div(width, 2), div(height, 2)}),
        ]
      end
    end
  end

  def domino [h, t], style do
    [
      glyph(:frame, style),
      glyph({:number, h}, style),
      glyph({:number, t}, style),
    ]
  end

  def glyph :frame, {size, axis, left, top} do
    frame size, axis
    |> measured
    |> glyph_cells(left, top)
  end

  def measured [row|_] = glyph do
    %{glyph: glyph, width: String.length(row), height: length(glyph)}
  end

  def glyph_cells glyph, left, top,

  def glyph domino, left, top, [row|_] = glyph do
    for x <- 0..String.length(row) - 1, y <- 0..length(glyph) - 1 do
      canvas_cell x: left + x, y: top + y, char: domino_char(domino, x, y, glyph)
    end
  end

  def domino_char domino, x, y, glyph do h_or_t domino, String.at(Enum.at(glyph, y), x) end
  def h_or_t [h,_], "h" do "#{h}" end
  def h_or_t [_,t], "t" do "#{t}" end
  def h_or_t _, c do c end

end

Ratatouille.run Doble9Engine.UI
