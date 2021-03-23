defmodule CrudMeals.Repo do
  use Ecto.Repo,
    otp_app: :crud_meals,
    adapter: Ecto.Adapters.Postgres
end
