defmodule FinancialOperationsElixir.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :fantasy_name, :string
      add :registration_number, :string, null: false, unique: true
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:companies, [:user_id])
  end
end
