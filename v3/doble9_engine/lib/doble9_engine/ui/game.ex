defmodule Doble9Engine.UI.Game do

  alias Doble9Engine.UI.{Player, Table}

  def render game do
    [
      Player.render_players(game),
      Table.render(game)
    ]
  end

end
