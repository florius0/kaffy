defmodule Kaffy.MixProject do
  use Mix.Project

  @source_url "https://github.com/aesmail/kaffy"
  @version "0.9.4"

  def project do
    [
      app: :kaffy,
      version: @version,
      elixir: "~> 1.10",
      compilers: [:phoenix] ++ Mix.compilers(),
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      name: "Kaffy",
      deps: deps(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Kaffy.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/fixtures"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.5"},
      {:phoenix_html, "~> 3.0"},
      {:mock, "~> 0.3.0", only: :test},
      {:ecto, "~> 3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:jason, "~> 1.3", only: :test}
    ]
  end

  defp description() do
    "Powerfully simple admin package for phoenix applications"
  end

  defp package() do
    [
      maintainers: ["Abdullah Esmail"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url,
        "Demo" => "https://kaffy.fly.dev/admin/"
      }
    ]
  end

  def docs() do
    [
      extras: [
        "CHANGELOG.md": [],
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      assets: "assets",
      source_url: @source_url,
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/kaffy",
      formatters: ["html"]
    ]
  end
end
