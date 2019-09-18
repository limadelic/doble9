defmodule HelpersTest do
  use ExUnit.Case, async: true

  import Doble9Engine.Helpers

  describe "swap" do

    test "swap 2 element" do
      assert swap([1,3,2,4],1,2) == [1,2,3,4]
    end

    test "swap dominoes" do
      assert swap([[8,8],[8,7],[8,6],[7,6],[9,6],[9,9]], 0, 1) ==
        [[8,7],[8,8],[8,6],[7,6],[9,6],[9,9]]
    end

  end

end