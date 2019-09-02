defmodule Doble9Engine.Target do

  import List, only: [last: 1]
  import Map, only: [merge: 2]

  def select nil, _ do nil end
  def select _, [] do [:head, :tail] end
  def select x, x do [:head, :tail] end
  def select [x,_], [x,x] do [:head, :tail] end
  def select [_,x], [x,x] do [:head, :tail] end
  def select [h,t], [t,h] do [:head, :tail] end
  def select [h,_], [h,_] do :head end
  def select [h,_], [_,h] do :tail end
  def select [_,t], [_,t] do :tail end
  def select [_,t], [t,_] do :head end
  def select _, _ do nil end
  def select number, heads, default do
    select([number,number], heads) || default
  end

  def find nil, _, _, _ do nil end
  def find :head, start, head, _ do find start, head end
  def find [:head,_], start, head, _ do find start, head end
  def find :tail, start, _, tail do find start, tail end
  def find [:tail,_], start, _, tail do find start, tail end
  def find start, [] do find start end
  def find _, head do find last head end
  def find domino do merge domino, %{target: true} end

end