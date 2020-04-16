defmodule FinancialOperationsElixir.Customers.Company do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "companies" do
    field :fantasy_name, :string
    field :name, :string
    field :registration_number, :string
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :fantasy_name, :registration_number])
    |> validate_required([:name, :fantasy_name, :registration_number])
  end
end
