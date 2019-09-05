defmodule Doble9Engine.UI.Table do

  alias Doble9Engine.Target
  alias Doble9Engine.UI.Domino
  import Enum, only: [map: 2]
  import Doble9Engine.UI.Arranger

  @padding 32

  def render %{game: %{table: %{heads: []}}} do  end

  def render %{game: %{table: %{dominoes: dominoes, start: start}}, window: window, target: target} do
    {head, tail} = split dominoes, start
    start = center start, window
    head = head %{dominoes: head, pos: :left, prev: start, margins: margins(window)}
    tail = tail %{dominoes: tail, pos: :right, prev: start, margins: margins(window)}
    target = Target.find target, start, head, tail

    [Domino.render start] ++
       map(head, &(Domino.render &1)) ++
       map(tail, &(Domino.render &1)) ++
       [Domino.render target]
  end

  def head %{dominoes: []} do [] end

  def head(%{dominoes: [domino|dominoes], pos: {:left, :head}, prev: prev, margins: margins}) do
    domino = place {:left, :head}, :x, domino, prev
    [domino | head(%{dominoes: dominoes, pos: :left, prev: domino, margins: margins})]
  end

  def head(%{dominoes: [domino|dominoes], pos: {:top, :tail}, prev: prev, margins: margins}) do
    domino = place {:top, :tail}, :y, domino, prev
    [domino | head(%{dominoes: dominoes, pos: {:left, :head}, prev: domino, margins: margins})]
  end

  def head(%{dominoes: [[h,t]|dominoes], pos: :right, prev: %{left: left, width: width} = prev, margins: %{right: right_margin} = margins})
      when left + width + @padding >= right_margin do
    domino = place :right, :x, [t,h], prev
    [domino | head(%{dominoes: dominoes, pos: {:top, :tail}, prev: domino, margins: margins})]
  end
  
  def head %{dominoes: [[h,t]|dominoes], pos: :right, prev: prev, margins: margins} do
    domino = place :right, [t,h], prev
    [domino | head(%{dominoes: dominoes, pos: :right, prev: domino, margins: margins})]
  end

  def head(%{dominoes: [[h,t]|dominoes], pos: {:right, :head}, prev: prev, margins: margins}) do
    domino = place {:right, :head}, :x, [t,h], prev
    [domino | head(%{dominoes: dominoes, pos: :right, prev: domino, margins: margins})]
  end

  def head(%{dominoes: [domino|dominoes], pos: {:top, :head}, prev: prev, margins: margins}) do
    domino = place {:top, :head}, :y, domino, prev
    [domino | head(%{dominoes: dominoes, pos: {:right, :head}, prev: domino, margins: margins})]
  end

  def head(%{dominoes: [domino|dominoes], pos: :left, prev: %{left: left} = prev, margins: %{left: left_margin} = margins})
      when left - @padding <= left_margin do
    domino = place :left, :x, domino, prev
    [domino | head(%{dominoes: dominoes, pos: {:top, :head}, prev: domino, margins: margins})]
  end

  def head %{dominoes: [domino|dominoes], pos: :left, prev: prev, margins: margins} do
    domino = place :left, domino, prev
    [domino | head(%{dominoes: dominoes, pos: :left, prev: domino, margins: margins})]
  end

  def tail(%{dominoes: [domino|dominoes], pos: :right, prev: %{left: left, width: width} = prev, margins: %{right: right_margin} = margins})
      when left + width + @padding >= right_margin do
    domino = place :right, :x, domino, prev
    [domino | tail(%{dominoes: dominoes, pos: {:down, :tail}, prev: domino, margins: margins})]
  end

  def tail %{dominoes: [domino|dominoes], pos: :right, prev: prev, margins: margins} do
    domino = place :right, domino, prev
    [domino | tail(%{dominoes: dominoes, pos: :right, prev: domino, margins: margins})]
  end

  def tail(%{dominoes: [domino|dominoes], pos: {:down, :tail}, prev: prev, margins: margins}) do
    domino = place {:down, :tail}, :y, domino, prev
    [domino | tail(%{dominoes: dominoes, pos: {:left, :tail}, prev: domino, margins: margins})]
  end

  def tail(%{dominoes: [[h,t]|dominoes], pos: {:left, :tail}, prev: prev, margins: margins}) do
    domino = place {:left, :tail}, :x, [t,h], prev
    [domino | tail(%{dominoes: dominoes, pos: :left, prev: domino, margins: margins})]
  end

  def tail(%{dominoes: [[h,t]|dominoes], pos: :left, prev: %{left: left} = prev, margins: %{left: left_margin} = margins})
      when left - @padding <= left_margin do
    domino = place :left, :x, [t,h], prev
    [domino | tail(%{dominoes: dominoes, pos: {:down, :head}, prev: domino, margins: margins})]
  end

  def tail %{dominoes: [[h,t]|dominoes], pos: :left, prev: prev, margins: margins} do
    domino = place :left, [t,h], prev
    [domino | tail(%{dominoes: dominoes, pos: :left, prev: domino, margins: margins})]
  end

  def tail(%{dominoes: [domino|dominoes], pos: {:down, :head}, prev: prev, margins: margins}) do
    domino = place {:down, :head}, :y, domino, prev
    [domino | tail(%{dominoes: dominoes, pos: {:right, :tail}, prev: domino, margins: margins})]
  end

  def tail(%{dominoes: [domino|dominoes], pos: {:right, :tail}, prev: prev, margins: margins}) do
    domino = place {:right, :tail}, :x, domino, prev
    [domino | tail(%{dominoes: dominoes, pos: :right, prev: domino, margins: margins})]
  end

  def tail %{dominoes: []} do [] end

end
