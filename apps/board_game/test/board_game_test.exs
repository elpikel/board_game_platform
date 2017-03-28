defmodule BoardGameTest do
  use ExUnit.Case, async: true
  doctest BoardGame

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(BoardGame.Repo)
  end

  test "should save products" do
    BoardGame.Repo.delete_all(BoardGame.Product)
    BoardGame.update_products([%BoardGame.Product{title: "test"}])

    products = BoardGame.Repo.all(BoardGame.Product)

    assert Enum.count(products) == 1
  end

  test "should filter products by description and name" do
    BoardGame.update_products([
      %BoardGame.Product{title: "title", description: "description"},
      %BoardGame.Product{title: "ttt", description: "xxx"}
      ])

    products = BoardGame.get_products("xxx")

    assert Enum.count(products) == 1
  end

  test "should save categories" do
    BoardGame.update_categories([%BoardGame.Category{name: "cat 1"}, %BoardGame.Category{name: "cat 2"}])

    categories = BoardGame.get_categories()

    assert Enum.count(categories) == 2
  end
end
