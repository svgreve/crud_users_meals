defmodule CrudMeals.Meals.Delete do
  alias CrudMeals.{Error, Meal, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      # :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} -> do_call(uuid)
    end
  end

  defp do_call(id) do
    case Repo.get(Meal, id) do
      # nil -> {:error, %{status: :not_found, result: "Meal not found!"}}
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> Repo.delete(meal)
    end
  end
end
