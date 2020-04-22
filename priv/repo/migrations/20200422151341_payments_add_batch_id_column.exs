defmodule FinancialOperationsElixir.Repo.Migrations.PaymentsAddBatchIdColumn do
  use Ecto.Migration

  def change do
    alter table("payments") do
      add :batch_id, references(:batch_payments, on_delete: :nothing, type: :binary_id)
    end
  end
end
