defmodule JoinTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.{Game, Player}
  import Player, only: [join: 2]
  import TestHelper, only: [the: 1]

  @game :calle8
  @player :mike

  setup do
    {:ok, _} = Game.start @game
    {:ok, _} = Player.start @player
    :ok
  end

  test "joined" do
    assert join @player, @game
    assert @player in (the(@game).players)
    assert the(@player).game == @game
  end

end
