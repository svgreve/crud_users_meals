defmodule CrudMealsWeb.MealController do
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

  def index(conn, %{"user_id" => user_id}) do
    meals = CrudMeals.index_user_meals(user_id)
    render(conn, "meals.json", meals: meals)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- CrudMeals.get_meal(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Meal{}} <- CrudMeals.delete_meal(id) do
      conn
      |> put_status(:no_content)
      # |> render("delete.json", meal: meal)
      |> text("")
    end
  end

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- CrudMeals.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", meal: meal)
    end
  end
end
