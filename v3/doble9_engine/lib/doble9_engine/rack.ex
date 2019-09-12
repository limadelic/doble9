defmodule Doble9Engine.Rack do

  def sort dominoes do
    dominoes |> count |> group |> join
  end

  def count dominoes do
    0..9
    |> Enum.map(&({&1, Enum.count(dominoes, fn x -> &1 in x end)}))
    |> Enum.sort(fn {_,x}, {_,y} -> x >= y end)
    |> Enum.map(fn {x,_} -> x end)
  end

  def group [], _ do [] end
  def group {dominoes, [number|numbers]} do
    matches = Enum.filter dominoes, &(number in &1)
    matches ++ group(dominoes -- matches, numbers)
  end

  def join dominoes do
  end

end