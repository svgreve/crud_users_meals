defmodule CrudMeals.MealTest do
  use CrudMeals.DataCase, async: true
  import CrudMeals.Factory
  alias CrudMeals.Meal
  alias Ecto.Changeset

  describe "changeset/2" do
    test "when all parameters are valid, returns a valid changeset" do
      # params = %{
      #   description: "Jantar",
      #   date_time: "2021-03-24 08:00:00",
      #   calories: 1870
      # }

      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{changes: %{calories: 1870}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      # params = %{
      #   description: "Jantar",
      #   date_time: "2021-03-24 08:00:00",
      #   calories: 1870
      # }

      params = build(:meal_params)

      update_params = %{calories: 2000}

      response =
        params
        |> Meal.changeset()
        |> Meal.changeset(update_params)

      assert %Changeset{changes: %{calories: 2000}, valid?: true} = response
    end

    test "when date_time is invalid, returns an error" do
      # params = %{
      #   description: "Jantar",
      #   date_time: "2021-03-32 08:00:00",
      #   calories: 1870
      # }

      params = build(:meal_params, %{date_time: "2012-03-32 08:00:00"})

      response = Meal.changeset(params)
      expected_response = %{date_time: ["is invalid"]}

      assert errors_on(response) == expected_response
    end

    test "when date_time and calories are invalid, returns an error" do
      # params = %{
      #   description: "Jantar",
      #   date_time: "2021-03-32 08:00:00",
      #   calories: "aa"
      # }

      params = build(:meal_params, %{date_time: "2012-03-32 08:00:00", calories: "aaa"})

      response = Meal.changeset(params)
      expected_response = %{date_time: ["is invalid"], calories: ["is invalid"]}

      assert errors_on(response) == expected_response
    end
  end
end
