defmodule CrudMeals.Meals.Delete do
  alias CrudMeals.{Meal, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      {:ok, uuid} -> do_call(uuid)
    end
  end

  defp do_call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, %{status: :not_found, result: "Meal not found!"}}
      meal -> Repo.delete(meal)
    end
  end

end
