defmodule BoardGameWeb.PageController do
  use BoardGameWeb.Web, :controller

  def index(conn, _params) do
    products = BoardGame.get_products
    render conn, "index.html", products: products
  end
end
