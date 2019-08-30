defmodule AssetsTest do
  use ExUnit.Case, async: true

  import Doble9Engine.UI.Assets

  describe "numbers" do

    test "find the nine" do

      assert number(9,:x) == [
        " ● ● ● ",
        " ● ● ● ",
        " ● ● ● ",
      ]

    end

  end

end