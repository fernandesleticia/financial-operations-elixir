defmodule FinancialOperationsElixir.Batches do
  @moduledoc """
  The Batches context.
  """

  import Ecto.Query, warn: false
  alias FinancialOperationsElixir.Repo

  alias FinancialOperationsElixir.Batches.BatchPayment

  @doc """
  Returns the list of batch_payments.

  ## Examples

      iex> list_batch_payments()
      [%BatchPayment{}, ...]

  """
  def list_batch_payments do
    Repo.all(BatchPayment)
  end

  @doc """
  Gets a single batch_payment.

  Raises `Ecto.NoResultsError` if the Batch payment does not exist.

  ## Examples

      iex> get_batch_payment!(123)
      %BatchPayment{}

      iex> get_batch_payment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_batch_payment!(id), do: Repo.get!(BatchPayment, id)

  @doc """
  Creates a batch_payment.

  ## Examples

      iex> create_batch_payment(%{field: value})
      {:ok, %BatchPayment{}}

      iex> create_batch_payment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_batch_payment(attrs \\ %{}) do
    %BatchPayment{}
    |> BatchPayment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a batch_payment.

  ## Examples

      iex> update_batch_payment(batch_payment, %{field: new_value})
      {:ok, %BatchPayment{}}

      iex> update_batch_payment(batch_payment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_batch_payment(%BatchPayment{} = batch_payment, attrs) do
    batch_payment
    |> BatchPayment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a batch_payment.

  ## Examples

      iex> delete_batch_payment(batch_payment)
      {:ok, %BatchPayment{}}

      iex> delete_batch_payment(batch_payment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_batch_payment(%BatchPayment{} = batch_payment) do
    Repo.delete(batch_payment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking batch_payment changes.

  ## Examples

      iex> change_batch_payment(batch_payment)
      %Ecto.Changeset{source: %BatchPayment{}}

  """
  def change_batch_payment(%BatchPayment{} = batch_payment) do
    BatchPayment.changeset(batch_payment, %{})
  end
end
