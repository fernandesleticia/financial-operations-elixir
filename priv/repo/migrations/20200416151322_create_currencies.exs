defmodule FinancialOperationsElixir.Repo.Migrations.CreateCurrencies do
  use Ecto.Migration

  def change do
    create table(:currencies, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :symbol, :string
      add :name, :string

      timestamps()
    end

  end
end
