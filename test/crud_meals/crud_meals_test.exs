defmodule CrudMeals.Test do
  use CrudMeals.DataCase, async: true
  import CrudMeals.Factory

  alias CrudMeals

  describe "create_meal/1"  do
    test "when all parameters are valid, creates the meal record" do
      params = build(:meal_params)
      assert {:ok, _result} = CrudMeals.create_meal(params)
    end
    test "when any parameter is invalid, returns an error" do
      params = build(:meal_params)
      params = %{params | calories: "aaa"}
      assert {:error, _reason} = CrudMeals.create_meal(params)
    end

  end
end
