defmodule Doble9Engine.UI.Player do

  alias Doble9Engine.Player
  alias Doble9Engine.UI.{Domino, Label}
  import Map, only: [merge: 2]
  import Enum, only: [with_index: 1, map: 2]
  import Doble9Engine.UI.Assets

  def render_player(%{finished: finished} = player) when finished != nil do
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

  def render %{at: :top} = player do
    render_axis merge player, %{axis: :x, count_at: :bottom, top: 0}
  end

  def render %{at: :left} = player do
    render_axis merge player, %{axis: :y, count_at: :right, left: 0}
  end

  def render %{at: :right, window: %{width: width}} = player do
    render_axis merge player, %{axis: :y, count_at: :left, left: width - width(:x)}
  end

  def render %{at: :bottom, window: %{height: height}} = player do
    render_axis merge player, %{axis: :x, count_at: :top, top: height - height(:y)}
  end

  def render_axis %{axis: :x, player: %{dominoes: dominoes}, window: %{width: width}} = player do
    render_player merge player, %{label_at: :left, count_at: :right, dy: 0, dx: width(:y), left: div(width - (width(:y) * length(dominoes)), 2)}
  end

  def render_axis %{axis: :y, player: %{dominoes: dominoes}, window: %{height: height}} = player do
    render_player merge player, %{label_at: :top, dx: 0, dy: height(:x), top: top = div(height - (height(:x) * length(dominoes)), 2)}
  end

  def render_name %{label_at: label_at, axis: axis, player: %{name: name, dominoes: dominoes}, top: top, left: left, } = player do
    {width, height} = size dominoes, axis
    Label.render %{text: "#{name}" |> String.slice(0..2), at: label_at, ref: %{left: left, top: top, width: width, height: height}}
  end

  def render_count %{count_at: count_at, axis: axis, player: %{name: name, dominoes: dominoes}, top: top, left: left, } = player do
    {width, height} = size dominoes, axis
    {_,count} = Player.count name
    Label.render %{text: count, at: count_at, ref: %{left: left, top: top, width: width, height: height}}
  end

  def render_dominoes %{axis: axis, label_at: label_at, player: %{name: name, dominoes: dominoes}, show: show, top: top, left: left, dx: dx, dy: dy} = player do
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

  def render_domino %{domino: _} = player do
    Domino.render Domino.from player
  end

end
