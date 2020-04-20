defmodule FinancialOperationsElixir.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :value, :float
      add :tracking_code, :string
      add :beneficiary_id, references(:beneficiaries, on_delete: :nothing, type: :binary_id)
      add :transaction_id, references(:transactions, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:payments, [:beneficiary_id])
    create index(:payments, [:transaction_id])
  end
end
