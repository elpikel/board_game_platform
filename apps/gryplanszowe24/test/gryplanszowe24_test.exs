defmodule Gryplanszowe24Test do
  use ExUnit.Case
  use ExUnit.Case, async: true
  use Timex

  doctest Gryplanszowe24

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(BoardGame.Repo)
  end

  test "should get page" do
    Gryplanszowe24.start_link
    Gryplanszowe24.handle_cast(:update_products, Timex.shift(Timex.now, minutes: -5))

    products = BoardGame.Repo.all(BoardGame.Product)

    assert Enum.count(products) == 418
  end
end
