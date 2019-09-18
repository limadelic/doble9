defmodule Doble9Engine.Rack do

  import Doble9Engine.Helpers

  def sort dominoes do
    dominoes
    |> sort_numbers_by_count
    |> group_and_arrange_by_number
    |> flatten
    |> center_doubles
  end

  def sort_numbers_by_count dominoes do
    {
      dominoes,
      9..0
      |> Enum.map(&({&1, Enum.count(dominoes, fn x -> &1 in x end)}))
      |> Enum.sort(fn {_,x}, {_,y} -> x >= y end)
      |> Enum.map(fn {x,_} -> x end)
    }
  end

  def group_and_arrange_by_number {[], _} do [] end
  def group_and_arrange_by_number {dominoes, [number|numbers]} do
    matches = Enum.filter dominoes, &(number in &1)
    [arrange(matches, number)|group_and_arrange_by_number({dominoes -- matches, numbers})]
  end

  def arrange dominoes, number do
    Enum.map dominoes, fn [h,t] -> number == h && [h,t] || [t,h] end
  end

  def flatten [] do [] end
  def flatten [group|groups] do group ++ flatten(groups) end

  def center_doubles dominoes do
    dominoes
    |> Enum.with_index
    |> Enum.filter(fn {[x,y],_} -> x == y end)
    |> Enum.reduce(dominoes, &center_double/2)
  end

  def center_double {domino,i}, dominoes do
    [left_left, left, right, right_right] = dominoes_around i, dominoes
    cond do
      centered_double?(left, domino, right) -> dominoes
      centered_double?(left_left,domino,left) -> swap(dominoes, i-1, i)
      centered_double?(right,domino,right_right) -> swap(dominoes, i, i+1)
      true -> dominoes
    end
  end

  def dominoes_around i, dominoes do
    [
      Enum.at(dominoes, i - 2) || [],
      Enum.at(dominoes, i - 1) || [],
      Enum.at(dominoes, i + 1) || [],
      Enum.at(dominoes, i + 2) || []
    ]
  end

  def centered_double? left, [x,x], right do x in left and x in right end

end