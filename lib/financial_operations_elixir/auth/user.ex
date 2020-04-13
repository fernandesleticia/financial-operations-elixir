defmodule FinancialOperationsElixir.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :is_active, :boolean, default: false
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    # Add support for microseconds at the language level
    # for this specific schema
    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :is_active, :password])
    |> validate_required([:email, :is_active, :password])
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  # runs the changeset through it
  # if the changeset happens to be valid and have a password key, it’ll use Bcrypt to hash it
  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset) do
    changeset
   end
end
