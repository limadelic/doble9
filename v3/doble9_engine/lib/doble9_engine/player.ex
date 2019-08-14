defmodule Doble9Engine.Player do
  alias Doble9Engine.Game
  use GenServer
  import List, only: [delete: 2]

  def start player do GenServer.start_link __MODULE__, player, name: player end
  def join player, game do GenServer.call player, {:join, game} end
  def pick player do GenServer.call player, :pick end
  def turn player do GenServer.cast player, :turn end
  def play player, domino do GenServer.call player, {:play, domino}  end

  def init player do {:ok, new player} end

  def new player do
    %{
      name: player,
      game: nil,
      turn: false,
      dominoes: []
    }
  end

  def handle_cast :turn, player do
    {:noreply, %{player | turn: true}}
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
      :ok -> played Game.play(game, name, domino), player, domino
    end
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
    { :reply, :ok, %{player | dominoes: delete(player.dominoes, domino)}}
  end

end
