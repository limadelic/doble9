defmodule GameTest do
  use ExUnit.Case

  alias Doble9Engine.{Game, Player}
  import Player, only: [login: 1, new_game: 2]
  import TestHelper, only: [the: 1, p: 1]

  @game :calle8
  @player :mike

  describe "new single player game" do

    setup do
      login @player
      new_game @player, @game
      %{player: the(@player), game: the(@game)}
    end

    test "player picked 10 dominoes", %{player: %{dominoes: dominoes}} = _ do
      assert length(dominoes) == 10
    end

  end

end
