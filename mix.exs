defmodule Filtrex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :filtrex,
      version: "0.4.3",
      elixir: "~> 1.6",
      description: description(),
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      name: "Filtrex",
      docs: [main: "Filtrex", source_url: "https://github.com/rcdilorenzo/filtrex"]
    ]
  end

  defp elixirc_paths(:test), do: ~w(lib test/support)
  defp elixirc_paths(_), do: ~w(lib)

  def application do
    [extra_applications: [:logger, :tzdata] ++ applications(Mix.env())]
  end

  defp applications(:test), do: [:postgrex, :ecto, :ex_machina]
  defp applications(_), do: []

  defp description do
    """
    A library for performing and validating complex filters from a client (e.g. smart filters)
    """
  end

  defp deps do
    [
      {:postgrex, ">= 0.0.0", only: :test},
      {:ecto, "~> 3.12.5"},
      {:ecto_sql, "~> 3.12.1"},
      {:timex, "~> 3.7.11"},
      {:earmark, "~> 1.4.17", only: :dev},
      {:ex_doc, "~> 0.35", only: :dev},
      {:inch_ex, ">= 0.0.0", only: [:dev, :docs]},
      {:plug, "~> 1.16.1", only: :test},
      {:ex_machina, "~> 2.8.0", only: :test},
      {:mix_test_watch, "~> 0.3", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Christian Di Lorenzo"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/rcdilorenzo/filtrex",
        "Docs" => "http://rcdilorenzo.github.io/filtrex"
      }
    ]
  end
end
