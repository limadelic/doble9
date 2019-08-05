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

  describe "Join" do

    setup do: Game.join :player, Game.start

    test "adds the player", game do
      assert game.players == [:player]
    end

  end

  describe "Serve" do

    setup do: Game.serve :player, Game.start

    test "the player receives 10 dominoes" do

    end

    test "there are 10 dominoes less in the game", game do
      assert length(game.dominoes) == 45
    end

  end

end
