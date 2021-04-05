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
  alias CrudMeals.Meals.Index, as: MealsIndex
  alias CrudMeals.Accounts

  defdelegate create_user(params), to: Accounts, as: :create_user
  defdelegate update_user(params), to: Accounts, as: :update_user
  defdelegate delete_user(params), to: Accounts, as: :delete_user
  defdelegate get_user(id), to: Accounts, as: :get_user!
  defdelegate all_users(), to: Accounts, as: :list_users

  defdelegate create_meal(params), to: MealsCreate, as: :call
  defdelegate get_meal(id), to: MealsGet, as: :by_id
  defdelegate delete_meal(id), to: MealsDelete, as: :call
  defdelegate update_meal(params), to: MealsUpdate, as: :call
  defdelegate index_user_meals(id), to: MealsIndex, as: :call

end
