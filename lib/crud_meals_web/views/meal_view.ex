defmodule CrudMealsWeb.MealView do
  use CrudMealsWeb, :view

  alias CrudMeals.Meal
  alias CrudMealsWeb.MealView

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created!",
      meal: meal
    }
  end

  def render("show.json", %{meal: %Meal{} = meal}), do: %{meal: meal}

end
