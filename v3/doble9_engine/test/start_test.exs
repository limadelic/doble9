defmodule StartTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}
  import TestHelper, only: [the: 1]

  setup do
    {:ok, game} = Game.start
    {:ok, player} = Player.start
    %{ game: the(game), player: the(player) }
  end

  test "there r no players", %{ game: game } = _ do
    assert game.players == []
  end

  test "there r 55 dominoes", %{ game: game } = _ do
    assert length(game.dominoes) == 55
  end

  test "the table is empty", %{ game: game } = _ do
    assert game.table.dominoes == []
    assert game.table.heads == []
  end

  test "the player is not in the game", %{ player: player } = _ do
    assert player.game == nil
  end

  test "the player has no dominoes", %{ player: player } = _ do
    assert player.dominoes == []
  end

end
