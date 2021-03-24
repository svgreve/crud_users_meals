defmodule CrudMealsWeb.MealsController do
  use CrudMealsWeb, :controller

  alias CrudMeals.Meal
  alias CrudMealsWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- CrudMeals.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end
end
