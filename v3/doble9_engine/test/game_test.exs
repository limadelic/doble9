defmodule GameTest do
  use ExUnit.Case

  alias Doble9Engine.{Player, Helpers, Game}
  import Player, only: [login: 1, new_game: 2, play: 3, knock: 1, turn: 2]
  import Helpers
  import Game, only: [new: 1]

  @game :calle8
  @player :mike

  setup do
    login @player
    new_game @player, @game
  end

  describe "play a game" do

    setup do play the @game end

    test "plays a whole game", %{finished: finished} = _ do
      assert i finished
    end

  end

  describe "play another" do

    setup do
      play the @game
      new @game
      %{player: the(@player), game: the(@game)}
    end

    test "player picked 10 dominoes", %{player: %{dominoes: dominoes}} = _ do
      assert length(dominoes) == 10
    end

    test "there r 4 players ready", %{game: %{players: players}} = _ do
      assert length(players) == 4
      for player <- players do
        assert length(the(player).dominoes) == 10
      end
    end

    test "player could start with any domino", %{player: %{dominoes: dominoes, turn: %{choices: choices}}} = _ do
      assert length(dominoes) == length(choices)
    end

  end

  def play %{finished: nil} do
    send @player, :play
    :timer.sleep 1
    play the @game
  end

  def play game do game end

end
