defmodule Doble9Engine.Game do

  def start do
    %{
      table: [],
      dominoes: shuffle
    }
  end

  def shuffle do
    for x <- (0..9), y <- (x..9), do: {x, y}
  end

end
