defmodule CrudMeals do
  @moduledoc """
  CrudMeals keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias CrudMeals.Meals.Create, as: MealsCreate
  alias CrudMeals.Meals.Get, as: MealsGet
  alias CrudMeals.Meals.Delete, as: MealsDelete
  alias CrudMeals.Meals.Update, as: MealsUpdate

  defdelegate create_meal(params), to: MealsCreate, as: :call
  defdelegate get_meal(id), to: MealsGet, as: :by_id
  defdelegate delete_meal(id), to: MealsDelete, as: :call
  defdelegate update_meal(params), to: MealsUpdate, as: :call
end
