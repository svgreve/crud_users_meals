defmodule CrudMeals.Meals.GetTest do
  use CrudMeals.DataCase, async: true
  import CrudMeals.Factory

  alias CrudMeals.Meals.Get

  describe "by_id/1" do
    test "when the meal is found, shows it." do
      insert(:user)
      insert(:meal)
      id = "bb3c355f-8d10-4419-8550-2588710ba668"
      assert {:ok, _meal} = Get.by_id(id)
    end
    test "when the meal is not found, returns an error." do
      insert(:user)
      insert(:meal)
      id = "bb3c355f-8d10-4419-xxxx-2588710ba668"
      assert {:error, _meal} = Get.by_id(id)
    end
  end
end
