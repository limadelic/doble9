defmodule PickTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}
  import Player, only: [join: 2, pick: 1, info: 1]

  setup do
    {:ok, game} = Game.start
    {:ok, player} = Player.start
    %{ game: game, player: player }
  end

  test "picks 10 dominoes", %{ game: game, player: player } = _ do
    :ok = join player, game
    :ok = pick player

    assert length(info(player).dominoes) == 10
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
