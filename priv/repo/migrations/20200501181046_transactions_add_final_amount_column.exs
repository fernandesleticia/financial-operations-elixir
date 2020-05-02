defmodule FinancialOperationsElixir.Repo.Migrations.TransactionsAddFinalAmountColumn do
  use Ecto.Migration

  def change do
    alter table("transactions") do
      add :final_amount, :float
    end
  end
end
