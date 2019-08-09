defmodule PlayTest do
  use ExUnit.Case

  alias Doble9Engine.{Game, Player}
  import TestHelper, only: [the: 1]
  import Player, only: [join: 2, pick: 1, play: 2]

  @game :calle8
  @player :mike

  setup do
    {:ok, _} = Game.start @game
    {:ok, _} = Player.start @player
    :ok = join @player, @game
    :ok = pick @player
    the(@player).dominoes
  end

  test "start", [domino|_] do
    assert play @player, domino
    assert the(@game).table.dominoes == [domino]
    refute domino in the(@player).dominoes
  end

end
