defmodule JoinTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}
  import Player, only: [join: 2, pick: 1, info: 1]

  setup do
    {:ok, game} = Game.start
    {:ok, player} = Player.start
    %{ game: game, player: player }
  end

  test "joined", %{ game: game, player: player } = _ do
    assert join player, game
  end

  test "fail to join twice", %{ game: game, player: player } = _ do
    :ok = join player, game

    assert join(player, game) == {:error, "already in game"}
  end

  test "game full", %{ game: game, player: player } = _ do
    for _ <- 1..4 do
      {:ok, player} = Player.start
      :ok = join player, game
    end

    assert join(player, game) == {:error, "game full"}
  end

end
