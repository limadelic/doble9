defmodule Doble9Engine.UI.Player do

  alias Doble9Engine.UI.Domino
  import Map, only: [merge: 2]
  import Enum, only: [with_index: 1, map: 2]
  import Doble9Engine.UI.Assets
  import Doble9Engine.UI.Arranger

  def render %{domino: domino, player: %{turn: %{choices: choices}}, selected: selected} = player do
    Domino.render merge Domino.from(player), %{
      available: domino in (map choices, fn {domino,_} -> domino end),
      selected: selected == domino
    }
  end

  def render %{domino: _} = player do
    Domino.render Domino.from player
  end

  def render %{axis: axis, label_at: label_at, player: %{name: name, dominoes: dominoes}, show: show, top: top, left: left, dx: dx, dy: dy} = player do
    [
      Label.render(%{text: player, at: label_at, left: left, top: top}),
      for {domino, i} <- with_index dominoes do
        render merge player, %{domino: domino, axis: other(axis), left: left + i * dx, top: top + i * dy}
      end
    ]
  end

  def render %{axis: :x, player: %{name: name, dominoes: dominoes}, window: %{width: width}} = player do
    render merge player, %{dy: 0, dx: width(:y), left: div(width - (width(:y) * length(dominoes)), 2)}
  end

  def render %{axis: :y, player: %{dominoes: dominoes}, window: %{height: height, width: width}, left: left} = player do
    render merge player, %{dx: 0, dy: height(:x), top: top = div(height - (height(:x) * length(dominoes)), 2)}
  end

  def render %{at: :top} = player do
    render merge player, %{axis: :x, top: 0, label_at: :left}
  end

  def render %{at: :left} = player do
    render merge player, %{axis: :y, left: 0, label_at: {:top, :left}}
  end

  def render %{at: :right, window: %{width: width}} = player do
    render merge player, %{axis: :y, left: width - width(:x), label_at: {:top, :right}}
  end

  def render %{at: :bottom, window: %{height: height}} = player do
    render merge player, %{axis: :x, top: height - height(:y), label_at: :left}
  end

end
