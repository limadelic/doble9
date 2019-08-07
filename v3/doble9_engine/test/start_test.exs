defmodule StartTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}
  import Player, only: [join: 2, pick: 1, info: 1]

  setup do
    {:ok, game} = Game.start
    {:ok, player} = Player.start
    %{ game: :sys.get_state(game), player: :sys.get_state(player) }
  end

  test "there r no players", %{ game: game } = _ do
    assert game.players == []
  end

  test "there r 55 dominoes", %{ game: game } = _ do
    assert length(game.dominoes) == 55
  end

  test "the table is empty", %{ game: game } = _ do
    assert game.table == []
  end

end
