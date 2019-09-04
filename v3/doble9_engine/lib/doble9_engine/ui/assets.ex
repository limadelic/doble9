defmodule Doble9Engine.UI.Assets do

  @axis [:x, :y]

  def other :x do :y end
  def other :y do :x end

  def size dominoes, :x do {length(dominoes) * width(:y), height(:y)} end
  def size dominoes, :y do {width(:x), length(dominoes) * height(:x)} end

  def width(axis) when axis in @axis do width frame axis  end
  def width glyph do glyph |> hd |> String.length end

  def height :char do height char :l, ?A end
  def height(axis) when axis in @axis do height frame axis end
  def height glyph do length glyph end

  def char(size, letter) when letter in ?A..?Z do
    letters(size) |> Enum.map(&(Enum.at &1, letter - ?A))
  end
  def char(size, number) when number in ?0..?9 do
    numbers(size) |> Enum.map(&(Enum.at &1, number - ?0))
  end
  def char _ do [] end


  def number n, axis do
    numbers(axis) |> Enum.map(&(Enum.at &1, n))
  end

  def char_at glyph, x, y do String.at(Enum.at(glyph, y), x) end

  def letters :m do
  [
    ["┌─┐","┌┐ ","┌─┐","┌─┐","┌─┐","┌─┐","┌─┐","┬ ┬","┬","  ┬","┬┌ ","┬  ","┌┬┐","┌┐┬","┌─┐","┌─┐","┌─┐","┌┐ ","┌─┐","┌┬┐","┬ ┬","┬ ┬","┬ ┬","┌┬┐","┬ ┬","┌─┐"],
    ["├─┤","├┴┐","│  ","│ │","├─ ","├─ ","├─┐","├─┤","│","  │","├┴┐","│  ","│││","│││","│ │","├─┘","│ │","├┴┐","└─┐"," │ ","│ │","│┌┘","│││"," │ ","└┬┘","┌─┘"],
    ["┴ ┴","└─┘","└─┘","└─┘","└─┘","┴  ","└─┘","┴ ┴","┴","└─┘","┴ └","└─┘","┴ ┴","┴└┘","└─┘","┴  ","└─┼","┴ └","└─┘"," ┴ ","└─┘","└┘ ","└┴┘","└┴┘"," ┴ ","└─┘"],
  ]
  end

  def letters :l do
    [
      ["┌───┐","┌───┐","┌───┐","┌───┐","┌───┐","┌───┐","┌───┐","┌─┐┌─┐","┌───┐","┌───┐","┌─┬─┐","┌─┐  ","┌──┬──┐","┌──┬─┐","┌───┐","┌───┐","┌───┐ ","┌───┐","┌───┐","┌───┐","┌─┬─┐","┌─┬─┐","┌─┬─┬─┐","┌─┬─┐","┌─┬─┐","┌───┐"],
      ["│ ● │","│ ● │","│ ┌─┘","│ │ │","│ ──┤","│ ──┤","│ ──┤","│ └┘ │","└┐ ┌┘","└┐ ┌┘","│  ┌┘","│ │  ","│     │","│    │","│ │ │","│ ● │","│ │ │ ","│ ● │","│ ──┤","└┐ ┌┘","│ │ │","│ │ │","│ │ │ │","└┐ ┌┘","└┐ ┌┘","├── │"],
      ["│   │","│ ● │","│ └─┐","│ │ │","│ ──┤","│ ┌─┘","│ ● │","│ ┌┐ │","┌┘ └┐","┌┘ │ ","│  └┐","│ └─┐","│ │ │ │","│    │","│ │ │","│ ┌─┘","│ │ └┐","│  ─┤","├── │"," │ │ ","│ │ │","└┐ ┌┘","│     │","┌┘ └┐"," │ │ ","│ ──┤"],
      ["└─┴─┘","└───┘","└───┘","└───┘","└───┘","└─┘  ","└───┘","└─┘└─┘","└───┘","└──┘ ","└─┴─┘","└───┘","└─┴─┴─┘","└─┴──┘","└───┘","└─┘  ","└────┘","└─┴─┘","└───┘"," └─┘ ","└───┘"," └─┘ ","└──┴──┘","└─┴─┘"," └─┘ ","└───┘"],
    ]
  end

  def numbers :m do
  [
    ["┌─┐","┌┐","┌─┐","┌─┐","┬ ┬","┌─┐","┌─┐","┌─┐","┌─┐","┌─┐"],
    ["│ │"," │","┌─┘"," ─┤","└─┤","└─┐","├─┐","  │","├─┤","└─┤"],
    ["└─┘"," ┴","└─┘","└─┘","  ┴","└─┘","└─┘","  ┴","└─┘","└─┘"],
  ]
  end

  def numbers :l do
  [
    ["┌───┐","┌──┐ ","┌───┐","┌───┐","┌─┬─┐","┌───┐","┌───┐","┌───┐","┌───┐","┌───┐"],
    ["│ │ │","└┐ │ ","├── │","├── │","│ │ │","│ ──┤","│ ──┤","└─┐ │","│ ● │","│ ● │"],
    ["│ │ │","┌┘ └┐","│ ──┤","├── │","└─┐ │","├── │","│ ● │","  │ │","│ ● │","├── │"],
    ["└───┘","└───┘","└───┘","└───┘","  └─┘","└───┘","└───┘","  └─┘","└───┘","└───┘"],
  ]
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

  def back :s do
    [
      "███",
      "███",
      "███",
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