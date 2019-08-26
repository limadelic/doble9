defmodule Doble9Engine.UI.Arranger do

  @dy 2
  @axis [:x, :y]

  import Map, only: [merge: 2]
  import Doble9Engine.UI.Assets

  def margins window do
    %{left: width(:x), right: window.width - width(:x)}
  end

  def center [x,x], window do center [x,x], window, :y end
  def center [x,y], window do center [x,y], window, :x end

  def center domino, window, axis do
    left = div(window.width, 2) - div(width(axis), 2)
    top = div(window.height, 2) - div(height(axis), 2)
    %{domino: domino, left: left, top: top, axis: axis, width: width(axis), height: height(axis)}
  end

  def split [start], start do {[],[]} end

  def split [start|tail], start do {[], tail} end

  def split [head|dominoes], start do
    split [head], dominoes, start
  end

  def split head, [start|tail], start do
    {head, tail}
  end

  def split head, [domino|dominoes], start do
    split [domino|head], dominoes, start
  end

  def place pos, [x,x], another do
    place pos, :y, [x,x], another
  end

  def place pos, [x,y], another do
    place pos, :x, [x,y],another
  end

  def place(pos, axis, domino, another) when axis in @axis do
    place pos, %{domino: domino, width: width(axis), height: height(axis), axis: axis}, another
  end

  def place {:left, :head}, %{width: width} = domino, %{left: left, top: top} do
    merge domino, %{left: left - width, top: top}
  end

  def place {:top, :tail}, %{width: width, height: height,} = domino, %{left: left, top: top, width: ref_width} do
    merge domino, %{left: left + ref_width - width, top: top - height}
  end

  def place {:right, :head}, domino, %{left: left, top: top, width: width} do
    merge domino, %{left: left + width, top: top}
  end

  def place {:top, :head}, %{height: height} = domino, %{left: left, top: top} do
    merge domino, %{left: left, top: top - height}
  end

  def place :left, %{axis: :x, width: width} = domino, %{left: left, top: top, axis: :x} do
    merge domino, %{left: left - width, top: top}
  end

  def place :left, %{axis: :x, width: width} = domino, %{left: left, top: top, axis: :y} do
    merge domino, %{left: left - width, top: top + @dy}
  end

  def place :left, %{axis: :y, width: width} = domino, %{left: left, top: top} do
    merge domino, %{left: left - width, top: top - @dy}
  end

  def place :right, %{axis: :x} = domino, %{left: left, width: width, top: top, axis: :x} do
    merge domino, %{left: left + width, top: top}
  end

  def place :right, %{axis: :x} = domino, %{left: left, width: width, top: top, axis: :y} do
    merge domino, %{left: left + width, top: top + @dy}
  end

  def place :right, %{axis: :y} = domino, %{left: left, width: width, top: top} do
    merge domino, %{left: left + width, top: top - @dy}
  end

  def place {:down, :tail}, %{width: width} = domino, %{left: left, top: top, height: height, width: ref_width} do
    merge domino, %{left: left + ref_width - width, top: top + height}
  end

  def place {:left, :tail}, %{width: width, height: height} = domino, %{left: left, top: top, height: ref_height} do
    merge domino, %{left: left - width, top: top + ref_height - height}
  end

  def place {:down, :head}, domino, %{left: left, top: top, height: height} do
    merge domino, %{left: left, top: top + height}
  end

  def place {:right, :tail}, %{height: height} = domino, %{left: left, top: top, width: width, height: ref_height} do
    merge domino, %{left: left + width, top: top + ref_height - height}
  end

  def char_at glyph, x, y do String.at(Enum.at(glyph, y), x) end

end