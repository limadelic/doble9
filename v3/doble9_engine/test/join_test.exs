defmodule JoinTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}
  import Player, only: [join: 2]

  setup do
    {:ok, game} = Game.start
    {:ok, player} = Player.start
    %{ game: game, player: player }
  end

  test "joined", %{ game: game, player: player } = _ do
    assert join player, game
  end

end
