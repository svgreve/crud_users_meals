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

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- CrudMeals.get_meal(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", neal: meal)
    end
  end
end
