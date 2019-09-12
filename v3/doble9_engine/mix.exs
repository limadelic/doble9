defmodule Doble9Engine.MixProject do
  use Mix.Project

  def project do
    [
      app: :doble9_engine,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Doble9Engine.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ratatouille, "~> 0.5"},
      {:distillery, "2.0.14"}
    ]
  end

  defp aliases do
    [
      test: "test --no-start" #(2)
    ]
  end
end
