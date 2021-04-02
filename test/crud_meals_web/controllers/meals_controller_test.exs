defmodule CrudMealsWeb.MealsControllerTest do
  use CrudMealsWeb.ConnCase, async: true
  import CrudMeals.Factory

  describe "create/2" do
    test "when all parameters are valid, creates the meal", %{conn: conn} do
      insert(:user)
      params = %{
        "description" => "Jantar",
        "date_time" => "2021-03-25 08:00:00",
        "calories" => 1870,
        "user_id" => "7cf8deca-dd36-40f3-8075-0b53ead1f895"
      }

      conn = post(conn, Routes.meal_path(conn, :create, params))
      IO.inspect conn

      # response =
      #   conn
      #   |> post(Routes.user_meals_path(conn, :create, params))
      #   |> json_response(:created)

      # assert %{
      #          "meal" => %{
      #            "calories" => 1870,
      #            "date_time" => "2021-03-25T08:00:00",
      #            "description" => "Jantar",
      #            "id" => _id
      #          },
      #          "message" => "Meal created!"
      #        } = response
    end

    test "where are any errors, return the error", %{conn: conn} do
      insert(:user)
      params = %{
        "description" => "Jantar",
        "date_time" => "2021-03-32 08:00:00",
        "calories" => 1870,
        "user_id" => "7cf8deca-dd36-40f3-8075-0b53ead1f895"
      }

      response =
        conn
        |> post(Routes.user_meals_path(conn, :create), params)
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

    test "when an invalid id is given to delete a meal, returns an error", %{conn: conn} do
      insert(:meal)
      id = "bb3c355f-8d10-xxxx-8550-2588710ba668"

      # _conn = delete(conn, Routes.meals_path(conn, :delete, id))

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:bad_request)

      assert response == "{\"message\":\"Invalid UUID\"}"
    end

    test "when there is no meal to be deleted with the given id, returns an error", %{conn: conn} do
      insert(:meal)
      id = "0867166d-9606-4eea-9400-e34367e54a2c"

      # _conn = delete(conn, Routes.meals_path(conn, :delete, id))

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:not_found)

      assert response == "{\"message\":\"Meal not found\"}"
    end
  end

  describe "show/2" do
    test "when the given id corresponds to a meal, returns the record", %{conn: conn} do
      id = "bb3c355f-8d10-4419-8550-2588710ba668"
      insert(:meal)

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> response(:ok)

      expected_response =
        "{\"meal\":{\"id\":\"bb3c355f-8d10-4419-8550-2588710ba668\",\"description\":\"Almoço\",\"date_time\":\"2021-03-26T13:00:00\",\"calories\":2300}}"

      assert response == expected_response
    end

    test "when an invalid id is given to retrieved a meal, returns an error ", %{conn: conn} do
      insert(:meal)
      id = "0867166d-9606-4eea-9400-e34367e54a2c"

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> response(:not_found)

      assert response == "{\"message\":\"Meal not found\"}"
    end

    test "when an invalid id is given to get a meal, returns an error", %{conn: conn} do
      insert(:meal)
      id = "bb3c355f-8d10-xxxx-8550-2588710ba668"

      # _conn = delete(conn, Routes.meals_path(conn, :delete, id))

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> response(:bad_request)

      assert response == "{\"message\":\"Invalid UUID\"}"
    end
  end

  describe "update/2" do
    test "when all parameters are valid, update the meal record", %{conn: conn} do
      id = "bb3c355f-8d10-4419-8550-2588710ba668"
      insert(:meal)
      update_params = %{
        "id" => id,
        "calories" => 3500
      }

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, update_params))
        |> response(:ok)

      expected_response = "{\"meal\":{\"id\":\"bb3c355f-8d10-4419-8550-2588710ba668\",\"description\":\"Almoço\",\"date_time\":\"2021-03-26T13:00:00\",\"calories\":3500}}"
      assert response == expected_response
    end

    test "when any parameters are invalid, returns an error", %{conn: conn} do
      id = "bb3c355f-8d10-4419-8550-2588710ba668"
      insert(:meal)
      update_params = %{
        "id" => id,
        "calories" => "aaa"
      }

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, update_params))
        |> response(:bad_request)

      expected_response = "{\"message\":{\"calories\":[\"is invalid\"]}}"

       assert response == expected_response
    end

  end
end
