defmodule Doble9Engine.UI.Table do

  alias Doble9Engine.UI.Domino
  import Enum, only: [with_index: 1]
  import Doble9Engine.UI.Assets
  import Doble9Engine.Helpers

  @size :xl

  def render %{table: %{heads: []}} do  end

  def render %{table: %{dominoes: [[x,x] = start]}, window: window} do
    render %{start: start, axis: :y, window: window }
  end

  def render %{table: %{dominoes: [start]}, window: window} do
    render %{start: start, axis: :x, window: window }
  end

  def render %{start: domino, axis: axis, window: window} do
    {width, height} = measure frame @size, axis
    left = div(window.width, 2) - div(width, 2)
    top = div(window.height, 2) - div(height, 2)

    Domino.render %{domino: domino, size: @size, axis: axis, left: left, top: top}
  end

#  def render _ do end


end
