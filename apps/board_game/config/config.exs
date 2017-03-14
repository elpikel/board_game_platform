# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :board_game, BoardGame.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  adapter: Ecto.Adapters.Postgres,
  database: "board_game_repo",
  username: "arpl",
  password: "",
  hostname: "localhost"


config :board_game, ecto_repos: [BoardGame.Repo]
