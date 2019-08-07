defmodule JoinTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}

  test "joined" do
    {:ok, game} = Game.start
    {:ok, player} = Player.start

    assert Player.join player, game
  end

  test "fail to join twice" do
    {:ok, game} = Game.start
    {:ok, player} = Player.start
    :ok = Player.join player, game

    assert Player.join(player, game) == {:error, "already in game"}
  end

  test "game full" do
    {:ok, game} = Game.start
    for _ <- 1..4 do
      {:ok, player} = Player.start
      :ok = Player.join player, game
    end
    {:ok, player} = Player.start

    assert Player.join(player, game) == {:error, "game full"}
  end

end
