defmodule GameTest do
  use ExUnit.Case

  alias Doble9Engine.{Game, Player}
  import Player, only: [login: 1, new_game: 2]
  import TestHelper, only: [the: 1, p: 1]

  @game :calle8
  @player :mike

  test "new single player game" do
    login @player
#    new_game @player, @game
  end

end
