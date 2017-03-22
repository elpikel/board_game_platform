defmodule BoardGame.Product do
  @moduledoc """
    Represents board game
  """
  use Ecto.Schema
  import Ecto.Changeset
  
  schema "product" do
    field :title, :string
    field :description, :string
    field :price, :float
    field :image, :string
    field :url, :string
    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:title, :description, :price, :image, :url])
    |> validate_required([:title, :description, :price, :image, :url])
  end
end
