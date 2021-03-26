defmodule CrudMeals.Meals.CreateTest do
  use CrudMeals.DataCase, async: true
  import CrudMeals.Factory

  alias CrudMeals.{Error, Meal}
  alias CrudMeals.Meals.Create

  describe "call/1" do
    test "when all parameters are valid, returns the meal" do
      params = build(:meal_params)
      response = Create.call(params)
      assert {:ok, %Meal{id: _id, calories: 1870}} = response
    end

    test "when there are invalid parameters, returns an error" do
      params = build(:meal_params, %{date_time: "2012-03-32 08:00:00", calories: "aaa"})

      response = Create.call(params)
      expected_response = %{calories: ["is invalid"], date_time: ["is invalid"]}

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
