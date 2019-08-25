defmodule Doble9Engine.UI.Game do

  alias Doble9Engine.UI.{Player, Table}

  import Doble9Engine.Helpers

  def render %{game: %{table: table, players: [player, right, top, left]}, window: %{height: height, width: width} = window} do
    [
      Player.render(%{player: the(top), at: :top, window: window}),
      Player.render(%{player: the(left), at: :left, window: window}),
      Player.render(%{player: the(right), at: :right, window: window}),
      Player.render(%{player: the(player), at: :bottom, window: window}),
      Table.render(%{table: table, window: window}),
    ]
  end

end