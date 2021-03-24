defmodule CrudMealsWeb.FallbackController do
  use CrudMealsWeb, :controller

  alias CrudMealsWeb.ErrorView

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render( "400.json", result: result)
  end
end
