defmodule Doble9Engine.Assets do

  def number n, size, axis do
    numbers(size, axis) |> Enum.map &(Enum.at &1, n)
  end

  def numbers :xl, :y do
    [
      ["       ","       ","     ● ","     ● "," ●   ● "," ●   ● "," ●   ● "," ●   ● "," ● ● ● "," ● ● ● "],
      ["       ","   ●   ","       ","   ●   ","       ","   ●   "," ●   ● "," ● ● ● "," ●   ● "," ● ● ● "],
      ["       ","       "," ●     "," ●     "," ●   ● "," ●   ● "," ●   ● "," ●   ● "," ● ● ● "," ● ● ● "],
    ]
  end

  def numbers :xl, :x do
    [
      ["       ","       "," ●     "," ●     "," ●   ● "," ●   ● "," ● ● ● "," ● ● ● "," ● ● ● "," ● ● ● "],
      ["       ","   ●   ","       ","   ●   ","       ","   ●   ","       ","   ●   "," ●   ● "," ● ● ● "],
      ["       ","       ","     ● ","     ● "," ●   ● "," ●   ● "," ● ● ● "," ● ● ● "," ● ● ● "," ● ● ● "],
    ]
  end

  def frame :xl, :y do
    [
      "┌───────┐",
      "│       │",
      "│       │",
      "│       │",
      "├───────┤",
      "│       │",
      "│       │",
      "│       │",
      "└───────┘"
    ]
  end

  def frame :xl, :x do
    [
      "┌───────┬───────┐",
      "│       │       │",
      "│       │       │",
      "│       │       │",
      "└───────┴───────┘",
    ]
  end

  def measure [row|_] = glyph do
    {String.length(row), length(glyph)}
  end

  def char_at glyph, x, y do String.at(Enum.at(glyph, y), x) end

end