# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :board_game_web,
  ecto_repos: [BoardGameWeb.Repo]

# Configures the endpoint
config :board_game_web, BoardGameWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MKNklixohpzGMem92P//ZcprdZJ8yDOl/mce0qJdVe4IeXkCF8tDIRol/fkTL+3H",
  render_errors: [view: BoardGameWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BoardGameWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
