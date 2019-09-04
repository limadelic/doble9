defmodule Doble9Engine.UI.Game do

  alias Doble9Engine.UI.{Player, Table}

  import Doble9Engine.Helpers

  def render %{game: %{finished: finished, table: table, players: [player, right, top, left]}, window: window, selected: selected, target: target} do
    show_dominoes = finished != nil
    [
      Player.render_at(:top, %{player: the(top), window: window, finished: finished, show: show_dominoes}),
      Player.render_at(:left, %{player: the(left), window: window, finished: finished, show: show_dominoes}),
      Player.render_at(:right, %{player: the(right), window: window, finished: finished, show: show_dominoes}),
      Player.render_at(:bottom, %{player: the(player), window: window, finished: finished, show: true, selected: selected}),
      Table.render(%{table: table, window: window, target: target}),
    ]
  end

end
