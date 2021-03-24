defmodule CrudMeals do
  @moduledoc """
  CrudMeals keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias CrudMeals.Meals.Create, as: MealsCreate

  defdelegate create_meal(params), to: MealsCreate, as: :call
end
