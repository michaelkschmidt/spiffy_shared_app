defmodule SpiffySharedApp.Mixfile do
  use Mix.Project

  def project do
    [
      app: :spiffy_shared_app,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {SpiffySharedApp.Application, []},
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
      {:bamboo, "~> 0.8"},
      {:bamboo_smtp, "~> 1.4.0"},

      # Tools - Compilers, Tasks, etc
      {:spiffy_tools, path: "./tools", runtime: false},

      {:absinthe,  github: "absinthe-graphql/absinthe", branch: "master", override: true},
      {:absinthe_plug, "~> 1.4.0"},
      {:absinthe_relay, "~> 1.4.0"},


      # Testing Frameworks
     {:ex_spec, "~> 2.0", runtime: false},
     {:mix_test_watch, "~> 0.5", only: :dev, runtime: false},
     {:eye_drops, "~> 1.3", runtime: false},
     {:fs, "~> 3.4", override: true},

     # Cobertura test coverage plugin
     {:cobertura_cover, "~> 0.9.0", only: :test, runtime: false},

     # Credo
     # See https://github.com/rrrene/elixir-style-guide
     {:credo, "~> 0.3", runtime: false},

     # Table display CLI
     {:table_rex, "~> 1.0.0"},

     {:timex, "~> 3.1"},
     {:tzdata, "~> 0.5.16", override: true},

     # Unit Tests
     {:mock, "~> 0.3.0", only: :test, runtime: false},

     # JUnit Output for Jenkins
     {:junit_formatter, github: "victorolinasc/junit-formatter", runtime: false},

     # Docs
     {:ex_doc, "~> 0.18.2", runtime: false},
     {:inch_ex, "~> 0.5", only: [:dev, :docs, :test]},

      # CBOR
      {:cbor, github: "yjh0502/cbor-erlang"},

      # ETS / DETS
      {:ex2ms, github: "ericmj/ex2ms"},

      # Authentication
      {:phoenix_ecto, "~> 3.2"},
      {:guardian, "~> 1.0"},

      {:sqlite_ecto2, "~> 2.2"},

      {:bcrypt_elixir, "~> 1.0.5"},
      {:ja_serializer, "~> 0.12"},
      {:httpoison, "~> 1.0.0", override: true},
      {:poison, "~> 3.1", override: true},

      # Metrics
      {:wobserver, "~> 0.1"},


      # Phoenix
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"}
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
end
