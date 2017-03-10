defmodule Gryplanszowe24.ProductsPage do
  def get_page_range(products_page) do
    page_numbers = products_page
    |> Floki.find(".pagination")
    |> Floki.find("li")

    last_number_html = Enum.drop(page_numbers, Enum.count(page_numbers) - 2)

    last_number_html
    |> Enum.take(1)
    |> Floki.find("a")
    |> Floki.text
    |> Integer.parse
    |> elem(0)
    |> create_page_range
  end

  def create_page_range(number_of_pages) do
    Enum.to_list(1..number_of_pages)
  end

  def get_products(products_page) do
    products_page
    |> get_products_html
    |> Enum.map(&Gryplanszowe24.ProductHtml.get_product(&1))
  end

  def get_products_html(products_page) do
    products_page
    |> Floki.find("#product_list")
    |> Floki.find(".ajax_block_product")
  end
end
