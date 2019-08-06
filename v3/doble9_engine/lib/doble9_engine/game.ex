defmodule Doble9Engine.Game do
  use GenServer
  import Enum, only: [shuffle: 1, member?: 2]

  def start do GenServer.start_link __MODULE__, nil end

  def init _ do { :ok, new } end

  @dominoes for x <- 0..9, y <- x..9, do: {x, y}

  def new do
    %{
      table: [],
      dominoes: shuffle(@dominoes),
      players: []
    }
  end

  def join game do GenServer.call game, :join end

  def handle_call :join, {player, _}, game do
    cond do
      member?(game.players, player) -> { :reply, {:error, "already in game"}, game }
      length(game.players) == 4 -> { :reply, {:error, "game full"}, game }
      :ok -> { :reply, :ok, %{ game | players: [ player | game.players ]} }
    end
  end

end
