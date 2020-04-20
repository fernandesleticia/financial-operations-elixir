defmodule FinancialOperationsElixir.Repo.Migrations.CreatePayers do
  use Ecto.Migration

  def change do
    create table(:payers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :account_id, references(:accounts, on_delete: :nothing, type: :binary_id), null: false

      timestamps()
    end

    create index(:payers, [:account_id])
  end
end
