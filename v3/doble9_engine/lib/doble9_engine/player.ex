defmodule Doble9Engine.Player do
  alias Doble9Engine.{Game, Target, Rack}
  use GenServer
  import List, only: [flatten: 1]
  import Enum, only: [filter: 2, sum: 1, map: 2]
  import Map, only: [merge: 2]

  def login player do GenServer.start_link __MODULE__, %{name: player}, name: player end
  def start_bot bot, game do GenServer.start_link __MODULE__, %{name: bot, bot: true, game: game}, name: bot end
  def new_game player, game do GenServer.call player, {:new_game, game} end

  def pick player do GenServer.call player, :pick end
  def turn player, heads \\ [] do GenServer.cast player, {:turn, heads} end
  def play player, domino, target do GenServer.call player, {:play, domino, target}  end
  def knock player do GenServer.call player, :knock end
  def count player do GenServer.call player, :count end

  @defaults %{
    game: nil,
    dominoes: [],
    turn: nil,
    played: nil,
    knocked: nil,
    won: false,
  }

  def init %{bot: true} = player do
    send self(), :pick
    new player
  end
  def init player do new player end

  def new player do {:ok, merge(@defaults, player)} end

  def handle_call {:new_game, game}, _, %{name: name} = player do
    created Game.create(game, name), game, player
  end

  def handle_call {:play, domino, target}, _, %{name: name, game: game, dominoes: [_|[]]} = player do
    {:reply, :ok, won(Game.win(game, name, domino, target), player)}
  end

  def handle_call {:play, domino, target}, _, %{name: name, game: game} = player do
    {:reply, :ok, played(Game.play(game, name, domino, target), domino, player)}
  end

  def handle_call :knock, _, %{name: name, game: game} = player do
    {:reply, :ok, knocked(Game.knock(game, name), player)}
  end

  def handle_call :count, _, %{dominoes: dominoes} = player do
    {:reply, {:ok, dominoes |> flatten |> sum}, player}
  end

  def handle_cast {:turn, heads}, %{bot: true} = player do
    send self(), :play
    {:noreply, turned(heads, player)}
  end
  def handle_cast {:turn, heads}, player do
    {:noreply, turned(heads, player)}
  end

  def handle_info :pick, %{game: game} = player do
    {:noreply, picked(Game.pick(game), player)}
  end

  def handle_info :play, %{game: game, name: name, turn: %{choices: []}} = player do
    {:noreply, knocked(Game.knock(game, name), player)}
  end
  def handle_info :play, %{game: game, name: name, turn: %{choices: [{domino,target}|_]}, dominoes: [_|[]]} = player do
    {:noreply, won(Game.win(game, name, domino, target), player)}
  end
  def handle_info :play, %{game: game, name: name, turn: %{choices: [{domino,target}|_]}} = player do
    {:noreply, played(Game.play(game, name, domino, target), domino, player)}
  end

  def handle_info :won, player do
    {:noreply, %{player | won: true}}
  end

  def created {:ok, _}, game, player do
    send self(), :pick
    {:reply, :ok, %{player | game: game}}
  end

  def picked({:ok, dominoes}, %{turn: turn} = player) when turn != nil do
    dominoes = Rack.sort dominoes
    %{player | dominoes: dominoes, turn: %{turn | choices: choices(dominoes,[])}}
  end
  def picked {:ok, dominoes}, player do
    %{player | dominoes: Rack.sort(dominoes)}
  end

  def knocked :ok, %{turn: %{heads: heads}} = player do
    %{player | turn: nil, knocked: heads }
  end

  def played :ok, domino, %{dominoes: dominoes} = player do
    %{player | turn: nil, played: domino, dominoes: filter(dominoes, &(&1 -- domino != []))}
  end

  def won :ok, %{dominoes: [domino]} = player do
    %{player | turn: nil, played: domino, dominoes: [], won: true}
  end

  def turned heads, %{dominoes: dominoes} = player do
    %{player | played: nil, knocked: nil, turn: %{heads: heads, choices: choices(dominoes, heads)}}
  end

  def choices dominoes, heads do
    dominoes
    |> map(&({&1, Target.select(&1, heads)}))
    |> filter(fn {_, target} -> target != nil end)
  end

end
