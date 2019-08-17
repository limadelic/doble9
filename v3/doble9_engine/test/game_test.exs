defmodule GameTest do
  use ExUnit.Case

  alias Doble9Engine.{Game, Player}
  import Player, only: [login: 1, new_game: 2, play: 2]
  import TestHelper, only: [the: 1, p: 1]

  @game :calle8
  @player :mike

  describe "single player game" do

    setup do
      login @player
      new_game @player, @game

      %{player: the(@player), game: the(@game)}
    end

    test "player picked 10 dominoes", %{player: %{dominoes: dominoes}} = _ do
      assert length(dominoes) == 10
    end

    test "there r 4 players ready", %{game: %{players: players}} = _ do
      assert length(players) == 4
      for %{dominoes: dominoes} = _ <- players do
        assert length(dominoes) == 10
      end
    end

    test "start", %{player: %{dominoes: [domino|_]}} = _ do
      play @player, domino
    end

  end

end
