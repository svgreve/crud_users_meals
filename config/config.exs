# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :crud_meals,
  ecto_repos: [CrudMeals.Repo]

config :crud_meals, CrudMeals.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :crud_meals, CrudMealsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JUBvJbL7Z3Z1oYLJ/2s+qFer4CFbq6jWaFqKHk27ZiJUYB97RZsimANrPr+uVFRL",
  render_errors: [view: CrudMealsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: CrudMeals.PubSub,
  live_view: [signing_salt: "JPEjrlyc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
