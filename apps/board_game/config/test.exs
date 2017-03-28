use Mix.Config

config :board_game, BoardGame.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  adapter: Ecto.Adapters.Postgres,
  database: "board_game_repo_test",
  username: "hlethman",
  password: "",
  hostname: "localhost"
