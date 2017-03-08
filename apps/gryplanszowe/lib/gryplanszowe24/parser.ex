defmodule Gryplanszowe24.Parser do
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
    %Gryplanszowe24.Product{
      title: get_title(html_product),
      description: get_description(html_product),
      price: get_price(html_product),
      image: get_image(html_product),
      url: get_url(html_product)
    }
  end

  def get_title(html_product) do
    html_product
    |> Floki.find("h2")
    |> Floki.text
    |> String.trim
  end

  def get_description(html_product) do
    html_product
    |> Floki.find(".product_desc")
    |> Floki.text
    |> String.trim
  end

  def get_price(html_product) do
    price = html_product
    |> Floki.find(".price")
    |> Floki.text
    |> String.trim

    Enum.at(Regex.run(~r/[0-9]+[\,]*[0-9]*/, price), 0)
    |> String.replace(",", ".")
    |> Float.parse
    |> elem(0)
  end

  def get_image(html_product) do
    ""
  end

  def get_url(html_product) do
    ""
  end
end
