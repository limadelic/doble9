defmodule Doble9Engine.UI do
  @behaviour Ratatouille.App

  import Ratatouille.View
  alias Doble9Engine.{Player, Game, Helpers}

  @game :calle8
  @player :mike

  def init %{window: window} do
    Player.login @player
    Player.new_game @player, @game
    window
  end

  def render %{height: height, width: width} do
    view do
      panel height: :fill, padding: 0 do
        canvas height: height, width: width do
          domino [9,9], div(width, 2), div(height, 2), :vertical
        end
      end
    end
  end

  def domino [head,tail], x, y, :vertical do
    [
      canvas_cell(x: x, y: y - 2, char: "─"),
      canvas_cell(x: x - 1, y: y - 2, char: "─"),
      canvas_cell(x: x + 1, y: y - 2, char: "─"),
      canvas_cell(x: x - 2, y: y - 2, char: "┌"),
      canvas_cell(x: x + 2, y: y - 2, char: "┐"),

      canvas_cell(x: x, y: y - 1, char: "#{head}"),
      canvas_cell(x: x - 2, y: y - 1, char: "│"),
      canvas_cell(x: x + 2, y: y - 1, char: "│"),

      canvas_cell(x: x, y: y, char: "─"),
      canvas_cell(x: x - 1, y: y, char: "─"),
      canvas_cell(x: x + 1, y: y, char: "─"),
      canvas_cell(x: x + 2, y: y, char: "┤"),
      canvas_cell(x: x - 2, y: y, char: "├"),

      canvas_cell(x: x, y: y + 1, char: "#{tail}"),
      canvas_cell(x: x - 2, y: y + 1, char: "│"),
      canvas_cell(x: x + 2, y: y + 1, char: "│"),

      canvas_cell(x: x, y: y + 2, char: "─"),
      canvas_cell(x: x - 1, y: y + 2, char: "─"),
      canvas_cell(x: x + 1, y: y + 2, char: "─"),
      canvas_cell(x: x - 2, y: y + 2, char: "└"),
      canvas_cell(x: x + 2, y: y + 2, char: "┘"),
    ]
  end

end

Ratatouille.run Doble9Engine.UI
