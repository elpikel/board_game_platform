defmodule BoardGameWeb.ProductController do
  use BoardGameWeb.Web, :controller

  def index(conn, %{"filter" => %{"search" => search_text}}) do
    products = BoardGame.get_products(search_text)
    categories = BoardGame.get_categories()

    render conn, "index.html", products: products, categories: categories
  end

  def index(conn, _params) do
    products = BoardGame.get_all_products()
    categories = BoardGame.get_categories()

    render conn, "index.html", products: products, categories: categories
  end
end
