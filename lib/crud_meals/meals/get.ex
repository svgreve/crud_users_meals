defmodule CrudMeals.Meals.Get do
  alias CrudMeals.{Meal, Repo}
  alias Ecto.UUID

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      {:ok, uuid} -> do_by_id(uuid)
    end
  end

  defp do_by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, %{status: :not_found, result: "Meal not found!"}}
      meal -> {:ok, meal}
    end
  end

end
