defmodule FinancialOperationsElixir.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :amount, :float
      add :payer_value_date, :date
      add :currency_id, references(:currencies, on_delete: :nothing, type: :binary_id)
      add :payer_id, references(:payers, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:transactions, [:currency_id])
    create index(:transactions, [:payer_id])
  end
end
