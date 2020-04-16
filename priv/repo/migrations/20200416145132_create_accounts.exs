defmodule FinancialOperationsElixir.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :account_type, :string
      add :bank_code, :string
      add :branch_digit, :string
      add :branch_number, :string
      add :account_digit, :string
      add :account_number, :string
      add :person_id, references(:persons, on_delete: :nothing, type: :binary_id)
      add :company_id, references(:companies, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:accounts, [:person_id])
    create index(:accounts, [:company_id])
  end
end
