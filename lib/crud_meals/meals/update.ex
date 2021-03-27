defmodule CrudMeals.Meals.Update do
  alias CrudMeals.{Error, Meal, Repo}
  alias Ecto.UUID

  def call(%{"id" => id} = params) do


    case UUID.cast(id) do
      # :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      :error -> {:error, Error.build_id_format_error()}
      {:ok, _uuid} -> do_call(params)
    end
  end

  defp do_call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      # nil -> {:error, %{status: :not_found, result: "Meal not found!"}}
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> update(meal, params)
    end
  end

  defp update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, meal}), do: {:ok, meal}

  defp handle_update({:error, result}) do
    # IO.inspect(result)
    # {:error, %{status: :bad_request, result: result}}
    {:error, Error.build(:bad_request, result)}
  end

end
