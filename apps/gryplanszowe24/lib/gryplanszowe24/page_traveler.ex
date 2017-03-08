defmodule Gryplanszowe24.PageTraveler do

  def parse_every_page(url, download_page) do
    download_page.(url)
    |> get_number_of_pages
    |> create_page_range
    |> Enum.map(&parse_page(&1, download_page))
    |> Enum.concat
  end

  def get_number_of_pages(html) do
    page_numbers = html
    |> Floki.find(".pagination")
    |> Floki.find("li")

    Enum.drop(page_numbers, Enum.count(page_numbers) - 2)
    |> Enum.take(1)
    |> Floki.find("a")
    |> Floki.text
    |> Integer.parse
    |> elem(0)
  end

  def create_page_range(number_of_pages) do
    Enum.to_list(1..number_of_pages)
  end

  def parse_page(page_number, download_page) do
    page_url = "http://www.gryplanszowe24.pl/639-gry-planszowe?p=#{page_number}"
    page_body = download_page.(page_url)

    Gryplanszowe24.Parser.parse(page_body)
  end
end
