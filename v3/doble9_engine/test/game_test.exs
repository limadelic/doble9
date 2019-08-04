defmodule GameTest do
  use ExUnit.Case

  alias Doble9Engine.Game

  describe "Start" do

    test "the table is empty" do
      assert Game.start.table == []
    end

    test "there are 55 dominoes" do
      assert length(Game.start.dominoes) == 55
    end

  end

end
