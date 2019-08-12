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

  describe "Turn" do

    setup do
      start
      join @player, @game
      %{ game: the(@game), player: the(@player) }
    end

    test "it's first player turn", %{game: game, player: player} do
      assert game.turn == @player
      assert player.turn
    end

  end

  describe "Play" do

    @dominoes [[9|9],[9|8],[9|7],[8|8],[7|7]]

    setup do
      Game.start %{name: @game, players: [@player]}
      Player.start %{name: @player, game: @game, dominoes: @dominoes}
      Enum.map @dominoes, &(play @player, &1)
      %{game: the(@game), player: the(@player)}
    end

    test "play all in a row", %{game: game, player: player} = _ do
      assert game.table.dominoes == [[8|8],[8|9],[9|9],[9|7],[7|7]]
      assert player.dominoes == []
    end

  end

  describe "Auto-play" do

    setup do
#      Game.start %{name: @game, players: [@player]}
#      Player.start %{name: @player, game: @game, dominoes: @dominoes, }
#      %{game: the(@game), player: the(@player)}
    end
  end

  defp start _ \\ nil do
    {:ok, _} = Game.start %{name: @game}
    {:ok, _} = Player.start %{name: @player}
    :ok
  end

end
