# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :spiffy_shared_app,
  ecto_repos: [SpiffySharedApp.Repo]

# Configures the endpoint
config :spiffy_shared_app, SpiffySharedAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "h/BJc0bIqjUmP+LcPueIfwcN0jTl+MGff/MgfLiHnJ9PfpRf2BMkiofhsGBTUtOE",
  render_errors: [view: SpiffySharedAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SpiffySharedApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
