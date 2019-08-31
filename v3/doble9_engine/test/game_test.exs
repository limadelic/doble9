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

  describe "single player game" do

    setup do
      %{player: the(@player), game: the(@game)}
    end

    test "player picked 10 dominoes", %{player: %{dominoes: dominoes}} do
      assert length(dominoes) == 10
    end

    test "there r 4 players ready", %{game: %{players: players}} do
      assert length(players) == 4
      for player <- players do
        assert length(the(player).dominoes) == 10
      end
    end

    test "player could start with any domino", %{player: %{dominoes: dominoes, turn: %{choices: choices}}} do
      assert length(dominoes) == length(choices)
      Enum.map choices, fn {_,target} -> assert target == [:head, :tail] end
    end

  end

  describe "play" do

    setup do
      %{turn: %{choices: [{domino, target}|_]}} = the @player
      play @player, domino, target
      %{player: the(@player), game: the(@game), domino: domino}
    end

    test "its the start", %{domino: domino, game: %{table: table}} do
      assert domino == table.start
    end

    test "played domino", %{player: player, domino: domino, game: %{table: table}} do
      assert player.played == domino
      assert domino in table.dominoes
    end

    test "the other players played", %{game: %{players: [_|players]}} do
      :timer.sleep 1
      for other <- players do
        assert the(other).played || the(other).knocked
      end
    end

    test "is ready to play again" do
      :timer.sleep 1
      assert the(@player).turn
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
      play @player, [9,8], :tail
    end

    test "its done" do
      assert the(@game).finished
    end

    test "player wins" do
      assert the(@game).finished.winner == @player
      assert the(@player).won
    end

  end

  describe "stuck in the middle" do

    setup do
      :timer.sleep 5
      given @game, &(%{&1| knocks: 3, table: %{
        heads: [9,9],
        dominoes: [[9,9]],
      }})
      given @player, &(%{&1| dominoes: [[0,0]]})
    end

    test "it's over" do
      knock @player
      assert the(@game).finished
    end

    test "player wins" do
      knock @player
      assert the(@game).finished.winner == @player
      assert the(@player).won
    end

    test "with you" do
      given :chino, &(%{&1| dominoes: [[0,0]]})
      knock @player

      assert the(@game).finished.winners == [@player, :chino]
      assert the(@player).won
      assert the(:chino).won
    end

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
