defmodule Doble9Engine.UI.Score do

  alias Doble9Engine.UI.Label

  def render %{game: %{score: score}} do
    Label.render %{text: score, size: :m, top: 0, left: 0}
  end

end