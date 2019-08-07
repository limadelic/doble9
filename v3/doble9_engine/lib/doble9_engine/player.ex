defmodule Doble9Engine.Player do
  alias Doble9Engine.Game
  use GenServer

  def start player \\ %{} do GenServer.start_link __MODULE__, player end
  def info player do GenServer.call player, :info  end
  def join player, game do GenServer.call player, {:join, game} end
  def pick player do GenServer.call player, :pick end

  def init player do
    { :ok, Map.merge(new, player)}
  end

  def new do
    %{
      game: nil,
      dominoes: []
    }
  end

  def handle_call :info, _, player do
    { :reply, player, player }
  end

  def handle_call {:join, game}, _, player do
    handle_join Game.join(game), game, player
  end

  def handle_join :ok, game, player do
    { :reply, :ok, %{ player | game: game }}
  end

  def handle_join error, _, player do
    { :reply, error, player }
  end

  def handle_call(:pick, _, %{ game: game } = player) when game == nil do
    { :reply, { :error, "need to join a game first" }, player }
  end

  def handle_call :pick, _, player do
    handle_pick Game.pick(player.game), player
  end

  def handle_pick {:ok, dominoes}, player do
    { :reply, :ok, %{ player | dominoes: dominoes}}
  end

end
