defmodule JoinTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}

  test "joined" do
    {:ok, game} = Game.start
    {:ok, player} = Player.start

    assert Player.join player, game
  end

  test "fail to join twice", the do
    {:ok, game} = Game.start
    {:ok, player} = Player.start
    :ok = Player.join player, game

    assert Player.join(player, game) == {:error, "already in game"}
  end

  test "game full", the do
  end

end
