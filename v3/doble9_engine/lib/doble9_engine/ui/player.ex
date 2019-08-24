defmodule Doble9Engine.UI.Player do

  alias Doble9Engine.UI.Domino
  import Enum, only: [with_index: 1]
  import Doble9Engine.UI.Assets

  @size :xl

  def render %{player: %{dominoes: dominoes}, at: :top, window: window} do
    {width, height} = measure frame @size, :y
    left = div(window.width - (width * length(dominoes)), 2)

    for {domino, i} <- with_index dominoes do
      Domino.render %{domino: :back, size: @size, axis: :y, left: left + i * width, top: 0}
    end
  end

  def render %{player: %{dominoes: dominoes}, at: :left, window: window} do
    {width, height} = measure frame @size, :x
    top = div(window.height - (height * length(dominoes)), 2)

    for {domino, i} <- with_index dominoes do
      Domino.render %{domino: :back, size: @size, axis: :x, left: 0, top: top + i * height}
    end
  end

  def render %{player: %{dominoes: dominoes}, at: :right, window: window} do
    {width, height} = measure frame @size, :x
    top = div(window.height - (height * length(dominoes)), 2)

    for {domino, i} <- with_index dominoes do
      Domino.render %{domino: :back, size: @size, axis: :x, left: window.width - width, top: top + i * height}
    end
  end

  def render %{player: %{dominoes: dominoes}, at: :bottom, window: window} do
    {width, height} = measure frame @size, :y
    left = div(window.width - (width * length(dominoes)), 2)
    top = window.height - height

    for {domino, i} <- with_index dominoes do
      Domino.render %{domino: domino, size: @size, axis: :y, left: left + i * width, top: top}
    end
  end

end
