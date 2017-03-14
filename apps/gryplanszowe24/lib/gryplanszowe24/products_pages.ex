defmodule Gryplanszowe24.ProductsPages do
  @moduledoc """
    Provides basic functionality for product pages parsing
  """

  @spec get_products(String.t, (String.t -> String.t)) :: [%BoardGame.Product{}]
  def get_products(url, download_page) do
    products_page = download_page.(url)

    products_page
    |> Gryplanszowe24.ProductsPage.get_page_range
    |> Gryplanszowe24.Paraller.pmap(&parse_page(&1, download_page))
    |> Enum.concat
  end

  defp parse_page(page_number, download_page) do
    products_page_url = "http://www.gryplanszowe24.pl/639-gry-planszowe?p=#{page_number}"
    products_page = download_page.(products_page_url)

    Gryplanszowe24.ProductsPage.get_products(products_page)
  end
end
