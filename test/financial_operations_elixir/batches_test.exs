defmodule FinancialOperationsElixir.BatchesTest do
  use FinancialOperationsElixir.DataCase

  alias FinancialOperationsElixir.Batches

  describe "batch_payments" do
    alias FinancialOperationsElixir.Batches.BatchPayment

    @valid_attrs %{status: "some status", total_value: 120.5}
    @update_attrs %{status: "some updated status", total_value: 456.7}
    @invalid_attrs %{status: nil, total_value: nil}

    def batch_payment_fixture(attrs \\ %{}) do
      {:ok, batch_payment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Batches.create_batch_payment()

      batch_payment
    end

    test "list_batch_payments/0 returns all batch_payments" do
      batch_payment = batch_payment_fixture()
      assert Batches.list_batch_payments() == [batch_payment]
    end

    test "get_batch_payment!/1 returns the batch_payment with given id" do
      batch_payment = batch_payment_fixture()
      assert Batches.get_batch_payment!(batch_payment.id) == batch_payment
    end

    test "create_batch_payment/1 with valid data creates a batch_payment" do
      assert {:ok, %BatchPayment{} = batch_payment} = Batches.create_batch_payment(@valid_attrs)
      assert batch_payment.status == "some status"
      assert batch_payment.total_value == 120.5
    end

    test "create_batch_payment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Batches.create_batch_payment(@invalid_attrs)
    end

    test "update_batch_payment/2 with valid data updates the batch_payment" do
      batch_payment = batch_payment_fixture()
      assert {:ok, %BatchPayment{} = batch_payment} = Batches.update_batch_payment(batch_payment, @update_attrs)
      assert batch_payment.status == "some updated status"
      assert batch_payment.total_value == 456.7
    end

    test "update_batch_payment/2 with invalid data returns error changeset" do
      batch_payment = batch_payment_fixture()
      assert {:error, %Ecto.Changeset{}} = Batches.update_batch_payment(batch_payment, @invalid_attrs)
      assert batch_payment == Batches.get_batch_payment!(batch_payment.id)
    end

    test "delete_batch_payment/1 deletes the batch_payment" do
      batch_payment = batch_payment_fixture()
      assert {:ok, %BatchPayment{}} = Batches.delete_batch_payment(batch_payment)
      assert_raise Ecto.NoResultsError, fn -> Batches.get_batch_payment!(batch_payment.id) end
    end

    test "change_batch_payment/1 returns a batch_payment changeset" do
      batch_payment = batch_payment_fixture()
      assert %Ecto.Changeset{} = Batches.change_batch_payment(batch_payment)
    end
  end
end
