defmodule FinancialOperationsElixir.Transactions.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "transactions" do
    field :amount, :float
    field :final_amount, :float
    field :payer_value_date, :date
    field :tracking_code, :string

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :final_amount, :payer_value_date, :tracking_code])
    |> validate_required([:amount, :final_amount, :payer_value_date, :tracking_code])
  end
end
