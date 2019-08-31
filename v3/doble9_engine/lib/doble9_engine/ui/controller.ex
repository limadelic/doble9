defmodule Doble9Engine.UI.Controller do

  import Ratatouille.Constants, only: [key: 1]
  import Enum, only: [map: 2, find: 2]
  import Doble9Engine.Player, only: [login: 1, new_game: 2, play: 3, knock: 1]
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
  @switch_target [@up, @down]

  def init %{window: window} do
    login @player
    new_game @player, @game
    update %{window: window, game: nil, player: nil, playing: nil, selected: nil, target: nil}
  end

  def update old do
    :timer.sleep 10
    with game <- the(@game), player <- the(@player), {selected, target} <- select_target(player.turn.choices),
      do: %{old | game: game, player: player, playing: nil, selected: selected, target: target}
  end

  def update %{selected: selected, player: %{turn: %{choices: choices}}, game: %{table: table}} = game, {_, %{key: @right}} do
    {selected, target} = choices |> dominoes |> next(selected) |> select_target(choices)
    %{game | selected: selected, target: target}
  end

  def update %{selected: selected, player: %{turn: %{choices: choices}}, game: %{table: table}} = game, {_, %{key: @left}} do
    {selected, target} = choices |> dominoes |> prev(selected) |> select_target(choices)
    %{game | selected: selected, target: target(selected, table.heads)}
  end

  def update(%{playing: nil} = game, {_, %{ch: ch}}) when ch in @numbers do
    %{game | playing: ch - 48}
  end

  def update(%{playing: head} = game, {_, %{ch: ch}}) when ch in @numbers do
#    play @player, [head, ch - 48]
#    update game
  end

  def update(%{selected: nil} = game, {_, %{key: key}}) when key in @knock do
    knock @player
    update game
  end

  def update(%{target: target, game: %{table: %{heads: [x,x]}}} = game, {:event, %{key: key}}) when target != nil and key in @switch_target do
    %{game | target: switch(target)}
  end

  def update(%{target: target, selected: [x,y], game: %{table: %{heads: [x,y]}}} = game, {:event, %{key: key}}) when key in @switch_target do
    %{game | target: switch(target)}
  end

  def update(%{target: target, selected: [x,y], game: %{table: %{heads: [y,x]}}} = game, {:event, %{key: key}}) when key in @switch_target do
    %{game | target: switch(target)}
  end

  def update(%{selected: domino} = game, {:event, %{key: key}}) when domino != nil and key in @play do
#    play @player, domino
#    update game
  end

  def update(%{selected: domino, target: target} = game, {:event, %{key: key}}) when domino != nil and key in @play do
    play @player, domino, target
    update game
  end

  def update game, _ do game end

  def dominoes choices do map choices, fn {domino,_} -> domino end end

  def select_target domino, choices do select_target [find(choices, fn {x,_} -> x == domino end)] end
  def select_target [{selected,[target|_]}|_] do {selected, target} end
  def select_target [{selected,target}|_] do {selected, target} end
  def select_target _ do {nil, nil} end

end
