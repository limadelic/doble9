defmodule Doble9Engine.UI.Game do

  alias Doble9Engine.UI.{Player, Table}

  import Doble9Engine.Helpers

  def render %{game: %{finished: finished, table: table, players: [player, right, top, left]}, window: window} do
    show_dominoes = finished != nil
    [
      Player.render(%{player: the(top), at: :top, window: window, show: show_dominoes}),
      Player.render(%{player: the(left), at: :left, window: window, show: show_dominoes}),
      Player.render(%{player: the(right), at: :right, window: window, show: show_dominoes}),
      Player.render(%{player: the(player), at: :bottom, window: window, show: true}),
      Table.render(%{table: table, window: window}),
    ]
  end

end
