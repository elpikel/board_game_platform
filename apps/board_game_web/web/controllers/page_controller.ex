defmodule BoardGameWeb.PageController do
  use BoardGameWeb.Web, :controller

  def index(conn, _params) do
    # get data from board_game_repo and display
    render conn, "index.html"
  end
end
