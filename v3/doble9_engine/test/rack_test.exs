defmodule RackTest do
  use ExUnit.Case, async: true

  import Doble9Engine.Rack

  describe "Rack of dominoes" do

    test "count" do
      assert count([[9,9],[7,8],[8,8],[7,6],[8,6],[6,9]]) == [8,6,9,7,5,4,3,2,1,0]
    end

  end

end