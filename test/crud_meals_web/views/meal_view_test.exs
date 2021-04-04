defmodule CrudMealsWeb.MealViewTest do
  use CrudMealsWeb.ConnCase, async: true

  import Phoenix.View
  import CrudMeals.Factory

  alias CrudMealsWeb.MealView

  test "renders create.json" do
    meal = build(:meal)

    response = render(MealView, "create.json", meal: meal)

    expected_response = %{
      meal: %CrudMeals.Meal{
        calories: 2300,
        date_time: "2021-03-26 13:00:00",
        description: "Almoço",
        id: "bb3c355f-8d10-4419-8550-2588710ba668",
        inserted_at: nil,
        updated_at: nil,
        user_id: "7cf8deca-dd36-40f3-8075-0b53ead1f895"
      },
      message: "Meal created!"
    }

    assert response == expected_response
  end

  test "renders show.json" do
    meal = build(:meal)

    response = render(MealView, "show.json", meal: meal)

    expected_response = %{
      meal: %CrudMeals.Meal{
        calories: 2300,
        date_time: "2021-03-26 13:00:00",
        description: "Almoço",
        id: "bb3c355f-8d10-4419-8550-2588710ba668",
        inserted_at: nil,
        updated_at: nil,
        user_id: "7cf8deca-dd36-40f3-8075-0b53ead1f895"
      }
    }

    assert response == expected_response
  end
end
