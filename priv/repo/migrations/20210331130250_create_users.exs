defmodule CrudMeals.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :cpf, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:users, [:cpf])

  end
end
