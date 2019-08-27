defmodule Doble9Engine.UI.Player do

  alias Doble9Engine.UI.Domino
  import Map, only: [merge: 2]
  import Enum, only: [with_index: 1]
  import Doble9Engine.UI.Assets
  import Doble9Engine.UI.Arranger

  def render %{player: %{dominoes: dominoes}, axis: :x, window: %{width: width}, show: show, top: top} do
    left = div(width - (width(:y) * length(dominoes)), 2)
    for {domino, i} <- with_index dominoes do
      Domino.render %{domino: domino, show: show, axis: :y, left: left + i * width(:y), top: top}
    end
  end

  def render %{player: %{dominoes: dominoes}, axis: :y, window: %{height: height}, show: show, left: left} do
    top = div(height - (height(:x) * length(dominoes)), 2)
    for {domino, i} <- with_index dominoes do
      Domino.render %{domino: domino, show: show, axis: :x, left: left, top: top + i * height(:x)}
    end
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
