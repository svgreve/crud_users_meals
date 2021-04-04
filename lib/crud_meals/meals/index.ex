defmodule CrudMeals.Meals.Index do

  alias CrudMeals.Error
  alias CrudMeals.Meal
  alias CrudMeals.Repo

  alias Ecto.UUID

  def call(user_id) do
    case UUID.cast(user_id) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} -> do_index(uuid)
    end
  end

  defp do_index(user_id), do: Repo.get_by(Meal, user_id: user_id)

end
