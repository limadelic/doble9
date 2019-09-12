defmodule Doble9Engine.Rack do

  def sort dominoes do
    dominoes
    |> sort_numbers_by_count
    |> group_and_arrange_by_number
    |> join
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
    [arrange(matches, number)|group({dominoes -- matches, numbers})]
  end

  def arrange dominoes, number do
    Enum.map dominoes, fn [h,t] -> number == h && [h,t] || [t,h] end
  end

  def join dominoes do
  end

end