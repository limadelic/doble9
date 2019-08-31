defmodule Doble9Engine.Target do

  import List, only: [last: 1]
  import Map, only: [merge: 2]

  def for nil, _ do nil end
  def for _, [] do [:head, :tail] end
  def for x, x do [:head, :tail] end
  def for [x,_], [x,x] do [:head, :tail] end
  def for [_,x], [x,x] do [:head, :tail] end
  def for [h,t], [t,h] do [:head, :tail] end
  def for [h,_], [h,_] do :head end
  def for [h,_], [_,h] do :tail end
  def for [_,t], [_,t] do :tail end
  def for [_,t], [t,_] do :head end
  def for _, _ do nil end

  def of nil, _, _, _ do nil end
  def of :head, start, head, _ do of start, head end
  def of [:head,_], start, head, _ do of start, head end
  def of :tail, start, _, tail do of start, tail end
  def of [:tail,_], start, _, tail do of start, tail end
  def of start, [] do set start end
  def of _, head do set last head end

  def set domino do merge domino, %{target: true} end

end