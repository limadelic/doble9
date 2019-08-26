defmodule Doble9Engine.UI.Assets do

  @axis [:x, :y]

  def width(axis) when axis in @axis do width frame axis  end
  def width glyph do glyph |> hd |> String.length end

  def height(axis) when axis in @axis do height frame axis end
  def height glyph do length glyph end

  def number n, axis do
    numbers(axis) |> Enum.map(&(Enum.at &1, n))
  end

  def numbers :y do
    [
      ["       ","       ","     ● ","     ● "," ●   ● "," ●   ● "," ●   ● "," ●   ● "," ● ● ● "," ● ● ● "],
      ["       ","   ●   ","       ","   ●   ","       ","   ●   "," ●   ● "," ● ● ● "," ●   ● "," ● ● ● "],
      ["       ","       "," ●     "," ●     "," ●   ● "," ●   ● "," ●   ● "," ●   ● "," ● ● ● "," ● ● ● "],
    ]
  end

  def numbers :x do
    [
      ["       ","       "," ●     "," ●     "," ●   ● "," ●   ● "," ● ● ● "," ● ● ● "," ● ● ● "," ● ● ● "],
      ["       ","   ●   ","       ","   ●   ","       ","   ●   ","       ","   ●   "," ●   ● "," ● ● ● "],
      ["       ","       ","     ● ","     ● "," ●   ● "," ●   ● "," ● ● ● "," ● ● ● "," ● ● ● "," ● ● ● "],
    ]
  end

  def frame :y do
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

  def frame :x do
    [
      "┌───────┬───────┐",
      "│       │       │",
      "│       │       │",
      "│       │       │",
      "└───────┴───────┘",
    ]
  end

  def available :y do
    [
      "╔──═══──╗",
      "│       │",
      "║       ║",
      "│       │",
      "╠───────╣",
      "│       │",
      "║       ║",
      "│       │",
      "╚──═══──╝"
    ]
  end

  def selected :y do
    [
      "╔═══════╗",
      "║       ║",
      "║       ║",
      "║       ║",
      "╠═══════╣",
      "║       ║",
      "║       ║",
      "║       ║",
      "╚═══════╝"
    ]
  end

  def back :y do
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

  def back :x do
    [
      "┌───────────────┐",
      "│\\\\//\\\\//\\\\//\\\\/│",
      "│//\\\\//\\\\//\\\\//\\│",
      "│\\\\//\\\\//\\\\//\\\\/│",
      "└───────────────┘",
    ]
  end

end