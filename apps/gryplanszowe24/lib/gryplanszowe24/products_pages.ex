defmodule Gryplanszowe24.ProductsPages do
  def get_products(url, download_page) do
    download_page.(url)
    |> Gryplanszowe24.ProductsPage.get_page_range
    |> Gryplanszowe24.Paraller.pmap(&parse_page(&1, download_page))
    |> Enum.concat
  end

  def parse_page(page_number, download_page) do
    products_page_url = "http://www.gryplanszowe24.pl/639-gry-planszowe?p=#{page_number}"
    productsPage = download_page.(products_page_url)

    Gryplanszowe24.ProductsPage.get_products(productsPage)
  end
end
