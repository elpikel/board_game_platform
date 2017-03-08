defmodule Gryplanszowe24.PageTravelerTest do
  use ExUnit.Case

  test "should get page count" do
    number_of_pages = Gryplanszowe24.PageTraveler.get_number_of_pages("http://www.gryplanszowe24.pl/639-gry-planszowe")

    assert number_of_pages == 11
  end
end
