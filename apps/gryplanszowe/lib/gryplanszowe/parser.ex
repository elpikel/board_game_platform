defmodule Gryplanszowe.Parser do
  def parse(html) do
    html
    |> get_products_html
    |> convert_to_products
  end

  def get_products_html(html) do
    html
    |> Floki.find("#product_list")
    |> Floki.find(".ajax_block_product")
  end

  def convert_to_products(html_products) do
    html_products
    |> Enum.map(&convert_to_product(&1))
  end

  def convert_to_product(html_product) do
    %Gryplanszowe.Product{
      title: get_title(html_product)
    }
  end

  def get_title(html_product) do
    html_product
    |> Floki.find("h2")
    |> Floki.text
  end
end
