defmodule Todo.Mixfile do
  use Mix.Project

  def project do
    [
      app: :todo,
      version: "0.0.1",
      elixir: "~> 1.0",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix] ++ Mix.compilers,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Todo, []},
     applications: [:phoenix, :cowboy, :logger, :crypto]]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:plug_cors, "~> 0.7"},
      {:phoenix, "~> 0.14"},
      {:phoenix_ecto, "~> 0.5"},
      {:phoenix_html, "~> 1.1"},
      {:phoenix_live_reload, "~> 0.4"},
      {:postgrex, ">= 0.0.0"},
      {:cowboy, "~> 1.0"},
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]
end
