defmodule FinancialOperationsElixir.Customers.Person do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "persons" do
    field :first_name, :string
    field :identity_card_number, :string
    field :last_name, :string
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:first_name, :last_name, :identity_card_number])
    |> validate_required([:first_name, :last_name, :identity_card_number])
  end
end
