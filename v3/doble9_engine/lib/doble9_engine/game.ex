defmodule Doble9Engine.Game do
  use GenServer
  import Enum, only: [shuffle: 1, take: 2, drop: 2]

  def start game do GenServer.start_link __MODULE__, nil, name: game end
  def join game, player do GenServer.call game, {:join, player} end
  def pick game, player do GenServer.call game, {:pick, player} end
  def play game, player, domino do GenServer.call game, {:play, player, domino} end

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

  def handle_call {:join, player}, _, %{players: players} = game do
    cond do
      length(players) == 4 -> {:reply, {:error, "game full"}, game}
      player in players -> {:reply, {:error, "already in game"}, game}
      :ok -> {:reply, :ok, %{game | players: [player | players]}}
    end
  end

  def handle_call {:pick, player}, _, %{picked: picked, players: players} = game do
    cond do
      player not in players -> {:reply, {:error, "need to join the game first"}, game}
      player in picked -> {:reply, {:error, "picked already"}, game}
      :ok -> { :reply, {:ok, take(game.dominoes, 10)}, %{game |
        dominoes: drop(game.dominoes, 10),
        picked: [player | game.picked]
      }}
    end
  end

  def handle_call {:play, player, domino}, _, %{players: players} = game do
    cond do
      player not in players -> {:reply, {:error, "need to join the game first"}, game}
      :ok -> handle_play domino, game
    end
  end

  def handle_play domino, %{table: %{dominoes: []}} = game do
    {:reply, :ok, %{game | table: %{dominoes: [domino], heads: domino}}}
  end

  def handle_play [head|tail] = domino, %{table: %{dominoes: dominoes, heads: [table_head|table_tail]}} = game do
    cond do
      head == table_head -> played game, [[tail|head]] ++ dominoes, [tail|table_tail]
      head == table_tail -> played game, dominoes ++ [domino], [table_head|tail]
      tail == table_tail -> played game, dominoes ++ [[tail|head]], [table_head|head]
      tail == table_head -> played game, [domino] ++ dominoes, [head|table_tail]
    end
  end

  def played game, dominoes, heads do
    {:reply, :ok, %{game | table: %{dominoes: dominoes, heads: heads}}}
  end

end
