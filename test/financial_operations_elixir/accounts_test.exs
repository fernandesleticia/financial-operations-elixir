defmodule FinancialOperationsElixir.AccountsTest do
  use FinancialOperationsElixir.DataCase

  alias FinancialOperationsElixir.Accounts

  describe "accounts" do
    alias FinancialOperationsElixir.Accounts.Account

    @valid_attrs %{account_digit: "some account_digit", account_number: "some account_number", account_type: "some account_type", bank_code: "some bank_code", branch_digit: "some branch_digit", branch_number: "some branch_number"}
    @update_attrs %{account_digit: "some updated account_digit", account_number: "some updated account_number", account_type: "some updated account_type", bank_code: "some updated bank_code", branch_digit: "some updated branch_digit", branch_number: "some updated branch_number"}
    @invalid_attrs %{account_digit: nil, account_number: nil, account_type: nil, bank_code: nil, branch_digit: nil, branch_number: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_account()

      account
    end

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Accounts.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Accounts.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Accounts.create_account(@valid_attrs)
      assert account.account_digit == "some account_digit"
      assert account.account_number == "some account_number"
      assert account.account_type == "some account_type"
      assert account.bank_code == "some bank_code"
      assert account.branch_digit == "some branch_digit"
      assert account.branch_number == "some branch_number"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, %Account{} = account} = Accounts.update_account(account, @update_attrs)
      assert account.account_digit == "some updated account_digit"
      assert account.account_number == "some updated account_number"
      assert account.account_type == "some updated account_type"
      assert account.bank_code == "some updated bank_code"
      assert account.branch_digit == "some updated branch_digit"
      assert account.branch_number == "some updated branch_number"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_account(account, @invalid_attrs)
      assert account == Accounts.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Accounts.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Accounts.change_account(account)
    end
  end
end
