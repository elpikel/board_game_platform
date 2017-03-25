defmodule BoardGame.Category do
  @moduledoc """
    Represents board game
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "category" do
    field :name, :string
    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
