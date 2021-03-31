defmodule CrudMeals.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add :description, :string
      add :date_time, :naive_datetime
      add :calories, :integer
      add :user_id, references(:users, type: :binary_id, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:meals, [:date_time])
  end
end
