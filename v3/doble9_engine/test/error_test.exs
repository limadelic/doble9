defmodule ErrorTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}
  import Player, only: [join: 2, pick: 1]

  setup do
    {:ok, game} = Game.start
    {:ok, player} = Player.start
    %{ game: game, player: player }
  end

  test "already in game", %{ game: game, player: player } = _ do
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

  test "can't pick unless joined", %{ player: player } = _ do
    assert pick(player) == { :error, "need to join a game first" }
  end

  test "can't pick twice", %{ game: game, player: player } = _ do
    :ok = join player, game
    :ok = pick player

    assert pick(player) == { :error, "picked already" }
  end


end