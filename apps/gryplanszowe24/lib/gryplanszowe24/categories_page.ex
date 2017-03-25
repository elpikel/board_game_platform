defmodule Gryplanszowe24.CategoriesPage do
  def get_categories(url, download_page) do
    categories_page = download_page.(url)

    categories_page
    |> find_categories_block
    |> map_categories
  end

  defp find_categories_block(categories_page) do
    categories_page
    |> Floki.find("#categories_block_left")
    |> Floki.find("li")
  end

  defp map_categories(categories_html) do
    categories_html
    |> Enum.map(&Gryplanszowe24.CategoryHtml.get_category(&1))
  end
end
