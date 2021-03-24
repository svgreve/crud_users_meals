defmodule CrudMeals.Meals.Create do
  alias CrudMeals.{Meal, Repo}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
  end
end
