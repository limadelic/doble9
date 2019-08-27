defmodule Doble9Engine.Helpers do

  import Enum, only: [find_index: 2, at: 2]

  def the server do :sys.get_state server end

  def given server, state do :sys.replace_state server, state end

  def p x do IO.puts x end
  def i x do IO.inspect x, charlists: :as_lists end

  def next [first|_], nil do first end
  def next [first|_] = list, item do
    at list ++ [first], find_index(list, &(&1 == item)) + 1
  end

end