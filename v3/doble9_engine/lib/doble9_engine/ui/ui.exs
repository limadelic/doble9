defmodule Doble9Engine.UI do
  @behaviour Ratatouille.App

  alias Doble9Engine.UI.Player

  import Ratatouille.View
  import Doble9Engine.Player, only: [login: 1, new_game: 2]
  import Doble9Engine.Helpers

  @game :calle8
  @player :mike

  def init %{window: window} do
    login @player
    new_game @player, @game
    %{window: window, game: the(@game)}
  end

  def render %{game: %{players: [player, right, top, left]}, window: %{height: height, width: width} = window} do
    view do
      canvas height: height, width: width do
        [
          Player.render(%{player: the(top), at: :top, window: window}),
          Player.render(%{player: the(left), at: :left, window: window}),
          Player.render(%{player: the(right), at: :right, window: window}),
          Player.render(%{player: the(player), at: :bottom, window: window}),
        ]
      end
    end
  end

end

Ratatouille.run Doble9Engine.UI
