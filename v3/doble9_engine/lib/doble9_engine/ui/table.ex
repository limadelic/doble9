defmodule Doble9Engine.UI.Table do

  alias Doble9Engine.UI.Domino
  import Enum, only: [with_index: 1]
  import Doble9Engine.UI.Assets
  import Doble9Engine.UI.Arranger
  import Doble9Engine.Helpers

  @padding 32

  def render %{table: %{heads: []}} do  end

  def render %{table: %{dominoes: dominoes, start: start}, window: window} do
    {head, tail} = split dominoes, start
    start = center start, window

    [Domino.render(start)] ++
      head(%{dominoes: head, pos: :left, prev: start, margins: margins(window)}) ++
      render(%{tail: tail, pos: :right, prev: start, margins: margins(window)})
  end

  def head %{dominoes: []} do [] end

  def head(%{dominoes: [domino|dominoes], pos: {:left, :head}, prev: prev, margins: margins}) do
    domino = place {:left, :head}, :x, domino, prev
    [Domino.render(domino) | head(%{dominoes: dominoes, pos: :left, prev: domino, margins: margins})]
  end

  def head(%{dominoes: [domino|dominoes], pos: {:top, :tail}, prev: prev, margins: margins}) do
    domino = place {:top, :tail}, :y, domino, prev
    [Domino.render(domino) | head(%{dominoes: dominoes, pos: {:left, :head}, prev: domino, margins: margins})]
  end

  def head(%{dominoes: [[h,t]|dominoes], pos: :right, prev: %{left: left, width: width} = prev, margins: %{right: right_margin} = margins})
      when left + width + @padding >= right_margin do
    domino = place :right, :x, [t,h], prev
    [Domino.render(domino) | head(%{dominoes: dominoes, pos: {:top, :tail}, prev: domino, margins: margins})]
  end
  
  def head %{dominoes: [[h,t]|dominoes], pos: :right, prev: prev, margins: margins} do
    domino = place :right, [t,h], prev
    [Domino.render(domino) | head(%{dominoes: dominoes, pos: :right, prev: domino, margins: margins})]
  end

  def head(%{dominoes: [[h,t]|dominoes], pos: {:right, :head}, prev: prev, margins: margins}) do
    domino = place {:right, :head}, :x, [t,h], prev
    [Domino.render(domino) | head(%{dominoes: dominoes, pos: :right, prev: domino, margins: margins})]
  end

  def head(%{dominoes: [domino|dominoes], pos: {:top, :head}, prev: prev, margins: margins}) do
    domino = place {:top, :head}, :y, domino, prev
    [Domino.render(domino) | head(%{dominoes: dominoes, pos: {:right, :head}, prev: domino, margins: margins})]
  end

  def head(%{dominoes: [domino|dominoes], pos: :left, prev: %{left: left} = prev, margins: %{left: left_margin} = margins})
      when left - @padding <= left_margin do
    domino = place :left, :x, domino, prev
    [Domino.render(domino) | head(%{dominoes: dominoes, pos: {:top, :head}, prev: domino, margins: margins})]
  end

  def head %{dominoes: [domino|dominoes], pos: :left, prev: prev, margins: margins} do
    domino = place :left, domino, prev
    [Domino.render(domino) | head(%{dominoes: dominoes, pos: :left, prev: domino, margins: margins})]
  end

  def render(%{tail: [domino|dominoes], pos: :right, prev: %{left: left, width: width} = prev, margins: %{right: right_margin} = margins})
      when left + width + @padding >= right_margin do
    domino = place :right, :x, domino, prev
    [Domino.render(domino) | render(%{tail: dominoes, pos: {:down, :tail}, prev: domino, margins: margins})]
  end

  def render %{tail: [domino|dominoes], pos: :right, prev: prev, margins: margins} do
    domino = place :right, domino, prev
    [Domino.render(domino) | render(%{tail: dominoes, pos: :right, prev: domino, margins: margins})]
  end

  def render(%{tail: [domino|dominoes], pos: {:down, :tail}, prev: prev, margins: margins}) do
    domino = place {:down, :tail}, :y, domino, prev
    [Domino.render(domino) | render(%{tail: dominoes, pos: {:left, :tail}, prev: domino, margins: margins})]
  end

  def render(%{tail: [[h,t]|dominoes], pos: {:left, :tail}, prev: prev, margins: margins}) do
    domino = place {:left, :tail}, :x, [t,h], prev
    [Domino.render(domino) | render(%{tail: dominoes, pos: :left, prev: domino, margins: margins})]
  end

  def render(%{tail: [[h,t]|dominoes], pos: :left, prev: %{left: left} = prev, margins: %{left: left_margin} = margins})
      when left - @padding <= left_margin do
    domino = place :left, :x, [t,h], prev
    [Domino.render(domino) | render(%{tail: dominoes, pos: {:down, :head}, prev: domino, margins: margins})]
  end

  def render %{tail: [[h,t]|dominoes], pos: :left, prev: prev, margins: margins} do
    domino = place :left, [t,h], prev
    [Domino.render(domino) | render(%{tail: dominoes, pos: :left, prev: domino, margins: margins})]
  end

  def render(%{tail: [domino|dominoes], pos: {:down, :head}, prev: prev, margins: margins}) do
    domino = place {:down, :head}, :y, domino, prev
    [Domino.render(domino) | render(%{tail: dominoes, pos: {:right, :tail}, prev: domino, margins: margins})]
  end

  def render(%{tail: [domino|dominoes], pos: {:right, :tail}, prev: prev, margins: margins}) do
    domino = place {:right, :tail}, :x, domino, prev
    [Domino.render(domino) | render(%{tail: dominoes, pos: :right, prev: domino, margins: margins})]
  end

  def render %{tail: []} do [] end

end
