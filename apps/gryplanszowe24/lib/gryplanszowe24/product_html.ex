defmodule Gryplanszowe24.ProductHtml do
  def get_product(product_html) do
    %Gryplanszowe24.Product{
      title: get_title(product_html),
      description: get_description(product_html),
      price: get_price(product_html),
      image: get_image(product_html),
      url: get_url(product_html)
    }
  end

  def get_title(product_html) do
    product_html
    |> Floki.find("h2")
    |> Floki.text
    |> String.trim
  end

  def get_description(product_html) do
    product_html
    |> Floki.find(".product_desc")
    |> Floki.text
    |> String.trim
  end

  def get_price(product_html) do
    price_html = product_html
    |> Floki.find(".price")
    |> Floki.text
    |> String.trim

    price = Enum.at(Regex.run(~r/[0-9]+[\,]*[0-9]*/, price_html), 0)

    price
    |> String.replace(",", ".")
    |> Float.parse
    |> elem(0)
  end

  def get_image(product_html) do
    product_html
    |> Floki.find(".product_img_link")
    |> Floki.find("img")
    |> Floki.attribute("src")
    |> Enum.at(0)
  end

  def get_url(product_html) do
    product_html
    |> Floki.find("#toppro")
    |> Floki.find("a")
    |> Floki.attribute("href")
    |> Enum.at(0)
  end
end
