defmodule GryplanszoweTest do
  use ExUnit.Case
  doctest Gryplanszowe

  test "should get page" do
    Gryplanszowe.get_games
  end
end
