defmodule Doble9Engine.Player do
  alias Doble9Engine.Game
  use GenServer
  import List, only: [delete: 2]
  import Enum, only: [filter: 2]

  def login player do GenServer.start_link __MODULE__, %{name: player}, name: player end
  def start_bot bot, game do GenServer.start_link __MODULE__, %{name: bot, bot: true, game: game}, name: bot end
  def new_game player, game do GenServer.call player, {:new_game, game} end

  def join player, game do GenServer.call player, {:join, game} end
  def pick player do GenServer.call player, :pick end
  def turn player, heads do GenServer.cast player, {:turn, heads} end
  def play player, domino do GenServer.call player, {:play, domino}  end

  @defaults %{
    game: nil,
    turn: nil,
    dominoes: []
  }

  def init %{bot: true} = player do
    send self, :pick
    new player
  end

  def init player do new player end

  def new player do {:ok, Map.merge(@defaults, player)} end

  def handle_cast {:turn, heads}, %{bot: true} = player do
    send self, {:play, heads}
    {:noreply, turn(player, heads)}
  end

  def handle_cast {:turn, heads}, player do
    {:noreply, turn(player, heads)}
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

  def handle_call(:pick, _, %{game: game} = player) when game == nil do
    { :reply, { :error, "need to join a game first" }, player }
  end
  def handle_call :pick, _, %{name: name, game: game} = player do
    picked Game.pick(game, name), player
  end

  def handle_call {:play, domino}, _, %{name: name, dominoes:  dominoes, game: game} = player do
    cond do
      game == nil -> { :reply, { :error, "need to join a game first" }, player }
      domino not in dominoes -> { :reply, {:error, "forro!!"}, player}
      :ok -> {:reply, :ok, played Game.play(game, name, domino), player, domino}
    end
  end

  def handle_info :pick, %{name: name, game: game} = player do
    {:ok, dominoes} = Game.pick game, name
    {:noreply, %{player | dominoes: dominoes}}
  end

  def handle_info {:play, heads}, player do
    {_, _, player} = handle_call {:play, match(heads)}, nil, player
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

  def picked {:ok, dominoes}, player do
    { :reply, :ok, %{ player | dominoes: dominoes}}
  end

  def picked error, player do
    { :reply, error, player }
  end

  def played :ok, player, domino do
    %{player | turn: nil, played: domino, dominoes: delete(player.dominoes, domino)}
  end

  def turn %{dominoes: dominoes} = player, heads do
    %{player | turn: %{heads: heads, choices: choices(heads, dominoes)}}
  end

  def choices heads, dominoes do
    filter dominoes, fn [head|tail]=_ -> head in heads or tail in heads end
  end

end
