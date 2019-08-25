defmodule Doble9Engine.UI.Assets do

  def number n, size, axis do
    numbers(size, axis) |> Enum.map(&(Enum.at &1, n))
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

  def back :xl, :y do
    [
      "┌───────┐",
      "│\\\\//\\\\/│",
      "│//\\\\//\\│",
      "│\\\\//\\\\/│",
      "│//\\\\//\\│",
      "│\\\\//\\\\/│",
      "│//\\\\//\\│",
      "│\\\\//\\\\/│",
      "└───────┘"
    ]
  end

  def back :xl, :x do
    [
      "┌───────────────┐",
      "│\\\\//\\\\//\\\\//\\\\/│",
      "│//\\\\//\\\\//\\\\//\\│",
      "│\\\\//\\\\//\\\\//\\\\/│",
      "└───────────────┘",
    ]
  end

end