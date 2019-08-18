ExUnit.start()

defmodule TestHelper do

  def the server do :sys.get_state server end

  def given server, state do :sys.replace_state server, state end

  def p x do IO.inspect x end

end
