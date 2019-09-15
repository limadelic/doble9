defmodule RackTest do
  use ExUnit.Case, async: true

  import Doble9Engine.Rack

  describe "Rack of dominoes" do

    @dominoes [[9,9],[8,8],[7,8],[7,6],[8,6],[6,9]]
    @numbers_sorted_by_count [8,6,9,7,5,4,3,2,1,0]
    @grouped_and_arranged_by_number [[[8,8],[8,7],[8,6]],[[6,7],[6,9]],[[9,9]]]
    @flatten [[8,8],[8,7],[8,6],[6,7],[6,9],[9,9]]
    @joined [[8,8],[8,7],[8,6],[7,6],[9,6],[9,9]]
    @double_centered [[8,7],[8,8],[8,6],[7,6],[9,6],[9,9]]

    test "sort numbers by count" do
      assert sort_numbers_by_count(@dominoes) == {@dominoes, @numbers_sorted_by_count}
    end

    test "group and arrange by number" do
      assert group_and_arrange_by_number({@dominoes, @numbers_sorted_by_count}) == @grouped_and_arranged_by_number
    end

    test "join groups" do
      assert join_groups(@grouped_and_arranged_by_number) == @joined
    end

    test "flatten groups" do
      assert flatten(@grouped_and_arranged_by_number) == @flatten
    end

    test "center doubles" do
      assert center_doubles(@joined) == @double_centered
    end

  end

end