defmodule FinancialOperationsElixir.Repo.Migrations.TransactionsAddAccountColumn do
  use Ecto.Migration

  def change do
    alter table("transactions") do
      add :account_id, references(:accounts, type: :uuid)
    end
  end
end
