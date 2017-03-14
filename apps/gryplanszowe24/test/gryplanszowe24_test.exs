defmodule Gryplanszowe24Test do
  use ExUnit.Case
  use ExUnit.Case, async: true
  doctest Gryplanszowe24

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(BoardGame.Repo)
  end

  test "should get page" do
    Gryplanszowe24.update_products

    products = BoardGame.Repo.all(BoardGame.Product)

    assert Enum.count(products) == 401
  end
end
