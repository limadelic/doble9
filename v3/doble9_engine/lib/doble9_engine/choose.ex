defmodule Doble9Engine.Choose do

  import Enum, only: [sort: 2, sum: 1, find: 2, at: 3]

  def best choices do
    starting?(choices) && start(choices) || first(choices)
  end

  def first choices do at choices || [], 0, {nil,nil} end

  def starting? choices do length(choices || []) == 10 end

  def start choices do
    big_double(choices) || biggest(choices)
  end

  def big_double choices do
    choices |> sorted |> find(fn {[h,t],_} -> h == t and h >= 4 end)
  end

  def biggest choices do
    choices |> sorted |> first
  end

  def sorted choices do
    sort choices, fn {x,_}, {y,_} -> sum(x) >= sum(y) end
  end

end