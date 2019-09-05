defmodule Doble9Engine.UI.Game do

  alias Doble9Engine.UI.{Player, Table}

  import Doble9Engine.Helpers
  import Map, only: [merge: 2]

  def render %{game: %{finished: finished, players: [player, right, top, left]}} = game do
    show_dominoes = finished != nil
    [
      Player.render_at(:top, merge(game, %{player: the(top), show: show_dominoes})),
      Player.render_at(:left, merge(game, %{player: the(left), show: show_dominoes})),
      Player.render_at(:right, merge(game, %{player: the(right), show: show_dominoes})),
      Player.render_at(:bottom, merge(game, %{player: the(player), show: true})),
      Table.render(game),
    ]
  end

end
