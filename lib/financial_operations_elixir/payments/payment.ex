defmodule FinancialOperationsElixir.Payments.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "payments" do
    field :tracking_code, :string
    field :value, :float
    field :beneficiary_id, :binary_id
    field :transaction_id, :binary_id
    field :batch_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:value, :tracking_code])
    |> validate_required([:value, :tracking_code])
  end
end
