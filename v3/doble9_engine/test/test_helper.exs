ExUnit.start()

defmodule TestHelper do

  def the server do :sys.get_state server end

  def p x do IO.puts inspect x end

end
