defmodule BoardGame.Repo.Migrations.AddCategoryToProduct do
  use Ecto.Migration

  def change do
    alter table(:product) do
      add :category_id, :integer
    end
  end
end
