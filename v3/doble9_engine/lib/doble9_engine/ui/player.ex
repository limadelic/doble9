defmodule Doble9Engine.UI.Player do

  alias Doble9Engine.UI.Domino
  import Enum, only: [with_index: 1]
  import Doble9Engine.UI.Assets
  import Doble9Engine.UI.Arranger

  def render %{player: %{dominoes: dominoes}, at: :top, window: window, show: show} do
    left = div(window.width - (width(:y) * length(dominoes)), 2)

    for {domino, i} <- with_index dominoes do
      Domino.render %{domino: domino, show: show, axis: :y, left: left + i * width(:y), top: 0}
    end
  end

  def render %{player: %{dominoes: dominoes}, at: :left, window: window, show: show} do
    top = div(window.height - (height(:x) * length(dominoes)), 2)

    for {domino, i} <- with_index dominoes do
      Domino.render %{domino: domino, show: show, axis: :x, left: 0, top: top + i * height(:x)}
    end
  end

  def render %{player: %{dominoes: dominoes}, at: :right, window: window, show: show} do
    top = div(window.height - (height(:x) * length(dominoes)), 2)

    for {domino, i} <- with_index dominoes do
      Domino.render %{domino: domino, show: show, axis: :x, left: window.width - width(:x), top: top + i * height(:x)}
    end
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
