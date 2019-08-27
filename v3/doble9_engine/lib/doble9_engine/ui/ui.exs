defmodule Doble9Engine.UI do
  @behaviour Ratatouille.App

  import Ratatouille.View

  alias Doble9Engine.UI.{Game, Controller}

  def init game do Controller.init game end

  def update game, event do Controller.update game, event end

  def render %{window: %{height: height, width: width}} = game do
    view do
      canvas height: height, width: width do
        Game.render game
      end
    end
  end

end

Ratatouille.run Doble9Engine.UI
