defmodule Doble9Engine.UI.Controller do

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

  def update(%{playing: head} = game, {:event, %{key: 32}}) do
    send @player, :play
    :timer.sleep 10
    %{game | game: the(@game), playing: nil}
  end

  def update game, {_, x} do i x; game end

end
