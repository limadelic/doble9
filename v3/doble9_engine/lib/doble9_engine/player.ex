defmodule Doble9Engine.Player do
  alias Doble9Engine.Game
  use GenServer

  def start opts \\ %{} do GenServer.start_link __MODULE__, opts end

  def join player, game do GenServer.call player, {:join, game} end

  def handle_call {:join, game}, _, player do
    handle_join Game.join(game), game, player
  end

  def handle_join :ok, game, player do
    { :reply, :ok, Map.put(player, :game, game) }
  end

  def handle_join error, _, player do
    { :reply, error, player }
  end

end
