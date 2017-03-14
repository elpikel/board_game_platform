defmodule BoardGame.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:product) do
      add :title, :string
      add :description, :text
      add :price, :float
      add :image, :string
      add :url, :string
      timestamps()
    end
  end
end
