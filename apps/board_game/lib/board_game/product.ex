defmodule BoardGame.Product do
  @moduledoc """
    Represents board game
  """
  use Ecto.Schema

  schema "product" do
    field :title, :string
    field :description, :string
    field :price, :float
    field :image, :string
    field :url, :string
    timestamps()
  end
end
