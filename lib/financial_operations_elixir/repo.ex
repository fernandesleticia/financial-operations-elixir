defmodule FinancialOperationsElixir.Repo do
  use Ecto.Repo,
    otp_app: :financial_operations_elixir,
    adapter: Ecto.Adapters.Postgres
end
