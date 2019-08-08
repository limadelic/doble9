defmodule PickTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}
  import Player, only: [join: 2, pick: 1]
  import TestHelper, only: [the: 1]

  setup do
    {:ok, game} = Game.start
    {:ok, player} = Player.start
    :ok = join player, game
    :ok = pick player
    %{ game: the(game), player: the(player) }
  end

  test "picks 10 dominoes", %{game: game, player: %{dominoes: dominoes}} = _ do
    assert length(dominoes) == 10
    refute Enum.any? dominoes, &(&1 in game.dominoes)
  end

end
