defmodule GameErrorsTest do
  use ExUnit.Case

  alias Doble9Engine.{Game, Player}
  import Player, only: [join: 2, pick: 1]

  @game :calle8
  @player :mike

  setup do
    {:ok, _} = Game.start %{name: @game}
    {:ok, _} = Player.start %{name: @player}
    :ok
  end

  test "already in game" do
    :ok = join @player, @game

    assert join(@player, @game) == {:error, "already in game"}
  end

  test "game full" do
    Enum.map [:w, :x, :y, :z], fn player ->
      {:ok, _} = Player.start %{name: player}
      :ok = join player, @game
    end

    assert join(@player, @game) == {:error, "game full"}
  end

  test "can't pick unless joined" do
    assert pick(@player) == { :error, "need to join a game first" }
  end

  test "can't pick twice" do
    :ok = join @player, @game
    :ok = pick @player

    assert pick(@player) == { :error, "picked already" }
  end


end