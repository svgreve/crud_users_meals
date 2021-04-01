defmodule CrudMeals.Meals.Create do
  alias CrudMeals.{Error, Meal, Repo}

  def call(params) do
    IO.inspect(params)

    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, meal}), do: {:ok, meal}

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
