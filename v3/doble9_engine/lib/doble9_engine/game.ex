defmodule Doble9Engine.Game do

  import Enum, only: [shuffle: 1]

  def start do
    %{
      table: [],
      dominoes: shuffle(dominoes),
      players: []
    }
  end

  def join player, game do
    %{ game | players: [ player | game.players ]}
  end

  def dominoes do
    for x <- 0..9, y <- x..9, do: {x, y}
  end

end
