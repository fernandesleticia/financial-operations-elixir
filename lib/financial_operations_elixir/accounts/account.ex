defmodule FinancialOperationsElixir.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accounts" do
    field :account_digit, :string
    field :account_number, :string
    field :account_type, :string
    field :bank_code, :string
    field :branch_digit, :string
    field :branch_number, :string
    field :person_id, :binary_id
    field :company_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:account_type, :bank_code, :branch_digit, :branch_number, :account_digit, :account_number])
    |> validate_required([:account_type, :bank_code, :branch_digit, :branch_number, :account_digit, :account_number])
  end
end
