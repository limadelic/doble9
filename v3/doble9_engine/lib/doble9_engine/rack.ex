defmodule Doble9Engine.Rack do

  import Doble9Engine.Helpers

  def sort dominoes do
    dominoes
    |> sort_numbers_by_count
    |> group_and_arrange_by_number
    |> join_groups
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

  def join_groups [group|groups] do join_groups [group], i groups end
  def join_groups joined, [] do flatten joined end
  def join_groups joined, [group|groups] do
    join_groups join_group(joined, group), groups
  end

  def join_group [], group do [group] end
  def join_group [first|rest], group do
    can_join?(first,group)
    && [join_group!(first,group)|rest]
    || [first|join_group(rest,group)]
  end

  def can_join? joined, group do
    can_join?(:left, joined, group)
    || can_join?(:right, joined, group)
  end
  def can_join? :left, joined, group do
    false
  end
  def can_join? :right, joined, group do
    false
  end

  def join_group! joined, group do

  end

  def flatten [] do [] end
  def flatten [group|groups] do group ++ flatten(groups) end

end