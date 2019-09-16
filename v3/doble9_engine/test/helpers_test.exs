defmodule HelpersTest do
  use ExUnit.Case, async: true

  import Doble9Engine.Helpers

  describe "swap" do

    test "swap 2 element" do
      assert swap([1,3,2,4],1,2) == [1,2,3,4]
    end

  end

end