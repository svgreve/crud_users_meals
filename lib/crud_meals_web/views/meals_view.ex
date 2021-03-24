defmodule CrudMealsWeb.MealsView do
  use CrudMealsWeb, :view

  alias CrudMeals.Meal

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created!",
      meal: meal
    }

  end
end
