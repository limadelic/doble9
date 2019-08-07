defmodule PickTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}
  import Player, only: [join: 2, pick: 1]

  test "picks 10 dominoes" do
    {:ok, game} = Game.start
    {:ok, player} = Player.start
    :ok = join player, game
    :ok = pick player

    assert length(Player.info(player).dominoes) == 10
  end

end
