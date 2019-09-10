defmodule Doble9Engine.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    rat_opts = [
      app: Doble9Engine.UI,
      shutdown: {:application, :doble9},
    ]

    children = [
#      {Ratatouille.Runtime.Supervisor, runtime: rat_opts}
      # Starts a worker by calling: Doble9Engine.Worker.start_link(arg)
      # {Doble9Engine.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Doble9Engine.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def stop _ do
    System.halt()
  end

end
