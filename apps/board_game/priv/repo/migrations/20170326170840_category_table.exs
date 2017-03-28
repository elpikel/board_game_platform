defmodule BoardGame.Repo.Migrations.CategoryTable do
  use Ecto.Migration

  def change do
    create table(:category) do
      add :name, :string
      timestamps()
    end
  end
end
