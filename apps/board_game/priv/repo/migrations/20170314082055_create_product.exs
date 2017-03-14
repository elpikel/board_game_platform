defmodule BoardGame.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:product) do
      add :title, :string
      add :description, :string
      add :price, :float
      add :image, :string
      add :url, :string
    end
  end
end
