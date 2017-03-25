defmodule Gryplanszowe24.CategoryHtml do
  def get_category(category_html) do
    %BoardGame.Category{name: get_name(category_html)}
  end

  defp get_name(category_html) do
    category_html
    |> Floki.text
    |> String.trim
  end
end
