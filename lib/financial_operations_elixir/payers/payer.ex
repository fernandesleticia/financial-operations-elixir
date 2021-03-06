defmodule FinancialOperationsElixir.Payers.Payer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "payers" do
    field :account_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(payer, attrs) do
    payer
    |> cast(attrs, [:account_id])
    |> validate_required([:account_id])
    |> foreign_key_constraint(:account_id)
  end
end
