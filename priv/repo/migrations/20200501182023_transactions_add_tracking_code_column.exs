defmodule FinancialOperationsElixir.Repo.Migrations.TransactionsAddTrackingCodeColumn do
  use Ecto.Migration

  def change do
    alter table("transactions") do
      add :tracking_code, :string
    end
  end
end
