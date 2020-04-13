use Mix.Config

# Configure your database
config :financial_operations_elixir, FinancialOperationsElixir.Repo,
  username: "postgres",
  password: "postgres",
  database: "financial_operations_elixir_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :financial_operations_elixir, FinancialOperationsElixirWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Decreasing a bit the security settings in that specific environment to speed up the testing
config :bcrypt_elixir, :log_rounds, 4
