defmodule Doble9Engine.Game do
  use GenServer
  import Enum, only: [shuffle: 1, take: 2, drop: 2]

  def start do GenServer.start_link __MODULE__, nil end
  def info game do GenServer.call game, :info end
  def join game do GenServer.call game, :join end
  def pick game do GenServer.call game, :pick end
  def play game, domino do GenServer.call game, {:play, domino} end

  def init _ do {:ok, new()} end

  @dominoes for x <- 0..9, y <- x..9, do: [x|y]

  def new do
    %{
      table: %{
        dominoes: [],
        heads: []
      },
      dominoes: shuffle(@dominoes),
      players: [],
      picked: []
    }
  end

  def handle_call :join, {player, _}, %{players: players} = game do
    cond do
      length(players) == 4 -> {:reply, {:error, "game full"}, game}
      player in players -> {:reply, {:error, "already in game"}, game}
      :ok -> {:reply, :ok, %{game | players: [player | players]}}
    end
  end

  def handle_call :pick, {player, _}, %{picked: picked, players: players} = game do
    cond do
      player not in players -> {:reply, {:error, "need to join the game first"}, game}
      player in picked -> {:reply, {:error, "picked already"}, game}
      :ok -> { :reply, {:ok, take(game.dominoes, 10)}, %{game |
        dominoes: drop(game.dominoes, 10),
        picked: [player | game.picked]
      }}
    end
  end

  def handle_call {:play, domino}, {player, _}, %{table: %{dominoes: dominoes, heads: heads}} = game do
    cond do
      :ok -> {:reply, :ok, %{game | table: %{dominoes: [domino|dominoes], heads: domino}}}
    end
  end

end
