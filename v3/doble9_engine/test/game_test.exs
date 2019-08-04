defmodule GameTest do
  use ExUnit.Case

  alias Doble9Engine.Game

  describe "Start" do

    test "the table is empty" do
      assert Game.start().table == []
    end

  end

end
