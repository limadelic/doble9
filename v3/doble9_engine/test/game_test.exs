defmodule GameTest do
  use ExUnit.Case, async: true

  alias Doble9Engine.Game

  describe "Start" do

    setup do: Game.start

    test "the table is empty", game do
      assert game.table == []
    end

    test "there are 55 dominoes", game do
      assert length(game.dominoes) == 55
    end

    test "there are no players yet", game do
      assert game.players == []
    end

  end

end
