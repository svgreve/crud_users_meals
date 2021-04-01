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

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(CrudMealsWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end
end
