defmodule Doble9Engine.UI.Controller do

  import Ratatouille.Constants, only: [key: 1]
  import Enum, only: [map: 2]
  import Doble9Engine.Player, only: [login: 1, new_game: 2, play: 2, knock: 1]
  import Doble9Engine.Helpers

  @game :calle8
  @player :mike

  @numbers 48..57
  @up key(:arrow_up)
  @down key(:arrow_down)
  @left key(:arrow_left)
  @right key(:arrow_right)
  @space key(:space)
  @enter key(:enter)
  @play [@space, @up]
  @knock [@space, @enter]

  def init %{window: window} do
    login @player
    new_game @player, @game
    update %{window: window, game: nil, player: nil, playing: nil, selected: nil}
  end

  def update game do
    :timer.sleep 10
    %{game | game: the(@game), player: the(@player), playing: nil, selected: selected(the(@player))}
  end

  def update %{selected: selected, player: %{turn: %{choices: choices}}} = game, {_, %{key: @right}} do
    %{game | selected: next(choices, selected)}
  end

  def update %{selected: selected, player: %{turn: %{choices: choices}}} = game, {_, %{key: @left}} do
    %{game | selected: prev(choices, selected)}
  end

  def update(%{playing: nil} = game, {:event, %{ch: ch}}) when ch in @numbers do
    %{game | playing: ch - 48}
  end

  def update(%{playing: head} = game, {:event, %{ch: ch}}) when ch in @numbers do
    play @player, [head, ch - 48]
    update game
  end

  def update(%{selected: nil} = game, {:event, %{key: key}}) when key in @knock do
    knock @player
    update game
  end

  def update(%{selected: domino} = game, {:event, %{key: key}}) when domino != nil and key in @play do
    play @player, domino
    update game
  end

  def update game, {_, x} do i x; game end

  def selected %{turn: %{choices: [selected|_]}} do selected end
  def selected _ do nil end

end
