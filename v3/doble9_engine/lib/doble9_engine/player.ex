defmodule Doble9Engine.Player do
  alias Doble9Engine.Game
  use GenServer
  import List, only: [delete: 2]
  import Enum, only: [filter: 2]
  import Map, only: [merge: 2]

  def login player do GenServer.start_link __MODULE__, %{name: player}, name: player end
  def start_bot bot, game do GenServer.start_link __MODULE__, %{name: bot, bot: true, game: game}, name: bot end
  def new_game player, game do GenServer.call player, {:new_game, game} end

  def join player, game do GenServer.call player, {:join, game} end
  def pick player do GenServer.call player, :pick end
  def turn player, heads \\ [] do GenServer.cast player, {:turn, heads} end
  def play player, domino do GenServer.call player, {:play, domino}  end

  @defaults %{
    game: nil,
    dominoes: [],
    turn: nil,
    played: nil,
  }

  def init %{bot: true} = player do
    send self, :pick
    new player
  end
  def init player do new player end

  def new player do {:ok, merge(@defaults, player)} end

  def handle_cast {:turn, heads}, %{bot: true} = player do
    send self, :play
    {:noreply, turned(heads, player)}
  end
  def handle_cast {:turn, heads}, player do
    {:noreply, turned(heads, player)}
  end

  def handle_call {:new_game, game}, _, %{name: name} = player do
    created Game.create(game, name), game, player
  end

  def handle_call({:join, _}, _, %{game: game} = player) when game != nil do
    { :reply, { :error, "already in game" }, player }
  end
  def handle_call {:join, game}, _, %{name: name} = player do
    joined Game.join(game, name), player, game
  end

  def handle_call :pick, _, %{name: name, game: game} = player do
    reply picked Game.pick(game, name), player
  end

  def handle_call {:play, domino}, _, %{name: name, dominoes:  dominoes, game: game} = player do
    cond do
      game == nil -> { :reply, { :error, "need to join a game first" }, player }
      domino not in dominoes -> { :reply, {:error, "forro!!"}, player}
      :ok -> {:reply, :ok, played(Game.play(game, name, domino), player, domino)}
    end
  end

  def reply {:ok, player} do {:reply, :ok, player} end
  def reply {{:ok, response}, player} do {:reply, {:ok, response}, player} end
  def reply {error, player} do {:reply, error, player} end

  def handle_info :pick, %{name: name, game: game} = player do
    {:ok, player} = picked Game.pick(game), player
    {:noreply, player}
  end

  def handle_info {:play, heads}, player do
    {:noreply, player}
  end

  def created {:ok, _}, game, player do
    send self, :pick
    { :reply, :ok, %{player | game: game}}
  end

  def joined :ok, player, game do
    { :reply, :ok, %{player | game: game}}
  end

  def joined error, player, _ do
    { :reply, error, player }
  end

  def picked({:ok, dominoes}, %{turn: turn} = player) when turn != nil do
    { :ok, %{ player | dominoes: dominoes, turn: %{turn | choices: dominoes}}}
  end
  def picked {:ok, dominoes}, player do
    { :ok, %{ player | dominoes: dominoes}}
  end
  def picked error, player do
    { error, player }
  end

  def played :ok, player, domino do
    %{player | turn: nil, played: domino, dominoes: delete(player.dominoes, domino)}
  end

  def turned heads, %{dominoes: dominoes} = player do
    %{player | turn: %{heads: heads, choices: matches(dominoes, heads)}}
  end

  def matches dominoes, [] do dominoes end
  def matches dominoes, heads do
    filter dominoes, &{&1 -- heads != &1}
  end

end
