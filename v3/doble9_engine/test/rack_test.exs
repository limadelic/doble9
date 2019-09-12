defmodule RackTest do
  use ExUnit.Case, async: true

  import Doble9Engine.Rack

  describe "Rack of dominoes" do

    @dominoes [[9,9],[7,8],[8,8],[7,6],[8,6],[6,9]]
    @numbers_sorted_by_count [8,6,9,7,5,4,3,2,1,0]
    @groups [[[8,7],[8,8],[8,6]],[[6,7],[6,9]],[[9,9]]]
    @joine [[8,7],[8,8],[8,6],[7,6],[9,6]],[[9,9]]

    test "sort numbers by count" do
      assert sort_numbers_by_count(@dominoes) == {@dominoes, @numbers_sorted_by_count}
    end

    test "group and arrange by number" do
      assert group({@dominoes, @numbers_sorted_by_count}) == @groups
    end

  end

end