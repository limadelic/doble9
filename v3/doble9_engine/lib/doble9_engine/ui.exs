defmodule Doble9Engine.UI do
  @behaviour Ratatouille.App

  alias Doble9Engine.{Player, Game, Helpers}
  import Ratatouille.View

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
          domino([7,9], div(width, 2) - 9, div(height, 2) + 1, domino(:l,:x)),
          domino([9,9], div(width, 2), div(height, 2), domino(:l,:y)),
          domino([9,8], div(width, 2) + 5, div(height, 2) + 1, domino(:l,:x)),
        ]
      end
    end
  end

  def domino domino, left, top, [row|_] = glyph do
    for x <- 0..String.length(row) - 1, y <- 0..length(glyph) - 1 do
      canvas_cell x: left + x, y: top + y, char: domino_char(domino, x, y, glyph)
    end
  end

  def domino_char domino, x, y, glyph do h_or_t domino, String.at(Enum.at(glyph, y), x) end
  def h_or_t [h,_], "h" do "#{h}" end
  def h_or_t [_,t], "t" do "#{t}" end
  def h_or_t _, c do c end

  def domino :l, :y do
    [
      "┌───┐",
      "│ h │",
      "├───┤",
      "│ t │",
      "└───┘"
    ]
  end

  def domino :l, :x do
    [
      "┌───┬───┐",
      "│ h │ t │",
      "└───┴───┘",
    ]
  end

  def domino :m, :y do
    [
      "┌─┐",
      "│h│",
      "├─┤",
      "│t│",
      "└─┘"
    ]
  end

  def domino :m, :x do
    [
      "┌─┬─┐",
      "│h│t│",
      "└─┴─┘",
    ]
  end

  def domino :s, :y do
    [
      "h",
      "─",
      "t",
    ]
  end

  def domino :s, :x do
    [
      "h│t",
    ]
  end

end

Ratatouille.run Doble9Engine.UI
