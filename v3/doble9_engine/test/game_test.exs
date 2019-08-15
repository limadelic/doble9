defmodule GameTest do
  use ExUnit.Case

  alias Doble9Engine.{Game, Player}
  import Player, only: [join: 2, pick: 1, play: 2]
  import TestHelper, only: [the: 1, p: 1]

  @game :calle8
  @player :mike

end
