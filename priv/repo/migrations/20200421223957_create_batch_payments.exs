defmodule FinancialOperationsElixir.Repo.Migrations.CreateBatchPayments do
  use Ecto.Migration

  def change do
    create table(:batch_payments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :total_value, :float
      add :status, :string
      add :currency_id, references(:currencies, on_delete: :nothing, type: :binary_id)
      add :payer_id, references(:payers, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:batch_payments, [:currency_id])
    create index(:batch_payments, [:payer_id])
  end
end
