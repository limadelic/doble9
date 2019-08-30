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

  def switch nil do nil end
  def switch :head do :tail end
  def switch :tail do :head end

  def target nil, _ do nil end
  def target _, [] do [:head, :tail] end
  def target x, x do [:head, :tail] end
  def target [x,_], [x,x] do [:head, :tail] end
  def target [_,x], [x,x] do [:head, :tail] end
  def target [h,t], [t,h] do [:head, :tail] end
  def target [h,_], [h,_] do :head end
  def target [h,_], [_,h] do :tail end
  def target [_,t], [_,t] do :tail end
  def target [_,t], [t,_] do :head end
  def target _, _ do nil end

end