defmodule CrudMeals.Meals.DeleteTest do
  use CrudMeals.DataCase, async: true
  import CrudMeals.Factory

  alias CrudMeals.Meals.Delete

  describe "call/1" do
    test "when the meal is found, delete it." do
      insert(:meal)
      id = "bb3c355f-8d10-4419-8550-2588710ba668"
      assert {:ok, _meal} = Delete.call(id)
    end
    test "when the meal is not found, return an error." do
      insert(:meal)
      id = "bb3c355f-8d10-4419-xxxx-2588710ba668"
      assert {:error, _meal} = Delete.call(id)
    end
  end
end
