defmodule BoardGameWeb.ProductController do
  use BoardGameWeb.Web, :controller

  def index(conn, %{"filter" => %{"search" => search_text}}) do
    products = BoardGame.get_products(search_text)
    render conn, "index.html", products: products
  end

  def index(conn, _params) do
    products = BoardGame.get_all_products()
    render conn, "index.html", products: products
  end
end
