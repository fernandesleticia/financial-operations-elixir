defmodule FinancialOperationsElixir.Transactions.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "transactions" do
    field :amount, :float
    field :payer_value_date, :date
    field :currency_id, :binary_id
    field :payer_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :payer_value_date])
    |> validate_required([:amount, :payer_value_date])
  end
end
