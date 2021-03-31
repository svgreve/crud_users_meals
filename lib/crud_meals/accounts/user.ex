defmodule CrudMeals.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias CrudMeals.Meal

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:cpf, :email, :name]

  @derive {Jason.Encoder, only: [:id, :cpf, :email, :name]}

  schema "users" do
    field :cpf, :string
    field :email, :string
    field :name, :string
    has_many(:meals, Meal, on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:cpf])
    |> cast_assoc(:meals)
  end
end
