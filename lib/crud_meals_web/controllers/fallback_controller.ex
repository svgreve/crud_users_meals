defmodule CrudMealsWeb.FallbackController do
  use CrudMealsWeb, :controller

  alias CrudMeals.Error
  alias CrudMealsWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
