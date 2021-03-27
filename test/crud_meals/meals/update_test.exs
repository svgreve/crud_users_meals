defmodule CrudMeals.Meals.UpdateTest do
  use CrudMeals.DataCase, async: true
  import CrudMeals.Factory

  alias CrudMeals.Meals.Update

  describe "call/1" do
    test "when the meal is found and parameters are all valid, updates it." do
      insert(:meal)
      id = "bb3c355f-8d10-4419-8550-2588710ba668"
      update_params = %{
        "id" => id,
        "calories" => 3000
      }
      assert {:ok, _result} = Update.call(update_params)
    end
    test "when the meal is found and any parameter is invalid, returns an error." do
      insert(:meal)
      id = "bb3c355f-8d10-4419-8550-2588710ba668"
      update_params = %{
        "id" => id,
        "calories" => 3500,
        "date_time" => "2021-04-31 10:00:00"
      }

      assert {:error, _reason} = Update.call(update_params)
    end
  end
end
