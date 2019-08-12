defmodule GameTest do
  use ExUnit.Case

  alias Doble9Engine.{Game, Player}
  import Player, only: [join: 2, pick: 1, play: 2]
  import TestHelper, only: [the: 1, p: 1]

  @game :calle8
  @player :mike

  describe "Start" do

    setup do
      start
      %{game: the(@game), player: the(@player)}
    end

    test "there r no players", %{game: %{players: players}} = _ do
      assert players == []
    end

    test "there r 55 dominoes", %{game: %{dominoes: dominoes}} = _ do
      assert length(dominoes) == 55
    end

    test "the table is empty", %{game: %{table: table}} = _ do
      assert table.dominoes == []
      assert table.heads == []
    end

    test "the player is not in the game", %{player: player} = _ do
      assert player.game == nil
    end

    test "the player has no dominoes", %{player: player} = _ do
      assert player.dominoes == []
    end

  end

  describe "Join" do

    setup [:start]

    test "joined" do
      assert join @player, @game
      assert @player in (the(@game).players)
      assert the(@player).game == @game
    end

  end

  describe "Pick" do

    setup do
      start
      :ok = join @player, @game
      :ok = pick @player
      %{ game: the(@game), player: the(@player) }
    end

    test "picks 10 dominoes", %{game: game, player: %{dominoes: dominoes}} = _ do
      assert length(dominoes) == 10
      refute Enum.any? dominoes, &(&1 in game.dominoes)
    end

  end

  describe "Play" do

    setup do
      start
      :ok = join @player, @game
      :ok = pick @player
      %{dominoes: the(@player).dominoes}
    end

    test "start", %{dominoes: [domino|_]} = _ do
      assert play @player, domino
      assert the(@game).table.dominoes == [domino]
      refute domino in the(@player).dominoes
    end

  end

  defp start _ \\ nil do
    {:ok, _} = Game.start %{name: @game}
    {:ok, _} = Player.start %{name: @player}
    :ok
  end

end
