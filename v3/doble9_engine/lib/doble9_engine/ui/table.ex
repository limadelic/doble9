defmodule Doble9Engine.UI.Table do

  alias Doble9Engine.UI.Domino
  import Enum, only: [with_index: 1]
  import Doble9Engine.UI.Assets
  import Doble9Engine.UI.Arranger
  import Doble9Engine.Helpers

  def render %{table: %{heads: []}} do  end

  def render %{table: %{dominoes: dominoes, start: start}, window: window} do
    {head, tail} = split dominoes, start
    start = center start, window

    [Domino.render(start)] ++
      render(%{head: head, dir: :left, prev: start, margins: margins(window)}) ++
      render(%{tail: tail, dir: :right, prev: start, margins: margins(window)})
  end

  def render %{head: [domino|dominoes], dir: :left, prev: prev, margins: margins} do
    domino = place :left, domino, prev
    [Domino.render(domino)] # | render(%{dominoes: dominoes, dir: :left, prev: domino, margins: margins})]
  end

  def render %{head: []} do [] end

  def render %{tail: [domino|dominoes], dir: :right, prev: prev, margins: margins} do
    domino = place :right, domino, prev
    [Domino.render(domino)] # | render(%{dominoes: dominoes, dir: :right, prev: domino, margins: margins})]
  end

  def render %{tail: []} do [] end

end
