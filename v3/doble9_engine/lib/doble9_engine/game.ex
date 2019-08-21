defmodule Doble9Engine.Game do
  use GenServer
  alias Doble9Engine.Player
  import Player, only: [turn: 2, turn: 1, start_bot: 2, count: 1]
  import Enum, only: [shuffle: 1, take: 2, drop: 2, find_index: 2, at: 2, sort: 2, map: 2, filter: 2]

  def create game, player do GenServer.start_link __MODULE__, {game, player}, name: game end
  def new game do GenServer.call game, :new end
  def pick game do GenServer.call game, :pick end
  def play game, player, domino do GenServer.call game, {:play, player, domino} end
  def win game, player, domino do GenServer.call game, {:win, player, domino} end
  def knock game, player do GenServer.call game, {:knock, player} end

  def init {game, player} do
    start_bots()
    turn player
    {:ok, start(game, player)}
  end

  @dominoes for x <- 0..9, y <- x..9, do: [x,y]
  @bots [:chino, :angel, :aurelio]

  def start game, player do
    %{
      name: game,
      table: %{
        dominoes: [],
        heads: []
      },
      dominoes: shuffle(@dominoes),
      players: [player|@bots],
      finished: nil,
      knocks: 0
    }
  end

  def start_bots do
    for bot <- @bots do send self(), {:start_bot, bot} end
  end

  def handle_call :new, _, %{name: name, players: [player|_] = players} = _ do
    for player <- players do send player, :pick end
    turn player
    {:reply, :ok, start(name, player)}
  end

  def handle_call :pick, _, %{dominoes: dominoes} = game do
    {:reply, {:ok, take(dominoes, 10)}, %{game | dominoes: drop(dominoes, 10)}}
  end

  def handle_call {:play, player, domino}, _, game do
    {:reply, :ok, game |> played(domino) |> call_next(player)}
  end

  def handle_call {:win, player, domino}, _, game do
    {:reply, :ok, game |> played(domino) |> won(player)}
  end

  def handle_call {:knock, _}, _, %{knocks: 3} = game do
    send self(), :stucked
    {:reply, :ok, game |> knocked}
  end

  def handle_call {:knock, player}, _, game do
    {:reply, :ok, game |> knocked |> call_next(player)}
  end

  def handle_info {:start_bot, bot}, %{name: name} = game do
    start_bot bot, name
    {:noreply, game}
  end

  def handle_info :stucked, %{players: players} = game do
    {:noreply, game |> pick_winners(sorted_scores players) |> announce_winners}
  end

  def won game, player do
    %{game | finished: %{winner: player}}
  end

  def knocked %{knocks: knocks} = game do
    %{game | knocks: knocks + 1}
  end

  def sorted_scores players do
    players
      |> map(&(scored count(&1), &1))
      |> sort(&(&1.score <= &2.score))
  end

  def scored {:ok, count}, player do %{player: player, score: count} end

  def pick_winners game, [%{score: tie},%{score: tie}|_] = scores do
    %{game | finished: %{winners: scores |> filter(&(&1.score == tie)) |> map(&(&1.player))}}
  end

  def pick_winners game, [%{player: winner}|_] = _ do
    %{game | finished: %{winner: winner}}
  end

  def announce_winners %{finished: %{winners: winners}} = game do
    for winner <- winners do send winner, :won end
    game
  end

  def announce_winners %{finished: %{winner: winner}} = game do
    send winner, :won
    game
  end

  def played %{table: %{dominoes: []}} = game, domino do
    place game, [domino], domino
  end

  def played %{table: %{dominoes: dominoes, heads: [head,table_tail]}} = game, [head,tail] = _ do
    place game, [[tail,head]] ++ dominoes, [tail,table_tail]
  end

  def played %{table: %{dominoes: dominoes, heads: [table_head,head]}} = game, [head,tail] = domino do
    place game, dominoes ++ [domino], [table_head,tail]
  end

  def played %{table: %{dominoes: dominoes, heads: [table_head,tail]}} = game, [head,tail] = _ do
    place game, dominoes ++ [[tail,head]], [table_head,head]
  end

  def played %{table: %{dominoes: dominoes, heads: [tail,table_tail]}} = game, [head,tail] = domino do
    place game, [domino] ++ dominoes, [head,table_tail]
  end

  def place game, dominoes, heads do
    %{game | table: %{dominoes: dominoes, heads: heads}, knocks: 0}
  end

  def call_next %{players: players, table: %{heads: heads}} = game, player do
    turn next(player, players), heads
    game
  end

  def next player, [first|_] = players do
    at players ++ [first], find_index(players, &(&1 == player)) + 1
  end

end
