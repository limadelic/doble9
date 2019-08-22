defmodule Doble9Engine.Cli do

  alias Doble9Engine.{Player, Game, Helpers}
  import Helpers, only: [the: 1, p: 1]

  @game :calle8
  @player :mike

  def start do
    Player.login @player
    Player.new_game @player, @game
    dominoes()
  end

  def new do
    Game.new @game
    :timer.sleep 2
    dominoes()
  end

  def play domino do
    Player.play @player, domino
    dominoes()
    :timer.sleep 2
    table()
  end

  def dominoes do p the(@player).dominoes; :ok end
  def table do p the(@game).table; :ok end

  def domino x do
    p "         "
    p "┌───┬───┐"
    p "│ 9 │ 9 │"
    p "└───┴───┘"
    p "         "
    p "┌───┐"
    p "│ 9 │"
    p "├───┤"
    p "│ 9 │"
    p "└───┘"
    :ok
  end

end