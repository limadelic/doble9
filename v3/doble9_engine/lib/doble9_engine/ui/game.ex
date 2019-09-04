defmodule Doble9Engine.UI.Game do

  alias Doble9Engine.UI.{Player, Table}

  import Doble9Engine.Helpers

  def render %{game: %{finished: finished, table: table, players: [player, right, top, left]}, window: window, selected: selected, target: target} do
    show_dominoes = finished != nil
    [
      Player.render(%{player: the(top), at: :top, window: window, finished: finished, show: show_dominoes}),
      Player.render(%{player: the(left), at: :left, window: window, finished: finished, show: show_dominoes}),
      Player.render(%{player: the(right), at: :right, window: window, finished: finished, show: show_dominoes}),
      Player.render(%{player: the(player), at: :bottom, window: window, finished: finished, show: true, selected: selected}),
      Table.render(%{table: table, window: window, target: target}),
    ]
  end

end
