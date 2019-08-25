defmodule Doble9Engine.UI do
  @behaviour Ratatouille.App

  alias Doble9Engine.UI.{Player, Table}

  import Ratatouille.View
  import Enum, only: [map: 2]
  import Doble9Engine.Player, only: [login: 1, new_game: 2, play: 2]
  import Doble9Engine.Helpers

  @game :calle8
  @player :mike
  @numbers 48..57

  def init %{window: window} do
    login @player
    new_game @player, @game
    %{window: window, game: the(@game), playing: nil}
  end

  def update(%{playing: nil} = game, {:event, %{ch: ch}}) when ch in @numbers do
    %{game | playing: ch - 48}
  end

  def update(%{playing: head} = game, {:event, %{ch: ch}}) when ch in @numbers do
    play @player, [head, ch - 48]
    :timer.sleep 10
    %{game | game: the(@game), playing: nil}
  end

  def update game, {_, x} do i x; game end

  def render %{game: %{table: table, players: [player, right, top, left]}, window: %{height: height, width: width} = window} do
    view do
      canvas height: height, width: width do
        [
          Table.render(%{table: table, window: window}),
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