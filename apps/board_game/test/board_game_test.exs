defmodule BoardGameTest do
  use ExUnit.Case
  use ExUnit.Case, async: true
  doctest BoardGame

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(BoardGame.Repo)
  end

  test "should save products" do
    BoardGame.update_products([%BoardGame.Product{title: "test"}])

    products = BoardGame.Repo.all(BoardGame.Product)

    assert Enum.count(products) == 1
  end
end
