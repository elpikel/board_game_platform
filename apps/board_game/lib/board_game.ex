defmodule BoardGame do
  @moduledoc """
    Documentation for BoardGame.
  """
  import Ecto.Query

  @doc """
    update_gryplanszowe24.
  """
  def update_products(products) do
    products
    |> Enum.each(fn(product) -> BoardGame.Repo.insert(product) end)
  end

  def update_categories(categories) do
    categories
    |> Enum.each(fn(category) -> BoardGame.Repo.insert(category) end)
  end

  def get_categories() do
    BoardGame.Repo.all(BoardGame.Category)
  end

  def get_products search_text do
    BoardGame.Repo.all(
      from product in BoardGame.Product,
      where: ilike(product.description, ^"%#{search_text}%") or ilike(product.title, ^"%#{search_text}%"))
  end

  def get_all_products do
    BoardGame.Repo.all(BoardGame.Product)
  end
end
