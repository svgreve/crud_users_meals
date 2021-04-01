defmodule CrudMeals.Meals.Get do
  alias CrudMeals.{Error, Meal, Repo}
  alias Ecto.UUID

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_error()}
      {:ok, uuid} -> do_by_id(uuid)
    end
  end

  defp do_by_id(id) do
    case (Repo.get(Meal, id) |> Repo.preload([:user])) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> {:ok, meal}
    end
  end

end
