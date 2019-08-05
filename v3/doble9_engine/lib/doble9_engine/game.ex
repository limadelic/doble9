defmodule Doble9Engine.Game do
  use GenServer
  alias __MODULE__
  import Enum, only: [shuffle: 1, drop: 2, take: 2]

  @dominoes for x <- 0..9, y <- x..9, do: {x, y}

  def run do GenServer.start_link Game, nil end
  def stop game do GenServer.stop game end

  def init _ do { :ok, start } end

  def start do
    %{
      table: [],
      dominoes: shuffle(@dominoes),
      players: []
    }
  end

  def join player, game do
#    send self, { :serve, player }
    %{ game | players: [ player | game.players ]}
  end

  def serve player, game do
#    send player, { :take, take(game.dominoes, 10)}
    %{ game | dominoes: drop(game.dominoes, 10) }
  end

end
