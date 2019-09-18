defmodule Doble9Engine.UI.Game do

  alias Doble9Engine.UI.{Player, Table, Score}

  def render game do
    [
      Player.render_players(game),
      Table.render(game),
      Score.render(game)
    ]
  end

end
