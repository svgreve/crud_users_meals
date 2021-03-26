defmodule CrudMealsWeb.MealsControllerTest do
  use CrudMealsWeb.ConnCase, async: true
  import CrudMeals.Factory

  describe "create/2" do
    test "when all parameters are valid, creates the meal", %{conn: conn} do
      params = %{
        "description" => "Jantar",
        "date_time" => "2021-03-25 08:00:00",
        "calories" => 1870
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "meal" => %{
                 "calories" => 1870,
                 "date_time" => "2021-03-25T08:00:00",
                 "description" => "Jantar",
                 "id" => _id
               },
               "message" => "Meal created!"
             } = response
    end

    test "where are any errors, return the error", %{conn: conn} do
      params = %{
        "description" => "Jantar",
        "date_time" => "2021-03-32 08:00:00",
        "calories" => 1870
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"date_time" => ["is invalid"]}}

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a meal with a given id, deletes the meal", %{conn: conn} do
      id = "bb3c355f-8d10-4419-8550-2588710ba668"
      insert(:meal)

      # _conn = delete(conn, Routes.meals_path(conn, :delete, id))

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
