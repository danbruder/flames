defmodule <%= @project_name_camel_case %>.Mixfile do
  use Mix.Project

  def project do
    [
      app: :<%= @project_name %>,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      build_embedded: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      docs: docs(),
      preferred_cli_env: [coveralls: :test],
      test_coverage: [tool: ExCoveralls],
      dialyzer: [
        flags: [:unmatched_returns, :error_handling, :race_conditions, :underspecs],
        ignore_warnings: "dialyzer.ignore-warnings"
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {<%= @project_name_camel_case %>.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:credo, "~> 0.7", only: [:dev, :test]},
      {:ex_doc, "~> 0.15", only: [:dev, :test]},
      {:gettext, "~> 0.11"},
      {:phoenix, "~> 1.3.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_slime, "~> 0.8.0"},
      {:postgrex, ">= 0.0.0"},
      {:credo, "~> 0.9", only: [:dev, :test]},
      {:ex_doc, "~> 0.18.1"},
      {:excoveralls, "~> 0.8", only: :test},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false},
      {:earmark, "~> 1.2.5"},
      {:plug, "1.5.0"},
      {:swoosh, "~> 0.7"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end

  defp docs do
    [
      extras: ["README.md"],
      main: "readme",
      # groups_for_modules: groups_for_modules(),
      logo: "avatar.png"
    ]
  end
end
