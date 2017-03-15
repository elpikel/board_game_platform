defmodule BoardGameWeb.PageController do
  use BoardGameWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
