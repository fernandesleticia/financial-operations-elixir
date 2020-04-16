defmodule FinancialOperationsElixir.CurrenciesTest do
  use FinancialOperationsElixir.DataCase

  alias FinancialOperationsElixir.Currencies

  describe "currencies" do
    alias FinancialOperationsElixir.Currencies.Currency

    @valid_attrs %{name: "some name", symbol: "some symbol"}
    @update_attrs %{name: "some updated name", symbol: "some updated symbol"}
    @invalid_attrs %{name: nil, symbol: nil}

    def currency_fixture(attrs \\ %{}) do
      {:ok, currency} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Currencies.create_currency()

      currency
    end

    test "list_currencies/0 returns all currencies" do
      currency = currency_fixture()
      assert Currencies.list_currencies() == [currency]
    end

    test "get_currency!/1 returns the currency with given id" do
      currency = currency_fixture()
      assert Currencies.get_currency!(currency.id) == currency
    end

    test "create_currency/1 with valid data creates a currency" do
      assert {:ok, %Currency{} = currency} = Currencies.create_currency(@valid_attrs)
      assert currency.name == "some name"
      assert currency.symbol == "some symbol"
    end

    test "create_currency/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Currencies.create_currency(@invalid_attrs)
    end

    test "update_currency/2 with valid data updates the currency" do
      currency = currency_fixture()
      assert {:ok, %Currency{} = currency} = Currencies.update_currency(currency, @update_attrs)
      assert currency.name == "some updated name"
      assert currency.symbol == "some updated symbol"
    end

    test "update_currency/2 with invalid data returns error changeset" do
      currency = currency_fixture()
      assert {:error, %Ecto.Changeset{}} = Currencies.update_currency(currency, @invalid_attrs)
      assert currency == Currencies.get_currency!(currency.id)
    end

    test "delete_currency/1 deletes the currency" do
      currency = currency_fixture()
      assert {:ok, %Currency{}} = Currencies.delete_currency(currency)
      assert_raise Ecto.NoResultsError, fn -> Currencies.get_currency!(currency.id) end
    end

    test "change_currency/1 returns a currency changeset" do
      currency = currency_fixture()
      assert %Ecto.Changeset{} = Currencies.change_currency(currency)
    end
  end
end
