defmodule Doble9Engine.UI.Player do

  alias Doble9Engine.UI.Domino
  import Map, only: [merge: 2]
  import Enum, only: [with_index: 1]
  import Doble9Engine.UI.Assets
  import Doble9Engine.UI.Arranger

  def render %{axis: axis, player: %{dominoes: dominoes}, window: %{width: width}, show: show, top: top, left: left, dx: dx, dy: dy} do
    for {domino, i} <- with_index dominoes do
      Domino.render %{domino: domino, show: show, axis: other(axis), left: left + i * dx, top: top + i * dy}
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

  def render %{player: %{dominoes: dominoes, turn: %{choices: [first|_] = choices}}, at: :bottom, window: window} do
    left = div(window.width - (width(:y) * length(dominoes)), 2)
    top = window.height - height(:y)

    for {domino, i} <- with_index dominoes do
      Domino.render %{
        domino: domino, axis: :y, left: left + i * width(:y), top: top,
        selected: domino == first,
        available: domino in choices
      }
    end
  end

  def render %{player: %{dominoes: dominoes}, at: :bottom, window: window} do
    left = div(window.width - (width(:y) * length(dominoes)), 2)
    top = window.height - height(:y)

    for {domino, i} <- with_index dominoes do
      Domino.render %{domino: domino, axis: :y, left: left + i * width(:y), top: top}
    end
  end

#  def render %{dominoes: dominoes, axis: axis, left: left, top: top} = this do
#    for {domino, i} <- with_index dominoes do
#      Domino.render %{domino: domino, axis: axis, left: left.(this, i), top: top.(this, i)}
#    end
#  end

end
