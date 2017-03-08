defmodule Gryplanszowe24.PageTraveler do

  def parse_every_page(url) do
    #http://www.gryplanszowe24.pl/639-gry-planszowe?p=1
    # get number of pages
    number_of_pages = get_number_of_pages(url)
  end

  def get_number_of_pages(url) do
    page_numbers = HTTPoison.get!(url).body
    |> Floki.find(".pagination")
    |> Floki.find("li")

    Enum.drop(page_numbers, Enum.count(page_numbers) - 2)
    |> Enum.take(1)
    |> Floki.find("a")
    |> Floki.text
    |> Integer.parse
    |> elem(0)
  end
end
