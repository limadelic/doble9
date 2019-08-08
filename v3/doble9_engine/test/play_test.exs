defmodule PlayTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}
  import TestHelper, only: [the: 1]
  import Player, only: [join: 2, pick: 1, play: 2]

  setup do
    {:ok, game} = Game.start
    {:ok, player} = Player.start
    :ok = join player, game
    :ok = pick player
    %{dominoes: dominoes} = the player
    %{ game: game, player: player, dominoes: dominoes }
  end

  test "start", %{ game: game, player: player, dominoes: [ domino | _ ] } = _ do
    assert play player, domino
    assert the(game).table.dominoes == [domino]
    refute domino in the(player).dominoes
  end

end
