defmodule FinancialOperationsElixir.Beneficiaries do
  @moduledoc """
  The Beneficiaries context.
  """

  import Ecto.Query, warn: false
  alias FinancialOperationsElixir.Repo

  alias FinancialOperationsElixir.Beneficiaries.Beneficiary

  @doc """
  Returns the list of beneficiaries.

  ## Examples

      iex> list_beneficiaries()
      [%Beneficiary{}, ...]

  """
  def list_beneficiaries do
    Repo.all(Beneficiary)
  end

  @doc """
  Gets a single beneficiary.

  Raises `Ecto.NoResultsError` if the Beneficiary does not exist.

  ## Examples

      iex> get_beneficiary!(123)
      %Beneficiary{}

      iex> get_beneficiary!(456)
      ** (Ecto.NoResultsError)

  """
  def get_beneficiary!(id), do: Repo.get!(Beneficiary, id)

  @doc """
  Creates a beneficiary.

  ## Examples

      iex> create_beneficiary(%{field: value})
      {:ok, %Beneficiary{}}

      iex> create_beneficiary(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_beneficiary(attrs \\ %{}) do
    %Beneficiary{}
    |> Beneficiary.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a beneficiary.

  ## Examples

      iex> update_beneficiary(beneficiary, %{field: new_value})
      {:ok, %Beneficiary{}}

      iex> update_beneficiary(beneficiary, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_beneficiary(%Beneficiary{} = beneficiary, attrs) do
    beneficiary
    |> Beneficiary.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a beneficiary.

  ## Examples

      iex> delete_beneficiary(beneficiary)
      {:ok, %Beneficiary{}}

      iex> delete_beneficiary(beneficiary)
      {:error, %Ecto.Changeset{}}

  """
  def delete_beneficiary(%Beneficiary{} = beneficiary) do
    Repo.delete(beneficiary)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking beneficiary changes.

  ## Examples

      iex> change_beneficiary(beneficiary)
      %Ecto.Changeset{source: %Beneficiary{}}

  """
  def change_beneficiary(%Beneficiary{} = beneficiary) do
    Beneficiary.changeset(beneficiary, %{})
  end
end
