defmodule Doble9Engine.UI.Player do

  alias Doble9Engine.UI.Domino
  import Map, only: [merge: 2]
  import Enum, only: [with_index: 1]
  import Doble9Engine.UI.Assets
  import Doble9Engine.UI.Arranger

  def render %{domino: domino, player: %{turn: %{choices: choices}}} = player do
    Domino.render merge Domino.from(player), %{
      available: domino in choices,
      selected: length(choices) > 0 && domino == hd(choices)
    }
  end

  def render %{domino: _} = player do
    Domino.render Domino.from player
  end

  def render %{axis: axis, player: %{dominoes: dominoes}, show: show, top: top, left: left, dx: dx, dy: dy} = player do
    for {domino, i} <- with_index dominoes do
      render merge player, %{domino: domino, axis: other(axis), left: left + i * dx, top: top + i * dy}
    end
  end

  def render %{axis: :x, player: %{dominoes: dominoes}, window: %{width: width}} = player do
    render merge player, %{dy: 0, dx: width(:y), left: div(width - (width(:y) * length(dominoes)), 2)}
  end

  def render %{axis: :y, player: %{dominoes: dominoes}, window: %{height: height}} = player do
    render merge player, %{dx: 0, dy: height(:x), top: div(height - (height(:x) * length(dominoes)), 2)}
  end

  def render %{at: :top} = player do
    render merge player, %{axis: :x, top: 0}
  end

  def render %{at: :left} = player do
    render merge player, %{axis: :y, left: 0}
  end

  def render %{at: :right, window: %{width: width}} = player do
    render merge player, %{axis: :y, left: width - width(:x)}
  end

  def render %{at: :bottom, window: %{height: height}} = player do
    render merge player, %{axis: :x, top: height - height(:y)}
  end

end
