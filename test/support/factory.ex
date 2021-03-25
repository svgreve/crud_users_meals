defmodule CrudMeals.Factory do
  use ExMachina

  def meal_params_factory do
    %{
      description: "Jantar",
      date_time: "2021-03-25 08:00:00",
      calories: 1870
    }
  end
end
