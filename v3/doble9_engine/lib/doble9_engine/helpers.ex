defmodule Doble9Engine.Helpers do

  def the server do :sys.get_state server end

  def given server, state do :sys.replace_state server, state end

  def p x do IO.puts x end
  def i x do IO.inspect x, charlists: :as_lists end

  def prev _, nil do nil end
  def prev [first|_] = list, first do List.last list end
  def prev list, item do
    Enum.at list, Enum.find_index(list, &(&1 == item)) - 1
  end

  def next _, nil do nil end
  def next [first|_] = list, item do
    Enum.at list ++ [first], Enum.find_index(list, &(&1 == item)) + 1
  end

  def target nil, _ do nil end
  def target domino, [] do nil end
  def target([h,_], [th, tt]) when h in [th, tt] do h end
  def target([_,t], [th, tt]) when t in [th, tt] do t end
  def target _, _ do nil end

end