defmodule GameTest do
  use ExUnit.Case

  alias Doble9Engine.Player
  import Player, only: [login: 1, new_game: 2, play: 2]
  import TestHelper, only: [the: 1, p: 1, given: 2]

  @game :calle8
  @player :mike

  describe "single player game" do

    setup do
      start
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

  describe "start" do

    setup do
      start
      %{dominoes: [domino|_]} = the @player
      send @player, :play
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
      start
      given @game, &(%{&1| table: %{
        heads: [9,9],
        dominoes: [[9,9]]
      }})
      given @player, &(%{&1| dominoes: [[0,0]]})
      Player.turn @player, [9,9]
    end

    test "player should knock" do
      assert the(@player).turn.choices == []
    end

    test "knock" do
      send @player, :play
      assert the(@player).knocked == [9,9]
    end

  end

  def start do
    login @player
    new_game @player, @game
  end

end
