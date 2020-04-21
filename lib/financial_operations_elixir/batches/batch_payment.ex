defmodule FinancialOperationsElixir.Batches.BatchPayment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "batch_payments" do
    field :status, :string
    field :total_value, :float
    field :currency_id, :binary_id
    field :payer_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(batch_payment, attrs) do
    batch_payment
    |> cast(attrs, [:total_value, :status])
    |> validate_required([:total_value, :status])
  end
end
