defmodule Doble9Engine.Game do
  use GenServer
  alias Doble9Engine.Player
  import Enum, only: [shuffle: 1, take: 2, drop: 2, find_index: 2, at: 2]

  def create game, player do GenServer.start_link __MODULE__, %{name: game, player: player}, name: game end
  def pick game do GenServer.call game, :pick end
  def play game, player, domino do GenServer.call game, {:play, player, domino} end

  def init %{player: player} = game do
    start_bots
    Player.turn player
    {:ok, new game }
  end

  @dominoes for x <- 0..9, y <- x..9, do: [x,y]
  @bots [:chino, :angel, :aurelio]

  def new %{name: name, player: player} = game do
    %{
      name: name,
      table: %{
        dominoes: [],
        heads: []
      },
      dominoes: shuffle(@dominoes),
      players: [player|@bots],
    }
  end

  def start_bots do
    for bot <- @bots do send self, {:start_bot, bot} end
  end

  def handle_info {:start_bot, bot}, %{name: name} = game do
    Player.start_bot bot, name
    {:noreply, game}
  end

  def handle_call :pick, _, %{dominoes: dominoes} = game do
    {:reply, {:ok, take(dominoes, 10)}, %{game | dominoes: drop(dominoes, 10)}}
  end

  def handle_call {:play, player, domino}, _, game do
    game = played domino, game
    Player.turn next(player, game.players), game.table.heads
    {:reply, :ok, game}
  end

  def played domino, %{table: %{dominoes: []}} = game do
    place game, [domino], domino
  end

  def played [head,tail] = domino, %{table: %{dominoes: dominoes, heads: [table_head|table_tail]}} = game do
    cond do
      head == table_head -> place game, [[tail|head]] ++ dominoes, [tail|table_tail]
      head == table_tail -> place game, dominoes ++ [domino], [table_head|tail]
      tail == table_tail -> place game, dominoes ++ [[tail|head]], [table_head|head]
      tail == table_head -> place game, [domino] ++ dominoes, [head|table_tail]
    end
  end

  def place game, dominoes, heads do
    %{game | table: %{dominoes: dominoes, heads: heads}}
  end

  def next player, [first|_] = players do
    players = players ++ [first]
    at players, find_index(players, &(&1 == player)) + 1
  end

end
