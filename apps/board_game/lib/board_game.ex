defmodule BoardGame do
  @moduledoc """
    Documentation for BoardGame.
  """

  @doc """
    update_gryplanszowe24.
  """
  def update_products(products) do
    products
    |> Enum.each(fn(product) -> BoardGame.Repo.insert(product) end)
  end
end
