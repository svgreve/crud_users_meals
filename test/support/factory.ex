defmodule CrudMeals.Factory do
  use ExMachina.Ecto, repo: CrudMeals.Repo

  alias CrudMeals.Meal

  def meal_params_factory do
    %{
      description: "Jantar",
      date_time: "2021-03-25 08:00:00",
      calories: 1870
    }
  end

  def meal_factory do
    %Meal{
      description: "Almoço",
      date_time: "2021-03-26 13:00:00",
      calories: 2300,
      id: "bb3c355f-8d10-4419-8550-2588710ba668"
    }
  end
end
