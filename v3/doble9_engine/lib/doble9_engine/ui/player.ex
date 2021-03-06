defmodule Doble9Engine.UI.Player do

  alias Doble9Engine.Player
  alias Doble9Engine.UI.{Domino, Label}
  import Map, only: [merge: 2]
  import Enum, only: [with_index: 1, map: 2, zip: 2]
  import Doble9Engine.UI.Assets
  import Doble9Engine.Helpers

  @positions [:bottom, :right, :top, :left]

  def render_players %{game: %{players: players}} = game do
    players |> zip(@positions) |> map(&(render_player &1, game))
  end

  def render_player {player, at}, %{game: %{finished: finished}} = game do
    show = at == :bottom || finished != nil
    render_at at, merge(game, %{player: the(player), show: show})
  end

  def render_player(%{game: %{finished: finished}, player: %{name: name}, blink: blink} = player) when finished != nil do
    player = merge player, %{selected: name == finished[:winner] and blink}
    [
      render_name(player),
      render_dominoes(player),
      render_count(player),
    ]
  end

  def render_player player do
    [
      render_name(player),
      render_dominoes(player)
    ]
  end

  def render_at :top, player do
    render_axis merge player, %{axis: :x, count_at: :right, top: 0}
  end

  def render_at :left, player do
    render_axis merge player, %{axis: :y, count_at: :bottom, left: 0}
  end

  def render_at :right, %{window: %{width: width}} = player do
    render_axis merge player, %{axis: :y, count_at: :bottom, left: width - width(:x)}
  end

  def render_at :bottom, %{window: %{height: height}} = player do
    render_axis merge player, %{axis: :x, count_at: :right, top: height - height(:y)}
  end

  def render_axis %{axis: :x, player: %{dominoes: dominoes}, window: %{width: width}} = player do
    render_player merge player, %{label_at: :left, count_at: :right, dy: 0, dx: width(:y), left: div(width - (width(:y) * length(dominoes)), 2)}
  end

  def render_axis %{axis: :y, player: %{dominoes: dominoes}, window: %{height: height}} = player do
    render_player merge player, %{label_at: :top, dx: 0, dy: height(:x), top: div(height - (height(:x) * length(dominoes)), 2)}
  end

  def render_name %{selected: selected, label_at: label_at, axis: axis, player: %{name: name, dominoes: dominoes}, top: top, left: left, } do
    {width, height} = size dominoes, axis
    Label.render %{text: "#{name}" |> String.slice(0..2), selected: selected, at: label_at, ref: %{left: left, top: top, width: width, height: height}}
  end

  def render_name %{label_at: label_at, axis: axis, player: %{name: name, dominoes: dominoes}, top: top, left: left, } do
    {width, height} = size dominoes, axis
    Label.render %{text: "#{name}" |> String.slice(0..2), at: label_at, ref: %{left: left, top: top, width: width, height: height}}
  end

  def render_count %{selected: selected, count_at: count_at, axis: axis, player: %{name: name, dominoes: dominoes}, top: top, left: left} do
    {width, height} = size dominoes, axis
    {_,count} = Player.count name
    text = length(dominoes) == 0 && "won" || count
    Label.render %{text: text, selected: selected, at: count_at, ref: %{left: left, top: top, width: width, height: height}}
  end

  def render_count %{count_at: count_at, axis: axis, player: %{name: name, dominoes: dominoes}, top: top, left: left} do
    {width, height} = size dominoes, axis
    {_,count} = Player.count name
    Label.render %{text: count, at: count_at, ref: %{left: left, top: top, width: width, height: height}}
  end

  def render_dominoes %{axis: axis, player: %{dominoes: dominoes}, top: top, left: left, dx: dx, dy: dy} = player do
    for {domino, i} <- with_index dominoes do
      render_domino merge player, %{domino: domino, axis: other(axis), left: left + i * dx, top: top + i * dy}
    end
  end

  def render_domino %{domino: domino, player: %{turn: %{choices: choices}}, selected: selected} = player do
    Domino.render merge Domino.from(player), %{
      available: domino in (map choices, fn {domino,_} -> domino end),
      selected: selected == domino
    }
  end

  def render_domino %{selected: selected} = player do
    Domino.render merge Domino.from(player), %{selected: selected}
  end

  def render_domino player do
    Domino.render Domino.from player
  end

end
