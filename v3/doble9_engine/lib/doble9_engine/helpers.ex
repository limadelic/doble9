defmodule Doble9Engine.Helpers do

  alias Doble9Engine.{Player, Game}

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

  def dominoes do p the(@player).dominoes end
  def table do p the(@game).table end

  def the server do :sys.get_state server end

  def given server, state do :sys.replace_state server, state end

  def p x do IO.inspect x, charlists: :as_lists end

end