defmodule CrudMealsWeb.MealsView do
  use CrudMealsWeb, :view

  alias CrudMeals.{Meal, Repo}

  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created!",
      meal: meal
    }
  end

  def render("show.json", %{meal: %Meal{} = meal}), do:  %{meal: meal}

end
