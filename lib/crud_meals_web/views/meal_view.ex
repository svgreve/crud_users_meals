defmodule CrudMealsWeb.MealView do
  use CrudMealsWeb, :view

  alias CrudMeals.Meal


  def render("create.json", %{meal: %Meal{} = meal}) do
    %{
      message: "Meal created!",
      meal: meal
    }
  end

  def render("show.json", %{meal: %Meal{} = meal}), do:  %{meal: meal}

  def render("index.json", %{meals: meals}) do
    %{data: render_many(meals, MealView, "meal.json")}
  end

  def render("meal.json", %{meal: meal}) do
    %{id: meal.id,
      description: meal.description,
      calories: meal.calories,
      date_time: meal.date_time}
  end
end
