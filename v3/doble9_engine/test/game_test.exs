defmodule GameTest do
  use ExUnit.Case

  alias Doble9Engine.Player
  import Player, only: [login: 1, new_game: 2, play: 2, knock: 1, turn: 2]
  import TestHelper, only: [the: 1, p: 1, given: 2]

  @game :calle8
  @player :mike

  setup do
    login @player
    new_game @player, @game
  end

  describe "single player game" do

    setup do
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
      assert dominoes == choices
    end

  end

  describe "play" do

    setup do
      %{dominoes: [domino|_]} = the @player
      play @player, domino
      %{player: the(@player), game: the(@game), domino: domino}
    end

    test "played domino", %{player: player, domino: domino, game: %{table: table}} = _ do
      assert player.played == domino
      assert domino in table.dominoes
    end

    test "the other players played", %{game: %{players: [_|players]}} = _ do
      for other <- players do
        assert the(other).played
      end
    end

  end

  describe "knock" do

    setup do
      given @game, &(%{&1| table: %{
        heads: [9,9],
        dominoes: [[9,9]]
      }})
      given @player, &(%{&1| dominoes: [[0,0]]})
      turn @player, [9,9]
    end

    test "player should knock" do
      assert the(@player).turn.choices == []
    end

    test "bot knock" do
      send @player, :play
      assert the(@player).knocked == [9,9]
    end

    test "player knock" do
      knock @player
      assert the(@player).knocked == [9,9]
    end

  end

  describe "happy endings" do

    setup do
      given @game, &(%{&1| table: %{
        heads: [9,9],
        dominoes: [[9,9]]
      }})
      given @player, &(%{&1| dominoes: [[9,8]]})
      play @player, [9,8]
    end

    test "its done" do
      assert the(@game).finished
    end

    test "player wins" do
      assert the(@game).finished.winner == @player
      assert the(@player).won
    end

  end

end
