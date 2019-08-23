defmodule Doble9Engine.Helpers do

  def the server do :sys.get_state server end

  def given server, state do :sys.replace_state server, state end

  def p x do IO.puts x end
  def i x do IO.inspect x, charlists: :as_lists end

end