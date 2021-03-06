# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :financial_operations_elixir,
  ecto_repos: [FinancialOperationsElixir.Repo],
  generators: [binary_id: true]

# Add support for microseconds at the DB level
# this avoids having to configure it on every migration file
config :financial_operations_elixir, FinancialOperationsElixir.Repo, migration_timestamps: [type: :utc_datetime_usec]

# Configures the endpoint
config :financial_operations_elixir, FinancialOperationsElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "idST1ZMeVrc0Pfq/B3qBU7YutdvF3AtR621aJ6hC6tI7IGeppE91DinGYalUAR+g",
  render_errors: [view: FinancialOperationsElixirWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FinancialOperationsElixir.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
