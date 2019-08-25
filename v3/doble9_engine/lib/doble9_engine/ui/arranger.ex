defmodule Doble9Engine.UI.Arranger do

  @size :xl
  @dy 3

  import Map, only: [merge: 2]
  import Doble9Engine.UI.Assets

  def margins window do
    {width, height} = measure frame @size, :x
    %{left: width, top: height, right: window.width - width, bottom: window.height - height}
  end

  def center [x,x], window do center [x,x], window, :y end
  def center [x,y], window do center [x,y], window, :x end

  def center domino, window, axis do
    {width, height} = measure frame @size, axis
    left = div(window.width, 2) - div(width, 2)
    top = div(window.height, 2) - div(height, 2)
    %{domino: domino, left: left, top: top, size: @size, axis: axis, width: width, height: height}
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

  def place dir, [x,x], another do
    {width, height} = measure frame @size, :y
    place dir, %{domino: [x,x], size: @size, width: width, height: height, axis: :y}, another
  end

  def place dir, [x,y], another do
    {width, height} = measure frame @size, :x
    place dir, %{domino: [x,y], size: @size, width: width, height: height, axis: :x}, another
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
    merge domino, %{left: left - width, top: top - @dy}
  end

  def measure [row|_] = glyph do
    {String.length(row), length(glyph)}
  end

  def char_at glyph, x, y do String.at(Enum.at(glyph, y), x) end

end