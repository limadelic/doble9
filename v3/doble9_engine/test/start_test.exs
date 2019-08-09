defmodule StartTest do
  use ExUnit.Case

  alias Doble9Engine.{Game, Player}
  import TestHelper, only: [the: 1]

  @game :calle8
  @player :mike

  setup do
    {:ok, game} = Game.start @game
    {:ok, player} = Player.start @player
    %{game: the(game), player: the(player)}
  end

  test "there r no players", %{game: %{players: players}} = _ do
    assert players == []
  end

  test "there r 55 dominoes", %{game: %{dominoes: dominoes}} = _ do
    assert length(dominoes) == 55
  end

  test "the table is empty", %{game: %{table: table}} = _ do
    assert table.dominoes == []
    assert table.heads == []
  end

  test "the player is not in the game", %{player: player} = _ do
    assert player.game == nil
  end

  test "the player has no dominoes", %{player: player} = _ do
    assert player.dominoes == []
  end

end
