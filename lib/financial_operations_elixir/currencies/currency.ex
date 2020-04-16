defmodule FinancialOperationsElixir.Currencies.Currency do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "currencies" do
    field :name, :string, null: false
    field :symbol, :string, null: false

    timestamps()
  end

  @doc false
  def changeset(currency, attrs) do
    currency
    |> cast(attrs, [:symbol, :name])
    |> validate_required([:symbol, :name])
  end
end
