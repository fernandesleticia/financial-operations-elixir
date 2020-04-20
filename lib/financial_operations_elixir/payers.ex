defmodule FinancialOperationsElixir.Payers do
  @moduledoc """
  The Payers context.
  """

  import Ecto.Query, warn: false
  alias FinancialOperationsElixir.Repo

  alias FinancialOperationsElixir.Payers.Payer

  @doc """
  Returns the list of payers.

  ## Examples

      iex> list_payers()
      [%Payer{}, ...]

  """
  def list_payers do
    Repo.all(Payer)
  end

  @doc """
  Gets a single payer.

  Raises `Ecto.NoResultsError` if the Payer does not exist.

  ## Examples

      iex> get_payer!(123)
      %Payer{}

      iex> get_payer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_payer!(id), do: Repo.get!(Payer, id)

  @doc """
  Creates a payer.

  ## Examples

      iex> create_payer(%{field: value})
      {:ok, %Payer{}}

      iex> create_payer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_payer(attrs \\ %{}) do
    %Payer{}
    |> Payer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a payer.

  ## Examples

      iex> update_payer(payer, %{field: new_value})
      {:ok, %Payer{}}

      iex> update_payer(payer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_payer(%Payer{} = payer, attrs) do
    payer
    |> Payer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a payer.

  ## Examples

      iex> delete_payer(payer)
      {:ok, %Payer{}}

      iex> delete_payer(payer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_payer(%Payer{} = payer) do
    Repo.delete(payer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking payer changes.

  ## Examples

      iex> change_payer(payer)
      %Ecto.Changeset{source: %Payer{}}

  """
  def change_payer(%Payer{} = payer) do
    Payer.changeset(payer, %{})
  end
end
